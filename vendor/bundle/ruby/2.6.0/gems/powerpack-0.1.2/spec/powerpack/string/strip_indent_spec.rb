require 'spec_helper'

describe 'String#strip_indent' do
  it 'strips leading indent on every line of string' do
    test = <<-END
    test
     test
      test
    END

    expect(test.strip_indent).to eq("test\n test\n  test\n")
  end
end
