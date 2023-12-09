import 'package:final_field_project/vector_operation_screan.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Vector Operation App',
      home: VectorOperationScreen(),
    );
  }
}

