# Remove a loop in a linked list
# one technique is to use the hashes of the object ids and detect the fitst one that is present
# However, a more shrewd techinque is to use a little math and calculate distances

# Distance traveled by fast pointer = 2 * (Distance traveled by slow pointer)
# (m + n*x + k) = 2*(m + n*y + k)

# Note that before meeting the point shown above, fast
# was moving at twice speed.

# x -->  Number of complete cyclic rounds made by
#        fast pointer before they meet first time

# y -->  Number of complete cyclic rounds made by
#        slow pointer before they meet first time

# m + k = (x-2y)*n
# or when the first one travels m (right where the knot starts) the second will have travelled a few rounds of n minus k so they
# will meet at the knot

# Which means m+k is a multiple of n.

class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
  end
end

# 1 -> 2 -> 3 -> 4 -> 5
#           |         |
#           |_________|

def find_and_remove_loop_from(head)
  return false if head.nil? || head.next.nil?

  # what we use here is called runner technique
  slower = head
  faster = head

  loop do
    break if faster.nil?

    slower = slower.next
    faster = faster.next.next

    break if slower == faster
  end

  if slower == faster
    faster = head
    while slower.next != faster.next do
      slower = slower.next
      faster = faster.next
    end

    slower.next = nil
  end

  tmp = head

  while tmp do
    puts tmp.data
    tmp = tmp.next
  end
end

one = Node.new 1
two = Node.new 2
three = Node.new 3
four = Node.new 4
five = Node.new 5

head_of_linked_list_with_cycle = one
one.next = two
two.next = three
three.next = four
four.next = five
five.next = three # where the cycle is formed

find_and_remove_loop_from head_of_linked_list_with_cycle