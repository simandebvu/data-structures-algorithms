# For every k continuous numbers in an array, print the  largest number. This challenge is easy to "brute-force", but see if you  can find the optimal solution.

# Simple Solution: O(nk)
# Better Solution: O(n log k)
# Optimal Solution: O(n)


def sliding_maximum(k, array)
    return [] if array.size == 0
    answer = []
    (0..array.size-k).each do |i|
        window = array[i...i+k]
        answer << window.max
    end
    return answer
end

sliding_maximum(3, [1, 3, 5, 7, 9, 2])
# => [5, 7, 9, 9]