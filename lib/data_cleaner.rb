class Datacleaner

  attr_accessor :data


  def initialize
    @data = nil
    
  end

  def clean
    num_students = @data.length
    selected_pairings = @data[0].length
    points_allocation = #array of 5 points for the chosen mates
  end

  def zero_index
    @data.map! { |array| array.map! { |number| number - 1 } }
    # What shall we do here?
  end

end
