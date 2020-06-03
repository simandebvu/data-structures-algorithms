class Array
  def quicksort
    return [] if empty?
    pivot = delete_at(rand(size))
    left, right = partition(&pivot.method(:>))
    [*left.quicksort, pivot, *right.quicksort]
  end

  def bubble_sort
    loop do
      still_swapping = false
      (self.length - 1).times do |i|
      next unless self[i] > self[i + 1]
        self[i], self[i + 1] = self[i + 1], self[i]
      still_swapping = true
      end
      break unless still_swapping
    end
    self
  end
end

