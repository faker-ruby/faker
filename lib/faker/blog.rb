module Faker
  class Blog < Base
    class << self
      def author
        {
          name: Faker::Name.unique.name,
          email: Faker::Internet.unique.email
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
          email: Faker::Internet.email,
          body: translate('faker.blog.comment').sample,
          post: post
        }
      end

      def nickname
        translate('faker.blog.nickname').sample
      end

      def title
        translate('faker.blog.title').sample
      end

      def body
        translate('faker.blog.body').sample
      end
    end
  end
end
