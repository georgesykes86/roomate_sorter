class Datacleaner

  attr_accessor :data

  def initialize
    @data = nil

  end

  def clean
    num_students = @data.length
    selected_pairings = @data[0].length
  end

  def zero_index
    @data.map! { |array| array.map! { |number| number - 1 } }
  end

end
