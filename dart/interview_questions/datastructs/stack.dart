extension Stack<T> on List<T> {
  T pop() {
    return removeLast();
    // Do not do!
    // return removeAt(0);
  }

  T peak() {
    return last;

    // Do not do!
    // return first;
  }

  void push(T element) {
    add(element);
    // Do not do!
    // insert(0, element);
  }
}

void main(List<String> args) {
  var stack = <int>[];
  print(stack);
  stack.push(2);
  print(stack);
  stack.push(9);

  print(stack);

  print("Removed: ${stack.pop()}");

  print(stack);

  print("Removed: ${stack.pop()}");

  print(stack);
}
