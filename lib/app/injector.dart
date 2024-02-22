import 'package:auto_injector/auto_injector.dart';
import 'package:flutter_todo/app/data/repositories/localstore_todo_repository.dart';

import 'package:flutter_todo/app/interactor/repositories/todo_repository.dart';

final injector = AutoInjector();

void registerInstances() {
  // injector.add<TodoRepository>(SharedTodoRepository.new);
  injector.add<TodoRepository>(LocalstoreTodoRepository.new);
}
