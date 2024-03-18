import 'package:flutter/material.dart';

import '../widgets/blured_gradient_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BluredGradientScreen(
      child: Column(
        children: [
          Text(
            'Good Morning',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
