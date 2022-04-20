module Feedback
  def self.interpreter(compared_org,comparator_org)
    compared = compared_org.clone
    comparator =  comparator_org.clone
    right = 0
    wrong = 0

    compared.each_with_index do |value, index|
      next unless value == comparator[index]
      right += 1
      compared[index] = 'x'
      comparator[index] = 'x'
    end
  

    comparator.each_with_index do |value, index|
      next unless value != 'x' && compared.include?(value)
      wrong += 1
      rmv = compared.find_index(value)
      compared[rmv] = 'o'
      value = 'o'
    end
    [right,wrong]
  end
end