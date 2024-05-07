import 'package:flutter/material.dart';

import '../../configs/themes/app_colors.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:quizzle/configs/configs.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Image.asset('assets/images/app_splash_logo.png',
          width: 200, height: 200,
        ),
      ),
    );
  }
}
