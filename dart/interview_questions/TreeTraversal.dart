import 'dart:collection';

class Node implements Comparable {
  int val;
  Node left;
  Node right;
  
  Node(this.val, {this.left, this.right});
  
  int get hashCode => val;
  int compareTo(other) => val - other.val;
  bool operator==(other) => other is Node && (other.val == val);
  
  @override
  String toString() {
    var string = '';
    _printPreOrder(Node node) {
      if (node == null) return;
      
      string += '${node.val}->';
      _printPreOrder(node.left);
      _printPreOrder(node.right);
    }
    string += 'PreOrder:\n';
    _printPreOrder(this);
    
    _printPostOrder(Node node) {
      if (node == null) return;
      
      _printPostOrder(node.left);
      _printPostOrder(node.right);
      string += '${node.val}->';
    }
    string += '\nPostOrder:\n';
    _printPostOrder(this);
    
    _printInOrder(Node node) {
      if (node == null) return;
      
      _printInOrder(node.left);
      string += '${node.val}->';
      _printInOrder(node.right);
    }
    string += '\nInOrder:\n';
    _printInOrder(this);
    return string;
  }
}

void main() {
  var node1 = new Node(1);
  var node2 = new Node(2);
  var node3 = new Node(3);
  var node4 = new Node(4);
  var node5 = new Node(5);
  var node6 = new Node(6);
  var node7 = new Node(7);
  
  
  node1.left = node2;
  node1.right = node5;
  node2.left = node3;
  node2.right = node4;
  node5.left = node6;
  node5.right = node7;
  print(node1);
  
  String inOrderIterative(Node root) {
    String ans = '';
    if (root == null) return ans;
    var stack = new Queue<Node>();
    Node current = root;
    while (current != null || stack.isNotEmpty) {
      while (current != null) {
        stack.addFirst(current);
        current = current.left;
      }
      current = stack.removeFirst();
      ans += '${current.val}->';
      current = current.right;
    }
    return ans;
  }
  
  String postOrderIterative(Node root) {
    String ans = '';
    if (root == null) return ans;
    var stack = new Queue<Node>();
    var ansStack = new Queue<Node>();
    
    Node current = root;
    stack.addFirst(current);
    while (stack.isNotEmpty) {
      current = stack.removeFirst();
      ansStack.addFirst(current);
      
      
      if(current.left != null) {
        stack.addFirst(current.left);
      }
      if(current.right != null) {
        stack.addFirst(current.right);
      }
    }
    
    while(ansStack.isNotEmpty) {
      current = ansStack.removeFirst();
      ans += '${current.val}->';
    }
    return ans;
  }
  
  String preOrderIterative(Node root) {
    String ans = '';
    if (root == null) return ans;
    var stack = new Queue<Node>();
    Node current = root;
    while (current != null || stack.isNotEmpty) {
      while (current != null) {
        ans += '${current.val}->';
        stack.addFirst(current);
        current = current.left;
      }
      current = stack.removeFirst();
      current = current.right;
    }
    return ans;
  }
  
  print('preOrderIterative: ${preOrderIterative(node1)}');
  print('postOrderIterative: ${postOrderIterative(node1)}');
  print('inOrderIterative: ${inOrderIterative(node1)}');
  
}