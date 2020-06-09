class Array
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
    (length - 1).times do |i|
      (i + 1).upto(length) { |j| self[i], self[j - 1] = self[j - 1], self[i] if self[i] > self[j - 1] }
    end
    self
  end

  def insertion_sort
    (1...length).each do |i|
      next unless self[i - 1] > self[i]

      i.downto(1) do |j|
        self[j - 1], self[j] = self[j], self[j - 1] if self[j] < self[j - 1]
      end
    end
    self
  end

  def shell_sort
    gap = length / 2
    while gap.positive?
      gap.upto(length - 1) do |i|
        j = i
        temp = self[i]
        while j >= gap and self[j - gap] > temp
          self[j] = self[j - gap]
          j -= gap
        end
        self[j] = temp
      end
      gap = (gap == 2 ? 1 : gap * 10 / 22)
    end
    self
  end

  def merge_sort(&sort_direction)
    return self if length <= 1

    sort_direction ||= proc { |a, b| a <=> b }
    middle = length / 2
    left = self[0...middle].merge_sort(&sort_direction)
    right = self[middle..-1].merge_sort(&sort_direction)
    merge(left, right, sort_direction)
  end

  def quick_sort
    return [] if empty?

    pivot = delete_at(rand(size))
    left, right = partition(&pivot.method(:>))
    [*left.quick_sort, pivot, *right.quick_sort]
  end

  private

  def merge(left, right, sort_direction)
    result = []
    until left.empty? || right.empty?
      result << if sort_direction[left.first, right.first] <= 0
                  left.shift
                else
                  right.shift
                end
    end
    result + left + right
  end
end
