#Algorithm for matching children into their rooms
require_relative '../resources/student_list'

class Sorter

  attr_accessor :student_choices, :rooms, :selections

  def initialize(choices = Selections::STUDENT_CHOICES, rooms = [], ordered = false)
    @rooms = rooms
    @student_choices = choices
    @selections = Array.new(student_choices.length)
  end

  def propose
    while selections.include?(nil)
      selections.each_with_index do |selection, index|
        unless selection
          first_choice = student_choices[index].first
          if selections.include?(first_choice)
            competitor = selections.index(first_choice)
            if student_choices[first_choice - 1].index(index+1) < student_choices[first_choice - 1].index(competitor+1)
              selections[index] = first_choice
              selections[competitor] = nil
              student_choices[first_choice - 1].delete(competitor + 1)
              student_choices[competitor].delete(first_choice)
            else
              student_choices[first_choice - 1].delete(index + 1)
              student_choices[index].delete(first_choice)
            end
            break
          else
            selections[index] = first_choice
          end
        end
      end
    end
    selections
  end

  def reject
    student_choices.each_with_index do |choices,index|
      accepted = selections.index(index+1)
      accepted_index = choices.index(accepted + 1)
      rejects = choices[accepted_index+1..-1]
      rejects.each do |reject|
        student_choices[reject - 1].delete(index + 1)
        student_choices[index].delete(reject)
        p student_choices
      end
    end
  end

  def cancel
    student_choices.each_with_index do |choices, index|
      while student_choices[index].length > 1 do
        choices = student_choices[index]
        cancelling_array = []
        last_choice = nil
        while last_choice != index + 1 do
          second_choice = choices[1]
          last_choice = student_choices[second_choice - 1].last
          cancelling_array.push([second_choice, last_choice])
          choices = student_choices[last_choice - 1]
        end
        cancelling_array.each do |array|
          student_choices[array[0] - 1].delete(array[1])
          student_choices[array[1] - 1].delete(array[0])
        end
      end
    end
  end

end
