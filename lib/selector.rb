class Selector

  def select(preference_matrix)
    pm = preference_matrix
    while !no_stable_result?(pm)
      return pm.flatten if sort_complete?(pm)
      pm = eliminate_preference_cycles(pm)
    end
  end

  private

  def eliminate_preference_cycles(preference_matrix)
    pm = preference_matrix.dup
    preference_matrix.each_with_index do |preference, index|
      while pm[index].length > 1
        cycle_matrix = create_preference_cycle(pm, index)
        remove_cycle(pm, cycle_matrix)
      end
    end
    preference_matrix
  end

  def sort_complete?(preference_matrix)
    !(preference_matrix.any? {|list| list.length > 1})
  end

  def create_preference_cycle(preference_matrix, index)
    anchor = index
    p_array = [anchor]
    q_array = []
    next_p = nil
    last_p = nil
    while next_p != anchor do
      next_q = preference_matrix[p_array.last][1]
      next_p = preference_matrix[next_q].last
      break if next_p == last_p
      p_array.push(next_p)
      q_array.push(next_q)
      last_p = next_p
    end
    [p_array, q_array]
  end

  def remove_cycle(preference_matrix, cycle_matrix)
    cycle_matrix[1].each_with_index do |q_value, index|
      p_value = cycle_matrix[0][index+1]
      preference_matrix[q_value].delete(p_value)
      preference_matrix[p_value].delete(q_value)
    end
  end

  def no_stable_result?(preference_matrix)
    preference_matrix.any? {|array| array.length == 0}
  end

end
