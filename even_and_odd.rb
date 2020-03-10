# URI Online Judge | 1259
# Even and Odd

# By Neilor Tonin, URI Brazil
# Timelimit: 1

# Considering the input of non-negative integer values​​, sort these numbers ​​according to the following criteria: First the even in ascending order followed by the odd in descending order.
# Input

# The first line of input contains a positive integer number N (1 < N < 105). This is the number of following input lines. The next N lines contain, each one, a integer non-negative number.
# Output

# Print all numbers according to the explanation presented above. Each number must be printed in one line as shown below.

# Sample Input:
# 10
# 4
# 32
# 34
# 543
# 3456
# 654
# 567
# 87
# 6789
# 98

# Sample Output:
# 4
# 32
# 34
# 98
# 654
# 3456
# 6789
# 567
# 543
# 87

# RESOLUTION BY GLAUTON SANTOS

class EvenAndOdd
    def initialize(array:)
        array = array[1..array.size]
        @evens = array.map{|element| element if is_par?(element)}.compact
        @odds = array - @evens
    end

    def perform
        return order_asc(@evens).concat(order_dsc(@odds))
    end

    private

    def is_par? number
        number % 2 == 0 ? true : false
    end

    def order_asc array
        middle = array.size / 2
        aux = []
        first_part = array[0..middle - 1]
        second_part = array[middle..array.size]
        
        return [array[0]] if array.size == 1

        if array.size == 2
            return array[0] < array[1] ? [array[0], array[1]] : [array[1], array[0]]
        end
        
        ord_first = order_asc(first_part)
        ord_sec = order_asc(second_part)
        
        i = 0
        j = 0

        while true do
            if ord_first[i] < ord_sec[j]
               aux << ord_first[i]
               i += 1
               break if i >= ord_first.size
            else
               aux << ord_sec[j]
               j += 1
               break if j >= ord_sec.size
            end
        end
        
        if i >= ord_first.size
            aux.concat(ord_sec[j..ord_sec.size])
        else
            aux.concat(ord_first[i..ord_first.size])
        end
        aux
    end

    def order_dsc array
        middle = array.size / 2
        aux = []
        first_part = array[0..middle - 1]
        second_part = array[middle..array.size]
        
        return [array[0]] if array.size == 1

        if array.size == 2
            return array[0] > array[1] ? [array[0], array[1]] : [array[1], array[0]]
        end
        
        ord_first = order_dsc(first_part)
        ord_sec = order_dsc(second_part)
        
        i = 0
        j = 0

        while true do
            if ord_first[i] > ord_sec[j]
               aux << ord_first[i]
               i += 1
               break if i >= ord_first.size
            else
               aux << ord_sec[j]
               j += 1
               break if j >= ord_sec.size
            end
        end
        
        if i >= ord_first.size
            aux.concat(ord_sec[j..ord_sec.size])
        else
            aux.concat(ord_first[i..ord_first.size])
        end
        aux
    end
end

a = EvenAndOdd.new(array: [10,4,32,34,543,3456,654,567,87,6789,98])