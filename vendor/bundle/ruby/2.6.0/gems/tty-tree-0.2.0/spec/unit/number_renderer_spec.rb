# encoding: utf-8

RSpec.describe TTY::Tree::NumberRenderer do
  it "renders directory as numbers" do
    tree = within_dir(fixtures_path) do
      TTY::Tree.new('dir1')
    end

    expect(tree.render(as: :number)).to eq([
      "dir1\n",
      "1.1 config.dat\n",
      "1.2 dir2\n",
      "    2.3 dir3\n",
      "        3.4 file3-1.txt\n",
      "    2.5 file2-1.txt\n",
      "1.6 file1-1.txt\n",
      "1.7 file1-2.txt\n",
    ].join)
  end

  it "renders hash data as numbers" do
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

    expect(tree.render(as: :number)).to eq([
      "dir1\n",
      "1.1 config.dat\n",
      "1.2 dir2\n",
      "    2.3 dir3\n",
      "        3.4 file3-1.txt\n",
      "    2.5 file2-1.txt\n",
      "1.6 file1-1.txt\n",
      "1.7 file1-2.txt\n",
    ].join)
  end

  it "renders directory as numbers without indentation" do
    tree = within_dir(fixtures_path) do
      TTY::Tree.new('dir1')
    end

    expect(tree.render(as: :number, indent: 0)).to eq([
      "dir1\n",
      "1.1 config.dat\n",
      "1.2 dir2\n",
      "2.3 dir3\n",
      "3.4 file3-1.txt\n",
      "2.5 file2-1.txt\n",
      "1.6 file1-1.txt\n",
      "1.7 file1-2.txt\n",
    ].join)
  end
end
