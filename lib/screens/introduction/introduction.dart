/*
import 'package:flutter/material.dart';
import 'package:study_flutter_app/configs/themes/app_colors.dart';
//import 'package:study_flutter_app/widgets/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
          alignment: Alignment.center,
          child:Padding(
            padding:  EdgeInsets.symmetric(horizontal: Get.width * 0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Icon(
                Icons.star,
                size:65,
                color: Colors.white,
              ),
              SizedBox(height: 40),
              const Text(
                'This is a study app. You can use it as you want. If you understand how it works, you would be able to scale it.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: kOnSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto Condensed',


                ),
              ),
                SizedBox(height: 40),
              AppCircleButton(
                  onTap: () => null,
                  child: const Icon(Icons.arrow_forward, size: 35, color: Colors.white))

             ],
            ),
          )
      )
    );
  }
}

 */
