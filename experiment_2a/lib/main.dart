/*
EXPERIMENT: experiment_2a
AIM: To demonstrate Flutter widgets including Center, Image, Text, and Container.
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Experiment2A(),
    );
  }
}

class Experiment2A extends StatefulWidget {
  const Experiment2A({super.key});

  @override
  State<Experiment2A> createState() => _Experiment2AState();
}

class _Experiment2AState extends State<Experiment2A> {
  int selectedIndex = 0;

  final List<String> titles = [
    'Center Widget',
    'Image Widget',
    'Text Widget',
    'Container Widget',
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> demonstrations = [
      const Center(
        child: Text('Hello, Flutter!', style: TextStyle(fontSize: 30)),
      ),
      Center(
        child: Image.network(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
          width: 250,
          height: 250,
          fit: BoxFit.cover,
        ),
      ),
      const Center(
        child: Text(
          'Flutter Text Widget',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      Center(
        child: Container(
          width: 200,
          height: 150,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'Container Widget',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(titles[selectedIndex])),
      body: demonstrations[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.center_focus_strong),
            label: 'Center',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Image'),
          BottomNavigationBarItem(icon: Icon(Icons.text_fields), label: 'Text'),
          BottomNavigationBarItem(
            icon: Icon(Icons.crop_square),
            label: 'Container',
          ),
        ],
      ),
    );
  }
}

