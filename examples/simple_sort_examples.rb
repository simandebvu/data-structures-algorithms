require_relative "../src/ruby_sort.rb"

arr = [15, -1, 2, 3, 7, 5, -10]
p "Original Array : #{arr}"
p "Bubble: #{arr.bubble_sort}"
p "Selection: #{arr.selection_sort}"
p "Insertion: #{arr.insertion_sort}"
p "Shell: #{arr.shell_sort}"
p "Merge: #{arr.merge_sort}"
p "Quick: #{arr.quick_sort}"