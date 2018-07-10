class Datacleaner

  def zero_index(data)
    return data if data.any? { |array| array.include?(0) } 
    data.map { |array| array.map { |number| number - 1 } }
  end

end
