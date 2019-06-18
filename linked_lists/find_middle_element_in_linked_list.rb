class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
  end
end

def middle_element(head)
  return if head.nil?

  slower = faster = head

  loop do
    return slower if faster.nil? || faster.next.nil?

    slower = slower.next
    faster = faster.next.next
  end
end

# Examples
# 1 -> 2 -> 3 -> 4 -> 5
one = Node.new 1
two = Node.new 2
three = Node.new 3
four = Node.new 4
five = Node.new 5

one.next = two
two.next = three
three.next = four
four.next = five

p 'middle element in 1 -> 2 -> 3 -> 4 -> 5 is: '
p middle_element(one).data

# ====================
# 1 -> 2 -> 3 -> 4
one = Node.new 1
two = Node.new 2
three = Node.new 3
four = Node.new 4

one.next = two
two.next = three
three.next = four

p 'middle element in 1 -> 2 -> 3 -> 4 is: '
p middle_element(one).data