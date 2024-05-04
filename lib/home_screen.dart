import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [1, 2, 3, 4]
            .map(
              (e) => Image.asset(
                'asset/img/page_$e.png',
                fit: BoxFit.fill,
              ),
            )
            .toList(),
      ),
    );
  }
}
