require '~/repos/algorithms-data-structures/trees/bst'

def min_depth(tree, node)
  return 0 if node.nil?

  return 1 if node.left.nil? || node.right.nil?

  [min_depth(tree, node.left), min_depth(tree, node.right)].min + 1
end

bst = BST::Tree.sample
p min_depth(bst, bst.root)
