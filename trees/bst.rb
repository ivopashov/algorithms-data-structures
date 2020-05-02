        # 50
    # 40       70
  # 20 30    60  80
# 10
  module BST
    class Node
      attr_accessor :left, :right, :data

      def initialize(data)
        @data = data
        @left = nil
        @right = nil
      end
    end

    class Tree
      class << self
        def sample
          bst = Tree.new 50
          bst.insert 30
          bst.insert 20
          bst.insert 40
          bst.insert 70
          bst.insert 60
          bst.insert 80
          bst.insert 10

          return bst
        end
      end

      attr_accessor :root

      def initialize(data)
        @root = Node.new data
      end

      def inorder_print(node = @root)
        if node
          inorder_print node.left
          print "#{node.data} "
          inorder_print node.right
        end
      end

      def preorder_print(node = @root)
        if node
          print "#{node.data} "
          preorder_print node.left
          preorder_print node.right
        end
      end

      def postorder_print(node = @root)
        if node
          postorder_print node.left
          postorder_print node.right
          print "#{node.data} "
        end
      end

      def level_print
        queue = Queue.new
        queue.push [@root, 1]
        start_level = 1
        level_string = ''

        while !queue.empty?
          record = queue.pop
          if record[1] > start_level
            p level_string.strip
            level_string = ''
            start_level += 1
          end

          level_string += "#{record[0].data} "

          queue.push [record[0].left, record[1] + 1] if record[0].left
          queue.push [record[0].right, record[1] + 1] if record[0].right
        end

        level_string.strip
      end

      def outer_level_print
        queue = Queue.new
        queue.push [@root, 1]
        previous_record = nil

        while !queue.empty?
          record = queue.pop

          if (record[1] > 1 && record[1] > previous_record[1])
            p previous_record[0].data if previous_record[0]
            p record[0].data
          end

          queue.push [record[0].left, record[1] + 1] if record[0].left
          queue.push [record[0].right, record[1] + 1] if record[0].right

          previous_record = record
        end
      end

      def insert(data, node = @root)
        if node.data > data
          if node.left.nil?
            node.left = Node.new data
          else
            insert data, node.left
          end
        else
          if node.right.nil?
            node.right = Node.new data
          else
            insert data, node.right
          end
        end
      end
    end
end
