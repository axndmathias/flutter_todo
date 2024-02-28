import 'package:localstore/localstore.dart';

import '../../interactor/models/todo_model.dart';
import '../../interactor/repositories/todo_repository.dart';
import '../adapters/todo_adapter.dart';

class HiveTodoRepository implements TodoRepository {
  final db = Localstore.instance;

  @override
  Future<List<TodoModel>> getAll() async {
    final items = await db.collection('todos').get();
    final list = items?.values ?? [];
    return list.map((e) => TodoAdapter.fromMap(e)).toList();
  }

  @override
  Future<TodoModel> insert(TodoModel model) async {
    final todos = await getAll();
    final id = todos.isEmpty ? 1 : todos.last.id + 1;
    model = model.copyWith(id: id);
    await db
        .collection('todos')
        .doc(id.toString())
        .set(TodoAdapter.toMap(model));
    return model;
  }

  @override
  Future<TodoModel> update(TodoModel model) async {
    await db.collection('todos').doc(model.id.toString()).set(
          TodoAdapter.toMap(model),
        );
    return model;
  }

  @override
  Future<bool> delete(int id) async {
    await db.collection('todos').doc(id.toString()).delete();
    return true;
  }
}
