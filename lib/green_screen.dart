import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_training/home.dart';

class GreenScreen extends StatefulWidget {
  const GreenScreen({super.key});

  @override
  State<GreenScreen> createState() => _GreenScreenState();
}

class _GreenScreenState extends State<GreenScreen> with WidgetsBindingObserver {
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
