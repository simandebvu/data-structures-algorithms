class Array
  def quick_sort
    return [] if empty?

    pivot = delete_at(rand(size))
    left, right = partition(&pivot.method(:>))
    [*left.quicksort, pivot, *right.quicksort]
  end

  def bubble_sort
    loop do
      still_swapping = false
      (length - 1).times do |i|
        next unless self[i] > self[i + 1]

        self[i], self[i + 1] = self[i + 1], self[i]
        still_swapping = true
      end
      break unless still_swapping
    end
    self
  end

  def selection_sort
    (length-1).times do |i|
      (i+1).upto(length) {|j| self[i], self[j-1] = self[j-1], self[i] if self[i]>self[j-1]}
    end
    self
  end


end


