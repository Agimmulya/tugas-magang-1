import 'package:flutter/material.dart';

import 'splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _controller = SplashController();

  @override
  void initState() {
    _controller.onInit();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.onInit();
    return Scaffold(
      body: Center(
        child: Center(
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Image.asset('assets/R.png'),
          ),
        ),
      ),
    );
  }
}
