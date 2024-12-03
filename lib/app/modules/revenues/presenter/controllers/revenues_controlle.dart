import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/entities/revenues_entity.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/usecases/revenues_created_usecase.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/usecases/revenues_delete_usecase.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/usecases/revenues_get_usecase.dart';
import 'package:ms_dreams_delights/app/modules/revenues/presenter/widgets/bottom_sheet_revenues_add_ingredient.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/entities/ingredient_dto.dart';
import 'package:ms_dreams_delights/app/modules/stock/presenter/controller/stock_controller.dart';
import 'package:ms_dreams_delights/app/utils/utils.dart';

class RevenuesController extends GetxController
    with StateMixin<List<RevenuesDTO>> {
  final IRevenuesGetUsecase _getUsecase;
  final IRevenuesCreatedUsecase _createdUsecase;
  final IRevenuesDeleteUsecase _deleteUsecase;

  final TextEditingController textSearch = TextEditingController();
  final TextEditingController textSearchIngredients = TextEditingController();
  final RxList<RevenuesDTO> _listRevenues = <RevenuesDTO>[].obs;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController totalValueController = TextEditingController();
  final imageSelected = XFile('').obs;

  final RxList<IngredientDTO> _listIngredientes = <IngredientDTO>[].obs;
  final RxList<IngredientDTO> _listIngreisAdd = <IngredientDTO>[].obs;

  List<RevenuesDTO> get listRevenues => _listRevenues;
  List<IngredientDTO> get listIngredientes => _listIngredientes;
  List<IngredientDTO> get listIngreisAdd => _listIngreisAdd;
  set imageSelected(Rx<XFile> file) => imageSelected = file;
  final GlobalKey<FormState> formkey = GlobalKey();
  final RxDouble totalAdicionais = 0.0.obs;

  final ScrollController scrollAdicionadosController = ScrollController();

  RevenuesDTO? revenuesDetail;

  final box = GetStorage();

  bool isEdit = false;

  RevenuesController(
      this._getUsecase, this._createdUsecase, this._deleteUsecase);

  @override
  void onInit() async {
    await getRevenues();
    super.onInit();
  }

  void changeSucess() {
    change(null, status: RxStatus.success());
  }

  void changeEmpyt() {
    if (_listRevenues.isEmpty) {
      return change(_listRevenues, status: RxStatus.empty());
    }
  }

  Future<void> onCreated() async {
    try {
      change(null, status: RxStatus.loading());
      var r = await _createdUsecase(RevenuesCreatedDTO(
        title: titleController.text,
        description: descriptionController.text,
        amount: (int.tryParse(amountController.text) ?? 0),
        totalValue: (double.tryParse(totalValueController.text) ?? 0),
        ingredients: _listIngredientes,
        image: base64String(await imageSelected.value.readAsBytes()),
      ));

      r.fold((l) {
        change(null, status: RxStatus.success());
        print('error -- ${l.message}');
        Get.showSnackbar(const GetSnackBar(
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
          title: "Error ao Salvar Receita",
          message: "Tente outra vez",
        ));
        return;
      }, (res) {
        getRevenues();
        Get.back();
        cleanForm();
      });
    } catch (e) {
      print('my error supreme - -$e');
    }
  }

  Future<void> onEdit() async {
    try {
      change(null, status: RxStatus.loading());
      var r = await _createdUsecase(RevenuesCreatedDTO(
        title: titleController.text,
        description: descriptionController.text,
        amount: (int.tryParse(amountController.text) ?? 0),
        totalValue: (double.tryParse(totalValueController.text) ?? 0),
        ingredients: _listIngredientes,
        image: base64String(await imageSelected.value.readAsBytes()),
      ));

      r.fold((l) {
        change(null, status: RxStatus.success());
        print('error -- ${l.message}');
        Get.showSnackbar(const GetSnackBar(
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
          title: "Error ao Salvar Receita",
          message: "Tente outra vez",
        ));
        return;
      }, (res) {
        getRevenues();
        Get.back();
        cleanForm();
      });
    } catch (e) {
      print('my error supreme - -$e');
    }
  }

  void editRevenues(RevenuesDTO dto) async {
    isEdit = true;
    titleController.text = dto.title;
    descriptionController.text = dto.description;
    amountController.text = dto.amount.toString();
    totalValueController.text = dto.totalValue.toString();
    _listIngredientes.addAll(dto.ingredients);
    revenuesDetail = dto;
  }

  void closePage() {
    cleanForm();
    isEdit = false;
    revenuesDetail = null;
  }

  Future<void> onDeleteRevenues(RevenuesDTO dto) async {
    var r = await _deleteUsecase(dto.id);

    r.fold((l) {}, (r) {
      _listRevenues.remove(dto);
      if (_listRevenues.isEmpty) {
        return change(_listRevenues, status: RxStatus.empty());
      }
      change(_listRevenues, status: RxStatus.success());
    });
  }

  Future<void> getRevenues() async {
    var r = await _getUsecase();

    r.fold((l) {
      change(null, status: RxStatus.error());
    }, (r) {
      _listRevenues.value = r;
      if (r.isEmpty) {
        return change(_listRevenues, status: RxStatus.empty());
      }
      return change(_listRevenues, status: RxStatus.success());
    });
  }

  void filterList(String value) {
    change(null, status: RxStatus.loading());
    Future.delayed(const Duration(seconds: 1), () {
      change(_listRevenues, status: RxStatus.success());
    });
  }

  List<RevenuesDTO> listFilter() {
    if (textSearch.text.isEmpty) return _listRevenues;
    return _listRevenues
        .where((item) =>
            item.title.toLowerCase().contains(textSearch.text.toLowerCase()))
        .toList();
  }

  onImageSelected(XFile file) async {
    imageSelected.value = file;
  }

  Future<void> onShowBottomSheet() async {
    await showModalBottomSheet(
      showDragHandle: true,
      context: Get.context!,
      isScrollControlled: true,
      constraints: const BoxConstraints(
        maxHeight: 620,
        minHeight: 600,
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      builder: (context) {
        return const BottomSheetRevenuesAddIngredient();
      },
    );
  }

  void addItemInListingredienAdd(IngredientDTO item) {
    if (_listIngreisAdd.contains(item)) return;
    _listIngreisAdd.add(item);

    try {
      scrollAdicionadosController
          .jumpTo(scrollAdicionadosController.position.maxScrollExtent);
    } catch (e) {}

    calculeTotalAdicional();
  }

  void favorite(RevenuesDTO revenue) async {
    List<RevenuesDTO> revenuesX = [];
    print('initial');
    if (box.hasData('revenues')) {
      List<dynamic> r = await box.read('revenues');
      revenuesX = r.map((i) => RevenuesDTO.fromMap(i, i['id'])).toList();
      if (revenuesX.contains(revenue)) {
        revenue.favorite.value = false;
        revenuesX.remove(revenue);
        print('removeu');
      } else {
        print('add');
        revenue.favorite.value = true;
        revenuesX.add(revenue);
      }
    }

    await box.write(
        'revenues', revenuesX.map((e) => RevenuesDTO.toMapWithId(e)).toList());
  }

  List<IngredientDTO> listIngredientesFilter() {
    print('TESTE PESQUISA -- ${textSearchIngredients.text}');
    if (textSearchIngredients.text.isEmpty) {
      return StockController.to.listIngredients;
    }
    return StockController.to.listIngredients
        .where((item) => item.title
            .toLowerCase()
            .contains(textSearchIngredients.text.toLowerCase()))
        .toList();
  }

  void removeItemInListingredienAdd(IngredientDTO item) {
    print('CALCULE TOTAL REMOVE -- ${item.totalValueCost.value}');
    _listIngreisAdd.remove(item);
    calculeTotalAdicional();
  }

  void removeItemInListingredien(IngredientDTO item) {
    print('CALCULE TOTAL REMOVE -- ${totalValueController.text}');
    listIngredientes.remove(item);
    calculeCostTotal();
  }

  void calculeTotalAdicional() {
    print('CALCULE TOTAL  ADD');
    double r = 0.0;
    for (var el in _listIngreisAdd) {
      r += el.totalValueCost.value;
    }
    totalAdicionais.value = r;
  }

  void addIngredienteInRevenues() {
    Navigator.of(Get.context!).pop();
    calculeCostTotal();
    cleanBottomSheetForm();
  }

  calculeCostTotal({RevenuesDTO? item}) {
    if (item != null) {
      _listIngredientes.remove(item);
    } else {
      _listIngredientes.addAll([..._listIngreisAdd]);
    }

    double r = 0.0;
    for (var el in _listIngredientes) {
      r += el.totalValueCost.value;
    }
    totalValueController.text = r.toString();
  }

  void cleanBottomSheetForm() {
    _listIngreisAdd.value = [];
    totalAdicionais.value = 0.0;
    textSearchIngredients.clear();
  }

  cleanForm() {
    amountController.clear();
    descriptionController.clear();
    _listIngredientes.value = [];
    titleController.clear();
    totalValueController.clear();
    imageSelected.value = XFile('');
  }

  static RevenuesController get to => Get.find();
}
