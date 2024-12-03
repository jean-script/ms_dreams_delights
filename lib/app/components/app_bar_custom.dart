import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_dreams_delights/app/modules/revenues/presenter/controllers/revenues_controlle.dart';
import 'package:ms_dreams_delights/app/routes/routes.dart';
import 'package:ms_dreams_delights/app/widgets/image.dart';

class AppbarCustom extends AppBar {
  AppbarCustom({super.key})
      : super(
          title: [MyRoutes.REVENUES_CREATE_PAGE, MyRoutes.REVENUES_DETAIL_PAGE]
                  .contains(Get.currentRoute)
              ? null
              : ImageWidget(
                  'logo_splash.png',
                  width: 84,
                  height: 43,
                  fit: BoxFit.fitWidth,
                ),
          leading: [
            MyRoutes.REVENUES_CREATE_PAGE,
            MyRoutes.REVENUES_DETAIL_PAGE
          ].contains(Get.currentRoute)
              ? IconButton(
                  onPressed: () {
                    RevenuesController.to.changeEmpyt();
                    Get.back();
                    Future.delayed(const Duration(milliseconds: 100), () {
                      RevenuesController.to.closePage();
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_circle_left,
                    size: 25,
                  ),
                )
              : null,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Theme.of(Get.context!).colorScheme.primary,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                size: 25,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: ImageWidget(
                'cart_kiosk.png',
                width: 25,
                height: 25,
              ),
            )
          ],
        );
}
