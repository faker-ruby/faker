# frozen_string_literal: true

def assert_not_english(word)
  assert_not_match(/[a-zA-Z]/, word)
end
