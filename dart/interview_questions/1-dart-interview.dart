class Node {
  Node? next;
  int value;

  Node(this.value);

  @override
  String toString() {
    Node? pointer = this;
    var output = '';
    while (pointer != null) {
      output += '${pointer.value}->';
      pointer = pointer.next;
    }
    return output;
  }
}

void main() {
  final s1 = 'This is my string';
  String reverseStringNlogN(String s) {
    var reversed = s.split('');
    for (int i = 0; i < s.length ~/ 2; i++) {
      var start = reversed[i];
      var end = reversed[s.length - 1 - i];
      reversed[i] = end;
      reversed[s.length - 1 - i] = start;
    }
    return reversed.join('');
  }

  String reverseString(String s) {
    var reversed = '';
    for (int i = 0; i < s.length; i++) {
      reversed = s[i] + reversed;
    }
    return reversed;
  }

  String reverseStringRecursive(String s) {
    if (s.length == 0) {
      return s;
    }
    return reverseStringRecursive(s.substring(1, s.length)) + s[0];
  }

  String reverseWords(String s) {
    final words = s.split(' ');
    return words.reversed.join(' ');
  }

  String reverseRecursive(String s) {
    final words = s.split(' ');
    if (words.length == 1) {
      return words[0];
    }
    final word = words.removeAt(0);
    return reverseRecursive(words.join(' ')) + ' $word';
  }

  print('=========== Strings ===========');
  print('reverseStringNlogN: ${reverseStringNlogN(s1)}');
  print('reverseString: ${reverseString(s1)}');
  print('reverseStringRecursive: ${reverseStringRecursive(s1)}');
  print('reverseWords: ${reverseWords(s1)}');
  print('reverseRecursive: ${reverseRecursive(s1)}');

  num fib(int nth) {
    if (nth < 2) {
      return nth;
    }
    int prev2 = 0;
    int prev1 = 1;
    int current = 0;
    for (int i = 2; i <= nth; i++) {
      current = prev2 + prev1;
      prev2 = prev1;
      prev1 = current;
    }
    return current;
  }

  num fibRecursive(int nth) {
    if (nth < 2) {
      return nth;
    }
    return fibRecursive(nth - 2) + fibRecursive(nth - 1);
  }

  String odd(int n) {
    var output = '';
    for (int i = 1; i <= n; i += 2) {
      output += '$i ';
    }
    return output;
  }

  String oddMod(int n) {
    var output = '';
    for (int i = 1; i <= n; i++) {
      if (i % 2 == 1) {
        output += '$i ';
      }
    }
    return output;
  }

  String rgbToHex(int r, int g, int b) {
    return r.toRadixString(16) + g.toRadixString(16) + b.toRadixString(16);
  }

  print('=========== Numbers ===========');
  print('fib 6: ${fib(6)}');
  print('fibRecursive 6: ${fibRecursive(6)}');
  print('fib 4: ${fib(4)}');
  print('fibRecursive 4: ${fibRecursive(4)}');
  print('fib 2: ${fib(2)}');
  print('fibRecursive 2: ${fibRecursive(2)}');
  print('odd 31: ${odd(31)}');
  print('oddMod 31: ${oddMod(31)}');
  print('odd 24: ${odd(24)}');
  print('oddMod 24: ${oddMod(24)}');
  print('rgbToHex(200, 100, 50): ${rgbToHex(200, 100, 50)}');
  print('rgbToHex(100, 150, 30): ${rgbToHex(100, 150, 30)}');

  Node _createList() {
    var node1 = new Node(1);
    var node2 = new Node(2);
    node1.next = node2;
    var node3 = new Node(3);
    node2.next = node3;
    var node4 = new Node(4);
    node3.next = node4;
    return node1;
  }

  Node reverseLinkedList(Node? node) {
    var temp, reversed;
    var current = node;
    while (current != null) {
      temp = current;
      current = current.next;
      temp.next = reversed;
      reversed = temp;
    }
    return reversed;
  }

  Node? reverseLinkedListRecursive(Node? head, Node? newHead) {
    if (head == null) {
      return newHead;
    }

    var temp;
    temp = head;
    head = head.next;
    temp.next = newHead;
    newHead = temp;
    return reverseLinkedListRecursive(head, newHead);
  }

  print('=========== Data Structures ===========');
  print('LinkedList: ${_createList().toString()}');
  print('reverseLinkedList: ${reverseLinkedList(_createList()).toString()}');
  print('reverseLinkedListRecursive: ${reverseLinkedListRecursive(_createList(), null).toString()}');
}
