# frozen_string_literal: true

module Faker
  class Music
    class ImagineDragons < Base
      class << self
        def member
          fetch('imagine_dragons.members')
        end

        def album
          fetch('imagine_dragons.albums')
        end

        def song
          fetch('imagine_dragons.songs')
        end
      end
    end
  end
end
