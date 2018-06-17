class Datacleaner

  attr_accessor :data
  #Clean up that data

  def initialize
    @data = nil

  end

  def clean
    num_students = @data.length
    selected_pairings = @data[0].length
  end

  def zero_index
    @data.map! { |array| array.map! { |number| number - 1 } }
    # What shall we do here?
  end

end
