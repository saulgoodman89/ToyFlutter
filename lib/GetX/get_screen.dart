import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_flutter/GetX/first_screen.dart';
import 'package:toy_flutter/GetX/fourth_screen.dart';
import 'package:toy_flutter/GetX/second_screen.dart';
import 'package:toy_flutter/GetX/status_controller.dart';
import 'package:toy_flutter/GetX/third_screen.dart';

class GetApp extends StatelessWidget {
 // final statusController = Get.put(StatusController()); // GetxController를 init
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*
      GetX 사용 시 root 에만 GetMaterialApp을 사용해야함.
     */
    return GetMaterialApp(
      title: 'Toy GetX',
      initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => FirstScreen()),
          GetPage(name: '/second', page : () => SecondScreen()),
          GetPage(name: '/third', page : () => ThirdScreen()),
          GetPage(name: '/fourth', page : () => FourthScreen()),
      ],
    );
    /*  GetX react / non-react 진행
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*
                  GetBUilder : 비반응형 상태관리 방식을 지원. 상태 변경 시 전체 위젯 트리를 다시 빌드하는 대신 특정 부분만 빌드.
                 */
                GetBuilder<StatusController>
                  (builder: (_)=>
                Text(
                  /*
                    find() GetX의 DI에 의해 등록된 객체를 찾아 반환하는 역활. 이걸로 Controller나 Service에 쉽게 접근 가능.
                    put() 인스턴스를 즉시 생성하여 DI Container에 등록
                    lazyPut() : 인스턴스가 실제 필요할 때 생성하여 등록.
                    putAsync() 비동기적으로 인스턴스 생성
                   */
                  'Name :  ${Get.find<StatusController>().person().name}',
                  style: const TextStyle(fontSize: 20),
                )),
                Container(
                  margin: const EdgeInsets.all(20),
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlue,
                   ),
                 child: Center(
                  child: GetX(
                  init: StatusController(),
                  builder: (controller) => Text(
                  'Name: ${Get.find<StatusController>().person().age}',
                  style: const TextStyle(
                  fontSize: 20, color: Colors.white),
                  ))),
                ),
                ElevatedButton(onPressed: () =>
                    Get.to(() => SecondScreen()), child: const Text(
                  'move second screen'
                ))
              ],
            )
          ),
          floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Get.find<StatusController>().updateInfo();
              },
          )
        )
      );*/
  }
}