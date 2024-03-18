import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: Stack(
          children: [
            _bubbleBox(size, const AlignmentDirectional(3, -0.3)),
            _bubbleBox(size, const AlignmentDirectional(-3, -0.3)),
            Align(
              alignment: const AlignmentDirectional(0, -1.2),
              child: Container(
                width: (size.width / 1.5) * 2,
                height: size.width / 1.5,
                color: Colors.orange,
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
              child: const SizedBox(),
            )
          ],
        ),
      ),
    );
  }

  Widget _bubbleBox(Size size, AlignmentDirectional alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        width: size.width / 1.5,
        height: size.width / 1.5,
        decoration: const BoxDecoration(
          color: Colors.deepPurple,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
