import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Battery battery = Battery();
  Future? batteryLevel;

  @override
  void initState() {
    super.initState();
    batteryLevel = getBatteryLevel();
  }

  Future getBatteryLevel() async {
    final btrLevel = await battery.batteryLevel;
    return btrLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(future: batteryLevel, builder: (context, snapshot){
          if(snapshot.hasData){
            return Text(snapshot.data.toString());
          } else {
            return const CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}

