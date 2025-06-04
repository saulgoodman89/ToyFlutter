import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return  Scaffold(
             body: Center(
               child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed : () => Get.toNamed('/'), child: Text('toNamed First Screen')),
                    ElevatedButton(onPressed : () => Get.toNamed('/third'), child: Text('toNamed Third')),
                    ElevatedButton(onPressed : () => Get.back(), child: Text('Back'))
                  ],
                  ),
              )
    );
  }

}