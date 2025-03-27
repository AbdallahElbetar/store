import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class CustomCircularAnmitionIdicator extends StatelessWidget {
  const CustomCircularAnmitionIdicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/animation/LaodingAnimation.json',
        height: 200,
      ),
    );
  }
}
