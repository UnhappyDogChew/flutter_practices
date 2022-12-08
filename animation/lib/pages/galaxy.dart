import 'package:flutter/material.dart';

class Galaxy extends StatefulWidget {
  const Galaxy({super.key});

  @override
  State<Galaxy> createState() => _GalaxyState();
}

class _GalaxyState extends State<Galaxy> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: RotationTransition(
              alignment: Alignment.center,
              turns: _animationController,
              child: Image.asset(
                'images/galaxy.jpeg',
                width: 300,
                height: 300,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                onPressed: () {
                  if (_animationController.isAnimating) {
                    _animationController.stop();
                  } else {
                    _animationController.repeat();
                  }
                },
                child: Text(
                  _animationController.isAnimating ? 'stop' : 'start',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
