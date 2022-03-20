import 'package:dicebear_avatars/app_modular.dart';
import 'package:dicebear_avatars/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}