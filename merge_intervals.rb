# Given unsorted intervals, merge them
# [1, 10], [12, 20], [2, 15] -> [1, 20]

def merge_intervals(intervals)
  return [] if intervals.empty?
  # sort the intervals with regard to the start
  # we have the biggest chance to merge the next interval in the current if it is close enough

  # this can be implemented in NLogN
  merged_intervals = []

  sorted_start_intervals = intervals.sort { |a, b| a[0] <=> b[0] }
  current_interval = intervals[0]

  sorted_start_intervals[1...].each do |interval|
    if current_interval[1] >= interval[0]
      current_interval[1] = [interval[1], current_interval[1]].max
    else
      merged_intervals << current_interval
      current_interval = interval
    end
  end

  return merged_intervals << current_interval
end

p merge_intervals([[1, 10], [12, 20], [2, 15]]) == [[1, 20]]
p merge_intervals([[1, 10], [18, 20], [2, 15]]) == [[1, 15], [18, 20]]