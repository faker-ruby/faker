module Unicode
  module DisplayWidth
    VERSION = '1.4.1'
    UNICODE_VERSION = "11.0.0".freeze
    DATA_DIRECTORY = File.expand_path(File.dirname(__FILE__) + '/../../../data/').freeze
    INDEX_FILENAME = (DATA_DIRECTORY + '/display_width.marshal.gz').freeze
  end
end
