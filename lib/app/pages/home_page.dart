import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ms_dreams_delights/app/controllers/navigation_controller.dart';
import 'package:ms_dreams_delights/app/pages/receitas_page.dart';

class HomePage extends GetView<NavigationController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReceitasPage();
  }
}
