import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertinoCircularIndicator extends StatelessWidget {
  const CustomCupertinoCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: Colors.black,
        radius: 40,
      ),
    );
  }
}
