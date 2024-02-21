import '../atoms/todo_atom.dart';
import '../models/todo_model.dart';

var _autoIncrement = 4;

Future<void> fetchTodos() async {
  // Mockup implementation
  todoState.value = [
    TodoModel(id: 1, title: 'Test 1', check: true),
    TodoModel(id: 2, title: 'Test 2', check: false),
    TodoModel(id: 3, title: 'Test 3', check: true),
    TodoModel(id: 4, title: 'Test 4', check: false),
  ];
}

// create or update
Future<void> putTodo(TodoModel model) async {
  if (model.id == -1) {
    // create
    _autoIncrement++;
    todoState.value = [
      ...todoState.value,
      model.copyWith(
        id: _autoIncrement,
      )
    ];
  } else {
    // update
    final index = todoState.value.indexWhere((e) => e.id == model.id);
    todoState.value[index] = model;
    todoState();
  }
}

Future<void> deleteTodo(int id) async {
  todoState.value = todoState.value.where((e) => e.id != id).toList();
}
