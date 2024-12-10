import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? weatherStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FractionallySizedBox(
              widthFactor: 0.5,
              child: Column(
                children: [
                  if (weatherStatus != null)
                    SvgPicture.asset(
                      'assets/images/$weatherStatus.svg',
                      height: MediaQuery.of(context).size.width * 0.5,
                    )
                  else
                    Placeholder(
                      fallbackHeight: MediaQuery.of(context).size.width * 0.5,
                    ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '** ℃',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Colors.blue,
                            ),
                      ),
                      Text(
                        '** ℃',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Colors.red,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const SizedBox(height: 80),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    child: const Text('Close'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: const Text('Reload'),
                    onPressed: () {
                      final newStatus = weatherApi.fetchSimpleWeather();

                      setState(() {
                        weatherStatus = newStatus;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('weatherStatus', weatherStatus));
  }
}
