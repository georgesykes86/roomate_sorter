class Datacleaner

  attr_accessor :data

  # Need to change implementation so that the data can be passed in after instantiation
  def initialize
    @data = nil
  end
#Change the way classes are set up.
  def clean
    num_students = @data.length
    selected_pairings = @data[0].length
    points_allocation = 
  end

  def zero_index
    @data.map! { |array| array.map! { |number| number - 1 } }
  end

end
