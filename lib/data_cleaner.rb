class Datacleaner

  def zero_index(data)
    data.map! { |array| array.map! { |number| number - 1 } }
  end

end
