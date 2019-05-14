unless String.method_defined? :format
  class String
    # A nicer alternative to Kernel#sprintf and String#%.
    #
    # @return [String] the formatted string
    #
    # @example
    #   'This is %s!'.format('Sparta') #=> 'This is Sparta!'
    #
    # @example
    #   'My name is %{fname} %{lname}.'.format(fname: 'Bruce', lname: 'Wayne')
    #   #=> 'My name is Bruce Wayne.'
    #
    # @example
    #   '%d + %d'.format([1, 2]) #=> '1 + 2'
    def format(*args)
      super(self, *(args.flatten(1)))
    end
  end
end
