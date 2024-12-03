import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_dreams_delights/app/pages/estoque_page.dart';
import 'package:ms_dreams_delights/app/pages/pedidos_page.dart';
import 'package:ms_dreams_delights/app/pages/receitas_page.dart';
import 'package:ms_dreams_delights/app/pages/product_page.dart';

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final PageController pageController = PageController();

  final List<Widget> listPages = [
    const ReceitasPage(),
    const PedidosPage(),
    const ProductPage(),
     EstoquePage(),
  ];

  void onChangePage(int index, String page) {
    Get.offAndToNamed(page);
    // print('CHANGE PAGE $index');
    // selectedIndex.value = index;
    // pageController.animateToPage(index,
    //     duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  static NavigationController get to => Get.find();
}
