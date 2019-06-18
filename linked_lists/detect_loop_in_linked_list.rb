class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
  end
end

# 1 -> 2 -> 3 -> 4 -> 5
#           |         |
#           |_________|

def loop_present?(head)
  return false if head.nil? || head.next.nil?

  # what we use here is called runner technique
  slower = faster = head

  loop do
    return false if faster.nil?

    slower = slower.next
    faster = faster.next.next

    return true if slower == faster
  end
end

# Examples
one = Node.new 1
two = Node.new 2
three = Node.new 3
four = Node.new 4
five = Node.new 5

linked_list_with_cycle_head = one
one.next = two
two.next = three
three.next = four
four.next = five
five.next = three # where the cycle is formed


if loop_present? linked_list_with_cycle_head
  p 'loop present'
else
  p 'loop not present'
end

# ========================

one = Node.new 1
two = Node.new 2
linked_list_no_cycle = one
one.next = two

if loop_present? linked_list_no_cycle
  p 'loop present'
else
  p 'loop not present'
end

# ========================

one = Node.new 1
linked_list__with_only_head = one

if loop_present? linked_list__with_only_head
  p 'loop present'
else
  p 'loop not present'
end

# ========================

one = Node.new 1
two = Node.new 2
linked_list_with_loop = one
one.next = two
two.next = one

if loop_present? linked_list_with_loop
  p 'loop present'
else
  p 'loop not present'
end