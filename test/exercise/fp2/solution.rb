module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for el in self
          yield el
        end
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        self.my_reduce(result) { |res, el| res << yield(el) }
        result
      end
      
      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        self.my_reduce(result) do |res, el|
          unless el.nil?
            res << el
          end
          res
        end
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        self.my_each { |el| acc = acc.nil? ? el : yield(acc, el) }
        acc
      end
    end
  end
end
