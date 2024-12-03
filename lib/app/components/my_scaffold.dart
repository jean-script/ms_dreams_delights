import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_dreams_delights/app/components/app_bar_custom.dart';
import 'package:ms_dreams_delights/app/controllers/navigation_controller.dart';
import 'package:ms_dreams_delights/app/routes/routes.dart';

import 'package:ms_dreams_delights/app/utils/hexcolor.dart';
import 'package:ms_dreams_delights/app/widgets/image.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;
  final void Function()? onTap;
  final RxBool showFloatingActionButton = true.obs;
  final Color? backgroundColor;
  final Widget? bottomSheet;
  MyScaffold({
    super.key,
    required this.body,
    this.onTap,
    this.backgroundColor,
    this.bottomSheet,
    bool? showFloatingAction,
  }) {
    showFloatingActionButton.value = showFloatingAction ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
        appBar: AppbarCustom(),

        body: body,
        floatingActionButton: Obx(() => showFloatingActionButton.value
            ? Padding(
                padding: const EdgeInsets.only(bottom: 58),
                // padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: onTap,
                  shape: const CircleBorder(),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            : const SizedBox()),
        bottomSheet: bottomSheet ?? MyBottomNavigationBar(),
        // bottomNavigationBar: MyBottomNavigationBar(),
      ),
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  MyBottomNavigationBar({super.key});

  final List<ItemBar> items = [
    ItemBar(
      icon: 'home_icon.png',
      label: 'Home',
      toPage: MyRoutes.HOME_PAGE,
    ),
    ItemBar(
      icon: 'pedidos_icon.png',
      label: 'Pedidos',
      toPage: MyRoutes.PEDIDOS_PAGE,
    ),
    ItemBar(
      icon: 'produtos_icon.png',
      label: 'Produtos',
      toPage: MyRoutes.PRODUTOS_PAGE,
    ),
    ItemBar(
      icon: 'estoque_icon.png',
      label: 'Estoque',
      toPage: MyRoutes.ESTOQUE_PAGE,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        border: Border(
          top: BorderSide(
            color: HexColor('#D0CDCD'),
          ),
        ),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // ...items.mapWithIndex(
          //   (item, index) => MyBottomNavigationBarItem(
          //     icon: item.icon,
          //     label: item.label,
          //     index: index,
          //     page: item.toPage,
          //   ),
          // ),

          MyBottomNavigationBarItem(
            icon: 'home_icon.png',
            label: 'Home',
            index: 0,
            page: MyRoutes.HOME_PAGE,
          ),
          MyBottomNavigationBarItem(
            icon: 'pedidos_icon.png',
            index: 1,
            label: 'Pedidos',
            page: MyRoutes.PEDIDOS_PAGE,
          ),
          MyBottomNavigationBarItem(
            icon: 'produtos_icon.png',
            index: 2,
            label: 'Produtos',
            page: MyRoutes.PRODUTOS_PAGE,
          ),
          MyBottomNavigationBarItem(
            icon: 'estoque_icon.png',
            label: 'Estoque',
            index: 3,
            page: MyRoutes.ESTOQUE_PAGE,
          ),
        ],
      ),
    );
  }
}

class MyBottomNavigationBarItem extends GetView<NavigationController> {
  final String label;
  final String icon;
  final int index;
  final String page;
  const MyBottomNavigationBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    final Rx<Color> activeColor =
        (Get.currentRoute == page ? HexColor('#F582A1') : HexColor('#FFF')).obs;
    print('BUILDE NAVIGATION');
    return IconButton(
      onPressed: () => controller.onChangePage(index, page),
      icon: Container(
        constraints: const BoxConstraints(
          maxWidth: 50,
          minWidth: 50,
        ),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageWidget(
                icon,
                color: activeColor.value,
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 12,
                      color: activeColor.value,
                    ),
              )
            ],
          );
        }),
      ),
    );
  }
}

class ItemBar {
  final String icon;
  final String label;
  final String toPage;
  ItemBar({
    required this.icon,
    required this.label,
    required this.toPage,
  });

  ItemBar copyWith({
    String? icon,
    String? label,
    String? toPage,
  }) {
    return ItemBar(
      icon: icon ?? this.icon,
      label: label ?? this.label,
      toPage: toPage ?? this.toPage,
    );
  }
}
