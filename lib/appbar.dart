import 'package:flutter/material.dart';

class AppbarCheck extends StatelessWidget {
  const AppbarCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text(
          "data",
          style: TextStyle(
            color: Colors.black12,
          ),
        ),
        backgroundColor: Colors.amber);
  }
}
