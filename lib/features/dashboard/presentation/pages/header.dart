import 'package:coil_yield_calculator/core/style/header_style.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 140,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Coil Yield Calculator', style: HeaderStyle.h1()),

                const SizedBox(height: 4),

                Text(
                  'Estimate roll length and part quantity',
                  style: HeaderStyle.h6(),
                ),
              ],
            ),
          ),

          Positioned(
            right: -10,
            top: -70,
            child: Image.asset(
              'assets/coil_blue.png',
              width: 200,
              height: 300,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            right: 18,
            top: 47,
            child: Opacity(
              opacity: 0.15,
              child: Transform.rotate(
                angle: 0.06,
                child: Transform.flip(
                  flipX: false,
                  flipY: false,
                  child: Image.asset(
                    'assets/coil_blue.png',
                    width: 200,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
