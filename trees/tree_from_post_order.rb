# Given postorder traversal of a Binary Search Tree, you need to complete the function constructTree() which will create a BST. The output will be the inorder of the constructed BST.
# 10 20 40 30 60 80 70 50

        # 50
    # 30       70
  # 20 40    60  80
# 10

class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    left, rigth = nil
  end
end

class BST
  attr_accessor :root

  def postorder_print(node = @root)
    if node
      postorder_print node.left
      postorder_print node.right
      print "#{node.data} "
    end
  end
end

def construct_tree(array, initial = true)
  root = Node.new array.pop

  return root if array.empty?

  left = []
  right = []

  array.each do |num|
    if num > root.data
      right << num
    else
      left << num
    end
  end

  root.left = construct_tree left, false
  root.right = construct_tree right, false

  return root
end

root = construct_tree [10, 20, 40, 30, 60, 80, 70, 50]
@bst = BST.new
@bst.root = root
@bst.postorder_print
