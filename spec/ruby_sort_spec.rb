require_relative 'ruby_sort'
require 'rspec'

describe 'Testing the sorting algorithms' do
  it 'Properly sorts out an array' do
    arr = Array.new(15) { rand(1..12) }
    expect arr.bubble_sort.to eq(arr)
  end
end
