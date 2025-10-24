import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

// Padding(
//     padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Gaps.v52,
//         Text(
//           "Enjoy the ride",
//           style: TextStyle(
//             fontSize: Sizes.size40,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Gaps.v16,
//         Text(
//           "Videos are personalized for you based on what you watch, like, and share.",
//           style: TextStyle(fontSize: Sizes.size20),
//         ),
//       ],
//     ),
//   ),

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: SafeArea(
            child: AnimatedCrossFade(
              firstChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Watch cool videos!",
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    "Videos are personalized for you based on what you watch, like, and share.",
                    style: TextStyle(fontSize: Sizes.size20),
                  ),
                ],
              ),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Follow the rules",
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    "Videos are personalized for you based on what you watch, like, and share.",
                    style: TextStyle(fontSize: Sizes.size20),
                  ),
                ],
              ),
              crossFadeState: CrossFadeState.showFirst,
              duration: Duration(milliseconds: 300),
            ),
          ),
        ),
      ),
    );
  }
}
