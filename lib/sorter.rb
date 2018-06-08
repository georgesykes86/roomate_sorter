#Algorithm for matching children into their rooms
require_relative '../resources/student_list'
require_relative './data_cleaner'

class Sorter

  attr_accessor :student_choices, :rooms, :selections
 # Neeed to change initialisation implementation
  def initialize(choices, rooms = [], ordered = false)
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
            if student_choices[first_choice].index(index) < student_choices[first_choice].index(competitor)
              selections[index] = first_choice
              selections[competitor] = nil
              student_choices[first_choice].delete(competitor)
              student_choices[competitor].delete(first_choice)
            else
              student_choices[first_choice].delete(index)
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
      accepted = selections.index(index)
      accepted_index = choices.index(accepted)
      rejects = choices[accepted_index+1..-1]
      rejects.each do |reject|
        student_choices[reject].delete(index)
        student_choices[index].delete(reject)
        p student_choices
      end
    end
  end
  # Doesn't seem to be working properly need to debug must stop it getting into a never ending loop.
  def cancel
    student_choices.each_with_index do |choices, index|
      while student_choices[index].length > 1 do
        choices = student_choices[index]
        cancelling_array = []
        last_choice = nil
        while last_choice != index do
          second_choice = choices[1]
          last_choice = student_choices[second_choice].last
          cancelling_array.push([second_choice, last_choice])
          choices = student_choices[last_choice]
        end
        cancelling_array.each do |array|
          student_choices[array[0]].delete(array[1])
          student_choices[array[1]].delete(array[0])
        end
      end
    end
  end

end
