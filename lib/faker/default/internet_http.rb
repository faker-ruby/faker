# frozen_string_literal: true

module Faker
  class Internet
    class HTTP < Base
      STATUS_CODES = {
        information: [100, 101, 102, 103],
        successful: [200, 201, 202, 203, 204, 205, 206, 207, 208, 226],
        redirect: [300, 301, 302, 303, 304, 305, 306, 307, 308],
        client_error: [400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412,
                       413, 414, 415, 416, 417, 418, 421, 422, 423, 424, 425, 426, 428,
                       429, 431, 451],
        server_error: [500, 501, 502, 503, 504, 505, 506, 507, 508, 510, 511]
      }.freeze

      class << self
        def status_code
          STATUS_CODES[STATUS_CODES.keys.sample].sample
        end

        %i[information successful redirect client_error server_error].each do |status_code_group|
          define_method("#{status_code_group}_status_code") do
            STATUS_CODES[status_code_group].sample
          end
        end
      end
    end
  end
end
