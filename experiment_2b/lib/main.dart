/*
EXPERIMENT: experiment_2b
AIM: To demonstrate the Row, Column, and Stack layout widgets in Flutter.
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
      home: const Experiment2B(),
    );
  }
}

class Experiment2B extends StatefulWidget {
  const Experiment2B({super.key});

  @override
  State<Experiment2B> createState() => _Experiment2BState();
}

class _Experiment2BState extends State<Experiment2B> {
  int selectedIndex = 0;

  final List<String> titles = ['Row', 'Column', 'Stack'];

  @override
  Widget build(BuildContext context) {
    final List<Widget> demonstrations = [
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            ColoredBox(
              color: Colors.red,
              child: Padding(padding: EdgeInsets.all(20), child: Text('One')),
            ),
            ColoredBox(
              color: Colors.green,
              child: Padding(padding: EdgeInsets.all(20), child: Text('Two')),
            ),
            ColoredBox(
              color: Colors.blue,
              child: Padding(padding: EdgeInsets.all(20), child: Text('Three')),
            ),
          ],
        ),
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ColoredBox(
              color: Colors.red,
              child: Padding(padding: EdgeInsets.all(20), child: Text('One')),
            ),
            ColoredBox(
              color: Colors.green,
              child: Padding(padding: EdgeInsets.all(20), child: Text('Two')),
            ),
            ColoredBox(
              color: Colors.blue,
              child: Padding(padding: EdgeInsets.all(20), child: Text('Three')),
            ),
          ],
        ),
      ),
      Center(
        child: SizedBox(
          width: 220,
          height: 220,
          child: Stack(
            alignment: Alignment.center,
            children: const [
              ColoredBox(
                color: Colors.red,
                child: SizedBox(width: 180, height: 180),
              ),
              ColoredBox(
                color: Colors.green,
                child: SizedBox(width: 130, height: 130),
              ),
              ColoredBox(
                color: Colors.blue,
                child: SizedBox(width: 80, height: 80),
              ),
              Text(
                'Stack',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('${titles[selectedIndex]} Widget')),
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
          BottomNavigationBarItem(icon: Icon(Icons.view_week), label: 'Row'),
          BottomNavigationBarItem(icon: Icon(Icons.view_day), label: 'Column'),
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: 'Stack'),
        ],
      ),
    );
  }
}

