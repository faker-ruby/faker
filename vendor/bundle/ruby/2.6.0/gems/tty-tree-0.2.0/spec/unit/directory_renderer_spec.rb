# encoding: utf-8
# frozen_string_literal: true

RSpec.describe TTY::Tree::DirectoryRenderer do
  it "renders directory as path" do
    tree = within_dir(fixtures_path) do
      TTY::Tree.new('dir1')
    end

    expect(tree.render).to eq([
      "dir1\n",
      "├── config.dat\n",
      "├── dir2\n",
      "│   ├── dir3\n",
      "│   │   └── file3-1.txt\n",
      "│   └── file2-1.txt\n",
      "├── file1-1.txt\n",
      "└── file1-2.txt\n",
    ].join)
  end

  it "renders hash data as path " do
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

    tree = TTY::Tree.new(data)

    expect(tree.render).to eq([
      "dir1\n",
      "├── config.dat\n",
      "├── dir2\n",
      "│   ├── dir3\n",
      "│   │   └── file3-1.txt\n",
      "│   └── file2-1.txt\n",
      "├── file1-1.txt\n",
      "└── file1-2.txt\n",
    ].join)
  end

  it "correctly renders orphaned directory as path" do
    tree = within_dir(fixtures_path) do
      TTY::Tree.new('orphan_dir')
    end

    expect(tree.render).to eq([
      "orphan_dir\n",
      "├── a.txt\n",
      "├── b.txt\n",
      "└── data\n",
      "    ├── data1.bin\n",
      "    ├── data2.sql\n",
      "    └── data3.inf\n",
    ].join)
  end

  it "correctly renders hash with orphaned directory as path" do
    data = {
      orphan_dir: [
        'a.txt',
        'b.txt',
        { data: [
            'data1.bin',
            'data2.sql',
            'data3.inf'
          ]
        }
      ]
    }

    tree = TTY::Tree.new(data)

    expect(tree.render).to eq([
      "orphan_dir\n",
      "├── a.txt\n",
      "├── b.txt\n",
      "└── data\n",
      "    ├── data1.bin\n",
      "    ├── data2.sql\n",
      "    └── data3.inf\n",
    ].join)
  end

  it "renders directory as path without indentation" do
    tree = within_dir(fixtures_path) do
      TTY::Tree.new('dir1')
    end

    expect(tree.render(indent: 0)).to eq([
      "dir1\n",
      "├── config.dat\n",
      "├── dir2\n",
      "│├── dir3\n",
      "││└── file3-1.txt\n",
      "│└── file2-1.txt\n",
      "├── file1-1.txt\n",
      "└── file1-2.txt\n",
    ].join)
  end

  it "renders directory without hidden files" do
    tree = within_dir(fixtures_path) do
      TTY::Tree.new('hidden_dir', show_hidden: true)
    end

    expect(tree.render).to eq([
      "hidden_dir\n",
      "├── .with_dot\n",
      "│   └── config.dat\n",
      "├── dir1\n",
      "│   ├── .file1.2\n",
      "│   ├── dir1.1\n",
      "│   │   └── .file1.1.1\n",
      "│   ├── dir1.2\n",
      "│   │   └── file1.2.1\n",
      "│   └── file1.1\n",
      "└── dir2\n",
      "    └── .file2.1\n",
    ].join)
  end

  it "renders directory with only dirs" do
    tree = within_dir(fixtures_path) do
      TTY::Tree.new('hidden_dir', only_dirs: true)
    end

    expect(tree.render).to eq([
      "hidden_dir\n",
      "├── dir1\n",
      "│   ├── dir1.1\n",
      "│   └── dir1.2\n",
      "└── dir2\n",
    ].join)
  end

  it "renders directory with only dirs including hidden ones" do
    tree = within_dir(fixtures_path) do
      TTY::Tree.new('hidden_dir', only_dirs: true, show_hidden: true)
    end

    expect(tree.render).to eq([
      "hidden_dir\n",
      "├── .with_dot\n",
      "├── dir1\n",
      "│   ├── dir1.1\n",
      "│   └── dir1.2\n",
      "└── dir2\n",
    ].join)
  end

  it "doesn't show dirs with files exceeding limit" do
    tree = within_dir(fixtures_path) do
      TTY::Tree.new('large_dir', file_limit: 4)
    end

    expect(tree.render).to eq([
      "large_dir\n",
      "├── huge_dir\n",
      "├── large1\n",
      "├── large2\n",
      "└── large3\n",
    ].join)
  end
end
