import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({super.key});

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                Get.parameters['param']!,
            ),
            Text(
              Get.parameters['id']!,
            ),
            Text(
              Get.parameters['name']!,
            )
          ],
        ),
      ),
    );
  }
}
