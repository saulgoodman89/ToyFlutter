import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_flutter/GetX/fourth_screen.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*
                      최초 Get.to('/second') 시  "Unexpected String , use toNamed() instead " 에러 발생.
                      to로 이동하려면 SecondScreen() 으로 이동 가능.
                      Get.to : 간단하게 화면 이동
                      Get.toNamed : getpages 속성에 추가된 name 으로 이동
                      Get.off
                      Get.offAll()
                 */
              ElevatedButton(onPressed : () => Get.toNamed('/second'), child: Text('Back to Second Screen')),
              ElevatedButton(onPressed : () => Get.toNamed('/fourth'), child: Text('Move Fourth Screen')),
              ElevatedButton(onPressed : () => Get.offAll(FourthScreen()), child: Text('Move Fourth offAll')),
              ElevatedButton(onPressed : () => Get.back(), child: Text('Back'))
            ],
          ),
        )
    );
  }
}