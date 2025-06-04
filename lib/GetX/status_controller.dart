import 'package:get/get.dart';
import 'package:toy_flutter/GetX/person.dart';

class StatusController extends GetxController {
  int _count = 0;
  int get count=> _count;
  final person = Person().obs;   // obs : observable을 의미하며 오브젝트의 변화를 감지.

  void increment() {
    _count++;
    /*
       Simple state Management의 경우 update 메소드를 통해 화면을 리빌드 시켜야한다.
       update로 화면을 리빌드 시키지 않으면 , count 함수의 값은 올라가지만 실제 ui에 적용되지 않음.
     */
    update(); //
  }

  /*
    GetX가 update 메소도를 통한 변화를 감지하고 화면을 리빌드 시킨다.
   */
  void updateInfo() {
    person.update((fn) {
      fn?.age++;
      fn?.name = 'nx006';
    });
  }
}