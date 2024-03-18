import 'package:flutter/material.dart';

import '../widgets/blured_gradient_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BluredGradientScreen(
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Good Morning',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Image.asset('assets/thunder.png'),
          const Text(
            '21°C',
            style: TextStyle(
              fontSize: 54,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const Text(
            'THUNDERSTORM',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const Text(
            'Friday 16 • 09:41am',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _indication('sun', 'Sunrise', '5:34am'),
              _indication('moon', 'Sunset', '6:18pm'),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Divider(
              color: Colors.grey,
              thickness: 0.2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _indication('temp-hot', 'Temp Max', '32°C'),
              _indication('temp-cold', 'Temp Min', '13°C'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _indication(String icon, String title, String time) {
    return Row(
      children: [
        Image.asset(
          'assets/$icon.png',
          scale: 8,
        ),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            Text(
              time,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
