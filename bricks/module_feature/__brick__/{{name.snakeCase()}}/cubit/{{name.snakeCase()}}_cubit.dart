import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../services/api_service.dart';

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends {{name.pascalCase()}}State{
  final {{name.pascalCase()}}ApiService apiService;

  {{name.pascalCase()}}Cubit({required this.apiService}) : super({{name.pascalCase()}}Initial());
}