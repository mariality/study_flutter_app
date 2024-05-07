import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:quizzle/configs/themes/app_colors.dart';
//import 'package:quizzle/screens/home/home_screen.dart';
//import 'package:quizzle/widgets/common/circle_button.dart';

import '../../configs/themes/app_colors.dart';
import '../../widgets/common/circle_button.dart';
import '../home/home_screen.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);
  static const String routeName = '/introduction';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
                color: kOnSurfaceTextColor,
              ),
              SizedBox(height: 40,),
              const Text(
                'This is a study app. You can use it as you want. If you understand how this works, you would be able to scale it.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: kOnSurfaceTextColor,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 40,),
              CircularButton(
                  onTap: () => Get.offAndToNamed(HomeScreen.routeName),
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 35,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
