import 'package:flutter/material.dart';

import '../clippers/SWaveClipper.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipPath(
            clipper: SWaveClipper(),
            child: Container(
              height: 120,
              color: const Color(0xFF4B57A1),
            ),
          ),
          const Positioned(
            top: 40,
            left: 20,
            child: Text(
              "Merhaba",
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Positioned(
            top: 70,
            right: 20,
            child: Row(
              children: const [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Teslimat Adresi",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Evim",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 6),
                Icon(Icons.home_rounded, color: Colors.black87, size: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
