module Faker
  class Blog < Base
    class << self
      def author
        {
          name: self.name,
          email: self.email
        }
      end

      def post(author = nil)
        {
          title: self.title,
          body: self.body,
          author: author
        }
      end

      def comment(post = nil)
        {
          nickname: self.nickname,
          email: self.email,
          body: self.body,
          post: post
        }
      end

      def name
        Faker::Name.name
      end

      def email
        Faker::Internet.email
      end

      def nickname
        l = translate('faker.blog.nickname').length
        i = Faker::Config.random.rand(l)
        translate('faker.blog.nickname')[i]
      end

      def title
        Faker::Lorem.sentence
      end

      def body
        Faker::Lorem.paragraph
      end
    end
  end
end
