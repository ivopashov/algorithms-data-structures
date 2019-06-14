class LinkedList
  class Node
    attr_accessor :data, :next

    def initialize(data)
      @data = data
    end
  end

  def initialize
    @head = nil
  end

  def add(data)
    node = Node.new data

    if @head.nil?
      @head = node
    else
      last.next = node
    end
  end

  def last
    return if @head.nil?

    node = @head

    while node.next do
      node = node.next
    end

    node
  end

  def reverse
    current = @head
    previous = nil

    while !current.nil?
      next_node = current.next
      current.next = previous

      previous = current
      current = next_node
    end

    @head = previous
  end

  def print_all
    return if @head.nil?

    node = @head

    while node do
      puts node.data

      node = node.next
    end
  end
end

linked_list = LinkedList.new
linked_list.add 1
linked_list.add 2
linked_list.add 3
linked_list.add 4
linked_list.add 5
p 'print linked list'
linked_list.print_all
linked_list.reverse
p 'reverse print linked list'
linked_list.print_all

empty_linked_list = LinkedList.new
p 'print empty linked list'
empty_linked_list.print_all
empty_linked_list.reverse
p 'reverse print empty linked list'
empty_linked_list.print_all

linked_list_with_head_only = LinkedList.new
linked_list_with_head_only.add 1
p 'print linked list with head only'
linked_list_with_head_only.print_all
linked_list_with_head_only.reverse
p 'reverse print linked list with head only'
linked_list_with_head_only.print_all