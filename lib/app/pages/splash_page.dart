import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ms_dreams_delights/app/routes/routes.dart';
import 'package:ms_dreams_delights/app/widgets/image.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3500),
        () => Get.offAllNamed(MyRoutes.HOME_PAGE));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageWidget(
                    "logo_splash.png",
                    width: 247,
                    height: 126,
                  ),
                  Lottie.asset(
                    'assets/lottie/donut-open.json',
                    width: 206,
                    height: 206,
                    repeat: false,
                  )
                ],
              ),
            ),
            Positioned(
              top: -2,
              child: ImageWidget(
                'calda_deretida.png',
                height: 140,
              ),
            )
          ],
        ),
      ),
    );
  }
}
