import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_package/GetNavigation/fifth_screen.dart';
import 'package:getx_package/GetNavigation/fourth_screen.dart';
import 'package:getx_package/GetNavigation/second_screen.dart';
import 'package:getx_package/GetNavigation/third_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeScreen(),
        ),
        GetPage(
            name: '/two',
            page: () => const SecondScreen(),
        ),
        GetPage(
          name: '/three',
          page: () => const ThirdScreen(),
        ),
        GetPage(
          name: '/four',
          page: () => const FourthScreen(),
        ),
        GetPage(
          name: '/five/:param',
          page: () => const FifthScreen(),
        ),
      ],
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int resultVal = 0;
  Transition transition = Transition.cupertino;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(const SecondScreen());
                },
                child: const Text('Scond Screen으로 이동')),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.off(const SecondScreen());
                },
                child: const Text('전 페이지로 돌아가지 못하게하기')),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.offAll(const SecondScreen());
                },
                child: const Text('모든 페이지 스택 삭제하기')),
            const Divider(),
            Text('리턴값 $resultVal'),
            ElevatedButton(
                onPressed: () async {
                  final response = await Get.to(
                    const ThirdScreen(),
                  );

                  setState(() {
                    resultVal = response;
                  });
                },
                child: const Text('리턴값 받아오기')),
            const Divider(),
            ElevatedButton(
                onPressed: () {
                  Get.to(const FourthScreen(), arguments: '효현이 멍청이');
                },
                child: const Text('아규먼트 보내기')),
            const Divider(),
            ElevatedButton(
                onPressed: () {
                  Get.to(const SecondScreen(), transition: Transition.fadeIn);
                },
                child: const Text('트랜지션')),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/five/test?id=0103&name=taejun');
                },
                child: const Text('네임드 라우트')),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.snackbar('제목', '내용', snackPosition: SnackPosition.TOP);
                },
                child: const Text('SnackBar')),

            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(middleText: "Dialog");
                },
                child: const Text("Dialog")),

            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(Wrap(
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.music_note),
                        title: const Text('Music'),
                        onTap: () => {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.music_note),
                        title: const Text('Music'),
                        onTap: () => {},
                      )
                    ],
                  ));
                },
                child: const Text('BottomSheet')),
          ],
        ),
      ),
    );
  }
}
