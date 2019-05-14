# encoding: utf-8
# frozen_string_literal: true

RSpec.describe TTY::Tree::HashWalker do
  it "walks hash data and collects nodes" do
    data = {
      dir1: [
        'config.dat',
        { dir2: [
          { dir3: [ 'file3-1.txt' ] },
          'file2-1.txt'
          ]
        },
        'file1-1.txt',
        'file1-2.txt'
      ]
    }

    walker = TTY::Tree::HashWalker.new

    walker.traverse(data)

    expect(walker.nodes).to eq([
      TTY::Tree::Node.new('dir1', '', '', 0),
      TTY::Tree::Node.new('config.dat', 'dir1', '', 1),
      TTY::Tree::Node.new('dir2', 'dir1', '', 1),
      TTY::Tree::Node.new('dir3', 'dir1/dir2', ':pipe', 2),
      TTY::Tree::LeafNode.new('file3-1.txt', 'dir1/dir2/dir3', ':pipe:pipe', 3),
      TTY::Tree::LeafNode.new('file2-1.txt', 'dir1/dir2', ':pipe', 2),
      TTY::Tree::Node.new('file1-1.txt', 'dir1', '', 1),
      TTY::Tree::LeafNode.new('file1-2.txt', 'dir1', '', 1),
    ])

    expect(walker.nodes.map(&:full_path).map(&:to_s)).to eq([
      "dir1",
      "dir1/config.dat",
      "dir1/dir2",
      "dir1/dir2/dir3",
      "dir1/dir2/dir3/file3-1.txt",
      "dir1/dir2/file2-1.txt",
      "dir1/file1-1.txt",
      "dir1/file1-2.txt",
    ])
  end

  it "walks path tree and collects nodes up to max level" do
    data = {
      dir1: [
        'config.dat',
        { dir2: [
          { dir3: [ 'file3-1.txt' ] },
          'file2-1.txt'
          ]
        },
        'file1-1.txt',
        'file1-2.txt'
      ]
    }

    walker = TTY::Tree::HashWalker.new(level: 2)

    walker.traverse(data)

    expect(walker.nodes.map(&:full_path).map(&:to_s)).to eq([
      "dir1",
      "dir1/config.dat",
      "dir1/dir2",
      "dir1/dir2/file2-1.txt",
      "dir1/file1-1.txt",
      "dir1/file1-2.txt",
    ])
  end

  it "doesn't walks path tree exceeding file limit" do
    data = {
      orphan_dir: [
        'a.txt',
        'b.txt',
        { data: [
            'data1.bin',
            'data2.sql',
            'data3.inf',
            'data4.csv'
          ]
        }
      ]
    }

    walker = TTY::Tree::HashWalker.new(file_limit: 3)

    walker.traverse(data)

    expect(walker.nodes.map(&:full_path).map(&:to_s)).to eq([
      "orphan_dir",
      "orphan_dir/a.txt",
      "orphan_dir/b.txt",
      "orphan_dir/data"
    ])
  end

  it "counts files & dirs" do
    data = {
      dir1: [
        'config.dat',
        { dir2: [
          { dir3: [ 'file3-1.txt' ] },
          'file2-1.txt'
          ]
        },
        'file1-1.txt',
        'file1-2.txt'
      ]
    }
    walker = TTY::Tree::HashWalker.new

    walker.traverse(data)

    expect(walker.files_count).to eq(5)

    expect(walker.dirs_count).to eq(2)
  end
end
