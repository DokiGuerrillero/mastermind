module RANDOM
  def self.random
    array = []
    4.times { |i| array.push(rand(1..6))}
    array
  end
  def self.generator
    array = []
    1296.times do |i|
      array[i] = sprintf("%04d",i.to_s(6).to_i).split("").map!{|element| element = element.to_i + 1 }
    end
    array
  end
end