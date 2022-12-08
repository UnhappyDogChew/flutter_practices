import 'package:flutter/material.dart';

class HelloWorld extends StatefulWidget {
  const HelloWorld({super.key});

  @override
  State<HelloWorld> createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  bool _showText = false;

  static const _width = 400.0;
  static const _height = 400.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Center(
        child: AnimatedCrossFade(
          crossFadeState:
              _showText ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(seconds: 2),
          firstChild: SizedBox(
            width: _width,
            height: _height,
            child: Center(
              child: Text(
                'Hello World!',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan[800],
                ),
              ),
            ),
          ),
          secondChild: SizedBox(
            width: _width,
            height: _height,
            child: Image.asset('images/flutter_bird.png'),
          ),
        ),
      ),
    );
  }

  void _handleTap() {
    setState(() {
      _showText = !_showText;
    });
  }
}
