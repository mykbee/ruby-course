# Mike B. and Andy S.

require 'pry-byebug'
require './exercises.rb'

describe 'Exercise 0' do

  it 'triples entered string' do
    result = Exercises.ex0('dog')
    expect(result).to eq('dogdogdog')
  end

  it 'returns nope if string is wishes' do
    result = Exercises.ex0('wishes')
    expect(result).to eq('nope')
  end

end

describe 'Exercise 1' do

  it 'returns the number of elements in the array' do
    a = Array.new(3)
    result = Exercises.ex1(a)
    expect(result).to eq(3)
  end

end