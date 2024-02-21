import 'package:flutter/material.dart';
import 'package:flutter_todo/app/injector.dart';

import 'app/app_widget.dart';

void main() {
  registerInstances();
  runApp(const AppWidget());
}
