/*
EXPERIMENT: experiment_10
AIM: To implement a registration form and verify it using Flutter widget tests.
*/


import 'package:flutter/material.dart';
import 'registration_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationForm(),
    );
  }
}

