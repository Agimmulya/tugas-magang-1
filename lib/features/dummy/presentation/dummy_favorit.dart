import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
