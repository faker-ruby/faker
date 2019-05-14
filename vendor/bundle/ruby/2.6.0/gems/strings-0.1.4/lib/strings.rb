# frozen_string_literal: true

require 'strings-ansi'

require_relative 'strings/align'
require_relative 'strings/fold'
require_relative 'strings/pad'
require_relative 'strings/truncate'
require_relative 'strings/wrap'
require_relative 'strings/version'

module Strings
  # Align text within the width.
  #
  # @see Strings::Align#align
  #
  # @api public
  def align(*args)
    Align.align(*args)
  end
  module_function :align

  # Align text left within the width.
  #
  # @see Strings::Align#align_left
  #
  # @api public
  def align_left(*args)
    Align.align_left(*args)
  end
  module_function :align_left

  # Align text with the width.
  #
  # @see Strings::Align#align
  #
  # @api public
  def align_center(*args)
    Align.align_center(*args)
  end
  module_function :align_center

  # Align text with the width.
  #
  # @see Strings::Align#align
  #
  # @api public
  def align_right(*args)
    Align.align_right(*args)
  end
  module_function :align_right

  # Check if string contains ANSI codes
  #
  # @see Strings::ANSI#ansi?
  #
  # @api public
  def ansi?(string)
    ANSI.ansi?(string)
  end
  module_function :ansi?

  # Remove any line break characters from the text
  #
  # @see Strings::Fold#fold
  #
  # @api public
  def fold(*args)
    Fold.fold(*args)
  end
  module_function :fold

  # Apply padding to multiline text with ANSI codes
  #
  # @see Strings::Pad#pad
  #
  # @api public
  def pad(*args)
    Pad.pad(*args)
  end
  module_function :pad

  # Remove ANSI codes from the string
  #
  # @see Strings::ANSI#sanitize
  #
  # @api public
  def sanitize(string)
    ANSI.sanitize(string)
  end
  module_function :sanitize

  # Truncate a text at a given length
  #
  # @see Strings::Truncate#truncate
  #
  # @api public
  def truncate(*args)
    Truncate.truncate(*args)
  end
  module_function :truncate

  # Wrap a text into lines at wrap length
  #
  # @see Strings::Wrap#wrap
  #
  # @api public
  def wrap(*args)
    Wrap.wrap(*args)
  end
  module_function :wrap
end # Strings
