module Faker
	class SlackEmoji < Base
		flexible :slack_emoji

		class << self
			def smile
				fetch('slack_emoji.smile')
			end
		end

	end
end
