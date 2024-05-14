import 'dart:io';

class Stack<T> {
  final List<T> _items = [];

  void push(T element) {
    _items.add(element);
  }

  T? pop() {
    if (_items.isNotEmpty) {
      return _items.removeLast();
    }
    return null;
  }

  bool isEmpty() {
    return _items.isEmpty;
  }
}

void main() {
  final stack = Stack<int>();
  String? input;

  // Continuously ask the user to enter numbers to push onto the stack
  do {
    stdout.write('Enter a number to push onto the stack: ');
    input = stdin.readLineSync();
    if (input != null && input.isNotEmpty) {
      final number = int.tryParse(input);
      if (number != null) {
        stack.push(number);
      } else {
        print('Invalid input. Please enter a valid number.');
      }
    }

    stdout.write('Do you want to add more numbers? (yes/no): ');
    input = stdin.readLineSync();
  } while (input != null && input.toLowerCase() == 'yes');

  // Pop and display all elements from the stack
  print('\nPopping all elements from the stack:');
  while (!stack.isEmpty()) {
    print(stack.pop());
  }

  // Check if the stack is empty
  print('The stack is empty: ${stack.isEmpty()}');
}
