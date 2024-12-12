import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int radioVal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Radio(
                  groupValue: radioVal,
                  value: 0,
                  onChanged: (value) {
                    setState(() {
                      radioVal = value!;
                    });
                  },
                ),
                const Text('0'),
              ],
            ),
            Row(
              children: [
                Radio(
                  groupValue: radioVal,
                  value: 1,
                  onChanged: (value) {
                    setState(() {
                      radioVal = value!;
                    });
                  },
                ),
                const Text('1'),
              ],
            ),
            Row(
              children: [
                Radio(
                  groupValue: radioVal,
                  value: 2,
                  onChanged: (value) {
                    setState(() {
                      radioVal = value!;
                    });
                  },
                ),
                const Text('2'),
              ],
            ),
            ElevatedButton(onPressed: (){
              Get.back(result: radioVal);
            }, child: const Text('리턴 값 보내기'))
          ],
        ),
      ),
    );
  }
}
