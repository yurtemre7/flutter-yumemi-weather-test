import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_training/home.dart';

class YellowScreen extends StatefulWidget {
  const YellowScreen({super.key});

  @override
  State<YellowScreen> createState() => _YellowScreenState();
}

class _YellowScreenState extends State<YellowScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    unawaited(
      WidgetsBinding.instance.endOfFrame.then((v) async {
        await pushDelayed();
      }),
    );
  }

  Future<void> pushDelayed() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (!mounted) {
      return;
    }
    await Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const Home(),
      ),
    );
    await pushDelayed();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.yellow,
    );
  }
}
