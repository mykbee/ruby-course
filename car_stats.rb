class CarStats
  def self.calc_top_color(cars)
    colors = cars.map { |car| car.color }
    histogram = {}
    colors.each do |c|
      if histogram[c].nil?
        histogram[c] = 1
      else
        histogram[c] += 1
      end
    end
    histogram.max_by { |color, count| count}.first
  end

  def self.calc_bottom_color(cars)
    colors = cars.map { |car| car.color }
    histogram = {}
    colors.each do |c|
      if histogram[c].nil?
        histogram[c] = 1
      else
        histogram[c] += 1
      end
    end
    histogram.min_by { |color, count| count}.first
  end
end

# Incomplete 
# class CarStats
#   def self.calc_top_color(cars)
#     colors = cars.map { |c| c.color }
#     histogram = colors.inject(Hash.new(0)) do 