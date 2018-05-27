class Datacleaner

  def initialize(data_array)
    @data = data_array
  end

  def clean

  end

  def zero_index
    @data.map! { |array| array.map! { |number| number - 1 } }
  end

end
