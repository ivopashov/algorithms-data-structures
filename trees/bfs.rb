require '~/repos/algorithms-data-structures/trees/bst'

def is_present?(tree, number)
  queue = Queue.new
  queue.push tree.root

  while !queue.empty?
    temp = queue.pop
    return true if temp.data == number

    queue.push temp.left if temp.left
    queue.push temp.right if temp.right
  end

  false
end

bst = BST::Tree.sample
p bst.preorder_print

# p is_present? bst, 20
# p is_present? bst, 21
