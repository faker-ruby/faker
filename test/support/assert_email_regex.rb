# frozen_string_literal: true

def assert_email_regex(first_name, last_name, email)
  sanitized_first_name = first_name&.gsub("'", '')
  sanitized_last_name = last_name&.gsub("'", '')

  regex = email_regex(sanitized_first_name, sanitized_last_name)

  assert_match(regex, email)
end

def email_regex(first_name, last_name)
  /(#{first_name}([_.])?#{last_name}|#{last_name}([_.])?#{first_name})@(.*)\.(example|test)/i
end
