import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/entities/revenues_entity.dart';
import 'package:ms_dreams_delights/app/modules/revenues/presenter/widgets/modal_finish_revenue.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/entities/ingredient_dto.dart';

class RevenuesSelectedController extends GetxController {
  final RevenuesDTO revenuesDetail;
  final _listDoneIngredients = <IngredientDTO>[].obs;
  final _listIngredients = <IngredientDTO>[].obs;

  RevenuesSelectedController(this.revenuesDetail) {
    _listIngredients.value = revenuesDetail.ingredients;
  }

  void addIngredientDone(IngredientDTO item) {
    if (_listDoneIngredients.contains(item)) {
      _listDoneIngredients.remove(item);
    } else {
      _listDoneIngredients.add(item);
    }
    checkLengthList();
  }

  void checkLengthList() {
    if (listIngrediente().isEmpty) {
      showDialog(
        context: Get.context!,
        barrierDismissible: true,
        builder: (context) => const ModalFinishRevenue(),
      );
    }
  }

  List<IngredientDTO> listIngrediente() {
    return _listIngredients
        .where((item) => !_listDoneIngredients.contains(item))
        .toList();
  }

  List<IngredientDTO> get listDoneIngredients => _listDoneIngredients.value;
  set listDoneIngredients(List<IngredientDTO> list) =>
      _listDoneIngredients.value = list;
  List<IngredientDTO> get listIngredients => _listIngredients;
  set listIngredients(List<IngredientDTO> list) =>
      _listIngredients.value = list;

  static RevenuesSelectedController get to => Get.find();
}
