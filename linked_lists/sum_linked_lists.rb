class Node
  attr_reader :data
  attr_accessor :next

  def initialize(data, next_node)
    @data = data
    @next = next_node
  end
end

def sum_linked_lists(head_a, head_b)
  carry = 0
  result = []

  while head_a || head_b || carry > 0
    first = head_a && head_a.data || 0
    second = head_b && head_b.data || 0

    sum = first + second + carry
    carry = sum / 10
    result << (sum % 10)

    head_a = head_a.next if head_a
    head_b = head_b.next if head_b
  end

  result.reverse.join
end

linked_list_one = Node.new(3, Node.new(2, Node.new(1, nil)))
linked_list_two = Node.new(3, Node.new(2, Node.new(1, nil)))

p sum_linked_lists(linked_list_one, linked_list_two) == '246'

linked_list_one = Node.new(5, nil)
linked_list_two = Node.new(5, nil)

p sum_linked_lists(linked_list_one, linked_list_two) == '10'

linked_list_one = Node.new(5, nil)
linked_list_two = Node.new(5, Node.new(1, nil))
p sum_linked_lists(linked_list_one, linked_list_two) == '20'

linked_list_one = nil
linked_list_two = Node.new(5, Node.new(1, nil))
p sum_linked_lists(linked_list_one, linked_list_two) == '15'


linked_list_one = Node.new(9, Node.new(9, Node.new(9, nil)))
linked_list_two = Node.new(1, nil)

p sum_linked_lists(linked_list_one, linked_list_two) == '1000'