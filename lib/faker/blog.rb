module Faker
  class Blog < Base
    class << self      
      def author
        {
          name: Faker::Name.unique.name,
          email: Faker::Internet.unique.email
        }
      end

      def post
        {
          title: self.title,
          body: self.body,
          author: nil
        }
      end

      def comment
        {
          nickname: self.nickname,
          email: Faker::Internet.email,
          body: translate('faker.blog.comment').sample,
          post: nil
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
