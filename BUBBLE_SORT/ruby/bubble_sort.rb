# frozen_string_literal: true

def bubble_sort(arr)
  loop do
    swapped = false

    (arr.length - 1).times do |i|
      next unless arr[i] > arr [i + 1]

      arr[i], arr[i + 1] = arr[i + 1], arr[i]

      swapped = true
    end

    break unless swapped
  end

  p arr
end

a = [1, 4, 1, 3, 4, 1, 3, 3]

bubble_sort(a)