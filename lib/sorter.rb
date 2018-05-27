#Algorithm for matching children into their rooms
class Sorter

  attr_accessor :students, :rooms, :selections

def initialize(students, rooms = [], ordered = false)
  @rooms = rooms
  @students = students
  @selections = Array.new(students.length)
end

def pair_sorter

end


def propose
  while selections.include?(nil)
    selections.each_with_index do |selection, index|
      unless selection
        first_choice = students[index].first
        if selections.include?(first_choice)
          competitor = selections.index(first_choice)
          if students[first_choice - 1].index(index+1) < students[first_choice - 1].index(competitor+1)
            selections[index] = first_choice
            selections[competitor] = nil
            students[first_choice - 1].delete(competitor + 1)
            students[competitor].delete(first_choice)
          else
            students[first_choice - 1].delete(index + 1)
            students[index].delete(first_choice)
          end
          break
        else
          selections[index] = first_choice
        end
      end
    end
  end
end

end
