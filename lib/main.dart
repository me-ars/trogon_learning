import 'package:flutter/material.dart';
import 'core/app/trogon.dart';
import 'init_dependencies.dart';

void main() async {
  await initDependencies(); //initialize the dependency Injection
  runApp(const TrogonApp());
}
