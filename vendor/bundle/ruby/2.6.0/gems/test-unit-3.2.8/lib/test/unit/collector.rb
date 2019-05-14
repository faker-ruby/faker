module Test
  module Unit
    module Collector
      def initialize
        @filters = []
      end

      def filter=(filters)
        @filters = case(filters)
          when Proc
            [filters]
          when Array
            filters
        end
      end

      def add_suite(destination, suite)
        to_delete = suite.tests.find_all do |test|
          test.is_a?(TestCase) and !include?(test)
        end
        suite.delete_tests(to_delete)
        destination << suite unless suite.empty?
      end

      def add_test_cases(suite, test_cases)
        children_map = {}
        test_cases.each do |test_case|
          ancestor_classes = test_case.ancestors.find_all do |ancestor|
            ancestor.is_a?(Class)
          end
          parent = ancestor_classes[1]
          children_map[parent] ||= []
          children_map[parent] << test_case
        end

        root_test_cases = children_map.keys - test_cases
        root_test_cases.each do |root_test_case|
          add_test_case(suite, root_test_case, children_map)
        end
      end

      def include?(test)
        return true if(@filters.empty?)
        @filters.each do |filter|
          return false if filter[test] == false
        end
        true
      end

      def sort(suites)
        suites.sort_by do |suite|
          [suite.priority, suite.name || suite.to_s]
        end
      end

      private
      def add_test_case(suite, test_case, children_map)
        children = children_map[test_case]
        return if children.nil?

        sub_suites = []
        children.each do |child|
          sub_suite = child.suite
          add_test_case(sub_suite, child, children_map)
          add_suite(sub_suites, sub_suite)
        end
        sort(sub_suites).each do |sub_suite|
          suite << sub_suite
        end
      end
    end
  end
end
