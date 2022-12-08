import 'package:flutter/material.dart';

import 'pages/galaxy.dart';
import 'pages/hello_world.dart';

void main() {
  runApp(const AnimationApp());
}

class AnimationApp extends StatelessWidget {
  const AnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Animation Test',
      home: AnimatioHome(),
    );
  }
}

class AnimatioHome extends StatefulWidget {
  const AnimatioHome({super.key});

  @override
  State<AnimatioHome> createState() => _AnimatioHomeState();
}

class _AnimatioHomeState extends State<AnimatioHome> {
  int _page = 0;

  static const List<Widget> _pages = [
    HelloWorld(),
    Galaxy(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation Test')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[500],
              ),
              child: const Center(
                child: Text(
                  'Animations',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Hello World'),
              onTap: () => _changePage(0),
            ),
            ListTile(
              title: Text('Galaxy'),
              onTap: () => _changePage(1),
            )
          ],
        ),
      ),
      body: _pages[_page],
    );
  }

  void _changePage(int page) {
    setState(() {
      _page = page;
    });
  }
}

class TempWidget extends StatelessWidget {
  const TempWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          // GestureDetector(
          //   onTap: _hanldTap,
          //   child: AnimatedContainer(
          //       duration: Duration(milliseconds: 500),
          //       curve: Curves.ease,
          //       child: Center(
          //         child: const Text('Me too!'),
          //       ),
          //       color: _buttonOn ? Colors.blue : Colors.amber,
          //       width: 200 + (_buttonOn ? 50 : 0),
          //       height: 100 + (_buttonOn ? 25 : 0)),
          // ),
          // MyWidget(isOn: _buttonOn),
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final bool isOn;

  const MyWidget({super.key, required this.isOn});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(seconds: 1),
      builder: (context, value, child) {
        return Text(
          'Hello!',
          style: TextStyle(
            fontSize: 13 + (5 * value),
          ),
        );
      },
    );
  }
}
