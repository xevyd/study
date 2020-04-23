module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.reduce() { |max, el| max < el ? el : max }
        array.map { |i| i > 0 ? max : i }
      end

      def search(array, query)
        firstIndex = 0
        lastIndex = array.length - 1

        if array.length == 0 || array[firstIndex] > query || array[lastIndex] < query
          return -1
        else
          b_search(array, query, firstIndex, lastIndex)
        end
      end

      def b_search(array, query, firstIndex, lastIndex)
        mid = (firstIndex + lastIndex) / 2
        
        if array[mid] == query
          return mid
        end
        
        if firstIndex < lastIndex
          if array[mid] > query
            b_search(array, query, firstIndex, mid - 1)
          elsif array[mid] < query
            b_search(array, query, mid + 1, lastIndex)
          end
        else
          -1
        end
      end
    end
  end
end