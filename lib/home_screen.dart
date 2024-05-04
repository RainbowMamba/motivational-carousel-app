import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      // Find current page
      int currentPage = controller.page!.toInt();
      // Find next page, if in the last page, move to the initial page
      int nextPage = currentPage == 3 ? 0 : currentPage + 1;
      // Move to the next page
      controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    });
  }

  // Closing App, cancel timer and dispose controller.
  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }

    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
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
