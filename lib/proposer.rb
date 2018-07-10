class Proposer

  def propose(data)
    make_stable_proposals(data)
  end

  private

  def make_stable_proposals(data)
    while duplicate_choice?(data)
      handle_duplicates(data)
    end
    data
  end

  def duplicate_choice?(data)
    preference_array = preferences(data)
    preference_array != preference_array.uniq
  end

  def handle_duplicates(data)
    proposals = identify_duplicates(preferences(data))
    proposals.each_with_index do |proposers, index|
      eliminate_unwanted_proposals(data, proposers, index) if proposers.length > 1
    end
  end

  def identify_duplicates(preferences)
    proposals = Array.new(preferences.length){Array.new}
    preferences.each_with_index do |pref, index|
      proposals[pref].push(index)
    end
    proposals
  end

  def preferences(data)
    data.map {|choices| choices.first}
  end

  def eliminate_unwanted_proposals(data, proposers, proposee)
    proposers.map! {|proposer| [proposer, data[proposee].index(proposer)]}
    proposers.sort_by! {|details| details[1]}
    proposers[1..-1].each do |arr|
      data[proposee].delete(arr[0])
      data[arr[0]].delete(proposee)
    end
  end

  def eliminate_unwanted_options(data)
    preferences(data).each_with_index do |preference, index|

    end
  end
end
