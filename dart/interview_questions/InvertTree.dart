class Node {
  int val;
  Node(this.val);
  Node left;
  Node right;
  
  String toString() {
    String output = '';
    
    _preOrder(Node head) {
      if (head == null) return head;
      output += '${head.val} ->';
      _preOrder(head.left);
      _preOrder(head.right);
    }
    _preOrder(this);
    return output;
  }
}

void main() {
  Node invert(Node head) {
    if (head == null) return head;
    
    Node temp = head.left;
    head.left = invert(head.right);
    head.right = invert(temp); 
    
    return head;
  }
  
  var node1 = new Node(1);
  var node2 = new Node(2);
  var node3 = new Node(3);
  var node4 = new Node(4);
  var node5 = new Node(5);
  var node6 = new Node(6);
  
  node1.left = node2;
  node2.left = node3;
  node2.right = node4;
  node1.right = node5;
  node5.left = node6;
  
  print(node1);
  print(invert(node1));
}