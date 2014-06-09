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

describe 'Exercise 2' do

  it 'returns the second element of an array' do
    a = ['a', 'b', 'c']
    result = Exercises.ex2(a)
    expect(result).to eq('b')
  end  
end

describe 'Exercise 3' do

  it 'returns the sum of a given array of numbers' do
    a = (1..4).to_a
    result = Exercises.ex3(a)
    expect(result).to eq(10)
  end
end

describe 'Exercise 4' do

  it 'returns the max number of the given array' do
    a = [4, 9, 12]
    result = Exercises.ex4(a)
    expect(result).to eq(12)
  end
end

describe 'Exercise 5' do

  it 'puts each element of an array' do
    a = ['dog', 'cat', 'pony']
    STDOUT.should_receive(:puts).with('dog')
    STDOUT.should_receive(:puts).with('cat')
    STDOUT.should_receive(:puts).with('pony')
    Exercises.ex5(a)
  end
end

describe 'Exercise 6' do

  it 'updates last item in array to "panda"' do
    a = ['boy', 'girl', 'computer']
    Exercises.ex6(a)
    expect(a.last).to eq('panda')
  end

  it 'updates to GODZILLA if "panda" is already last element' do
    b = ['table', 'chair', 'panda']
    Exercises.ex6(b)
    expect(b.last).to eq('GODZILLA')
  end
end

describe 'Exercise 7' do

  it 'if a string is not in an array, returns same array' do
    a = ['dog', 'cat', 'pony']
    b = 'string'
    result = Exercises.ex7(a, b)
    expect(result).to eq(a)
  end

  it 'adds a string to end of array if string is already in array' do
    a = ['dog', 'cat', 'pony']
    b = 'cat'
    Exercises.ex7(a, b)
    expect(a.last).to eq('cat')    
  end

describe 'Exercise 8' do

  it 'iterates through "people" array and returns name and occupation' do
    a = [ { :name => 'andy', :occupation => 'badass'}, { :name => 'mike', :occupation => 'carrot eater'} ]
    STDOUT.should_receive(:puts).with('andy: badass')
    STDOUT.should_receive(:puts).with('mike: carrot eater')
    Exercises.ex8(a)
  end
end

end
