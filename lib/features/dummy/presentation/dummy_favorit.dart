import 'package:flutter/material.dart';

class DummyFavorit extends StatefulWidget {
  const DummyFavorit({super.key});

  @override
  State<DummyFavorit> createState() => _DummyFavoritState();
}

class _DummyFavoritState extends State<DummyFavorit> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('blank')),
    );
  }
}
