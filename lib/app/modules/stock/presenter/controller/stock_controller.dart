import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/entities/ingredient_dto.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/usecases/ingredient_add_usecase.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/usecases/ingredient_delete_usecase.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/usecases/ingredient_edit_usecase.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/usecases/ingredient_get_usecase.dart';
import 'package:ms_dreams_delights/app/modules/stock/presenter/widgets/bottom_sheet_stock.dart';
import 'package:ms_dreams_delights/app/utils/utils.dart';

class StockController extends GetxController
    with StateMixin<List<IngredientDTO>> {
  @override
  void onInit() async {
    await getAllItems();

    super.onInit();
  }

  final RxInt tabIndex = 0.obs;

  final IIngredientAddUsecase _addUsecase;
  final IIngredientGetUsecase _getUsecase;
  final IIngredientDeleteUsecase _deleteUsecase;
  final IIngredientEditUsecase _editUsecase;

  late GlobalKey<FormState> formkey;

  final List<Measurement> listMeasurements = [
    Measurement.grama,
    Measurement.mililitro,
  ];

  final Rx<Measurement> seletedMeasurement = Measurement.grama.obs;

  final ScrollController scrollBottomSheetController = ScrollController();

  final formKeyIngrediente = GlobalKey<FormState>();
  final formKeyAdicional = GlobalKey<FormState>();

  XFile? imageSelected;
  final RxString imageSelectedName = ''.obs;
  XFile? imageAdiSelected;
  final RxString imageAdiSelectedName = ''.obs;
  final TextEditingController textTitleController = TextEditingController();
  final TextEditingController textAmountController = TextEditingController();
  final TextEditingController textValueController = TextEditingController();
  final TextEditingController textUnitController = TextEditingController();
  final TextEditingController textCostUnitController = TextEditingController();

  final TextEditingController textTitleAdicionalController =
      TextEditingController();
  final TextEditingController textAmountAdicionalController =
      TextEditingController();
  final TextEditingController textValueAdicionalController =
      TextEditingController();

  final TextEditingController textAdiCostUnitController =
      TextEditingController();

  final TextEditingController textSearchItems = TextEditingController();

  IngredientDTO? _itemSelected;

  final RxList<IngredientDTO> _listIngredients = <IngredientDTO>[].obs;

  StockController(this._addUsecase, this._getUsecase, this._deleteUsecase,
      this._editUsecase);

  final RxBool isEdit = false.obs;

  Future<void> getAllItems() async {
    change(null, status: RxStatus.loading());
    var r = await _getUsecase();

    r.fold(
      (l) {
        print('my error ${l.message}');
      },
      (r) {
        if (r.isEmpty) {
          return change(r, status: RxStatus.empty());
        }
        change(r, status: RxStatus.success());
        _listIngredients.value = r;
      },
    );
  }

  Future<void> onCreatedIngredient() async {
    change(null, status: RxStatus.loading());

    final r = await _addUsecase(await generetedDTOIngrediente());

    r.fold((l) {
      change(null, status: RxStatus.error());

      Future.delayed(const Duration(seconds: 1), () {
        change(null, status: RxStatus.success());
      });
    }, (r) {
      _listIngredients.add(r);
      print("CRIADOO  id: ${r.id}");
      change(_listIngredients, status: RxStatus.success());

      Navigator.pop(Get.context!);
      cleanTextControllers();
    });
  }

  Future<void> onCreatedAdicional() async {
    change(null, status: RxStatus.loading());

    print('MY IMAGE BYTES -- ${imageAdiSelected?.path}');

    final r = await _addUsecase(await generetedDTOAdicional());

    r.fold((l) {
      change(null, status: RxStatus.error());

      Future.delayed(const Duration(seconds: 1), () {
        change(null, status: RxStatus.success());
      });
    }, (r) {
      _listIngredients.add(r);
      print("CRIADOO ADICIONAL id ${r.id}");
      change(_listIngredients, status: RxStatus.success());
      // BottomSheet
      Navigator.pop(Get.context!);
      cleanTextControllers();
    });
  }

  void filterList(String value) {
    change(null, status: RxStatus.loading());
    Future.delayed(const Duration(seconds: 1), () {
      change(_listIngredients, status: RxStatus.success());
    });
  }

  List<IngredientDTO> listIngredientesFilter() {
    if (textSearchItems.text.isEmpty) return _listIngredients;
    return listIngredients
        .where((item) => item.title
            .toLowerCase()
            .contains(textSearchItems.text.toLowerCase()))
        .toList();
  }

  Future<IngredientDTO> generetedDTOAdicional({String? id}) async {
    return IngredientDTO.createdAdicional(
      id: id,
      AdditionalCreatedtDTO(
        pathImage: imageAdiSelected != null
            ? base64String(await imageAdiSelected!.readAsBytes())
            : "default.png",
        title: textTitleAdicionalController.text,
        amount: int.parse(textAmountAdicionalController.text),
        value: (double.tryParse(textValueAdicionalController.text) ?? 0),
        file: imageAdiSelected,
        costUnit: (double.tryParse(textAdiCostUnitController.text) ?? 0),
      ),
    );
  }

  Future<IngredientDTO> generetedDTOIngrediente({String? id}) async {
    return IngredientDTO.createdIngredient(
      id: id,
      IngredienCreatedtDTO(
        pathImage: imageSelected != null
            ? base64String(await imageSelected!.readAsBytes())
            : "default.png",
        title: textTitleController.text,
        amount: int.parse(textAmountController.text),
        value: (double.tryParse(textValueController.text) ?? 0),
        unit: (double.tryParse(textUnitController.text) ?? 0),
        costUnit: (double.tryParse(textCostUnitController.text) ?? 0),
        measurement: seletedMeasurement.value,
        file: imageSelected,
      ),
    );
  }

  Future<void> onDeleteItem(IngredientDTO item) async {
    var r = await _deleteUsecase(item.id);
    print('DELETENDO.... ${_listIngredients.length}');

    r.fold((l) {}, (r) {
      _listIngredients.remove(item);
      if (_listIngredients.isEmpty) {
        return change(_listIngredients, status: RxStatus.empty());
      }
      change(_listIngredients, status: RxStatus.success());
    });
    print('DELETADO.... ${_listIngredients.length}');
  }

  void onValidForm(
      GlobalKey<FormState> formKey, Future<void> Function() onSaveP) {
    print('form is not valid -- ${formKey.currentState!.validate()}');
    if (formKey.currentState!.validate()) {
      // Se o form for válido exibe um a snackbar
      onSaveP();
      return;
    }
    Get.showSnackbar(const GetSnackBar(
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
      title: "Formulario invalido",
      message: "Preencha todos os campos",
    ));
    return;
  }

  Future<void> onEditItem(IngredientDTO item) async {
    _itemSelected = item;
    print(item.id);
    isEdit.value = true;
    if (item.type == Type.additional) {
      tabIndex.value = 1;
      textTitleAdicionalController.text = item.title;
      textAmountAdicionalController.text = item.amount.toString();
      textValueAdicionalController.text = item.value.toString();
      imageAdiSelectedName.value = item.pathImage ?? '';
      textAdiCostUnitController.text = item.costUnit.toString();
    } else {
      tabIndex.value = 0;
      textTitleController.text = item.title;
      textAmountController.text = item.amount.toString();
      textCostUnitController.text = item.costUnit.toString();
      textValueController.text = item.value.toString();
      textUnitController.text = item.unit.toString();
      imageSelectedName.value = item.pathImage ?? '';
    }

    seletedMeasurement.value = item.measurement!;

    await onShowBottomSheet();
  }

  Future<void> editItem() async {
    var r = await _editUsecase(_itemSelected?.type == Type.additional
        ? await generetedDTOAdicional(id: _itemSelected?.id)
        : await generetedDTOIngrediente(id: _itemSelected?.id));

    r.fold((l) {}, (r) {
      _listIngredients.remove(_itemSelected);

      _listIngredients.add(r);

      change(_listIngredients, status: RxStatus.success());
      Navigator.pop(Get.context!);
      cleanTextControllers();
    });
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
        return BottomSheetEstoque(
          controller: StockController.to,
        );
      },
    );
  }

  void onCalculCust(String? value) {
    if (textValueController.text.isEmpty || textUnitController.text.isEmpty) {
      return;
    }

    double value =
        (double.parse(textValueController.text.replaceAll(',', '.')));
    double unit = (double.parse(textUnitController.text.replaceAll(',', '.')));

    textCostUnitController.text = (value / unit).toString();
  }

  void onCalculCustAdd(String? value) {
    if (textValueAdicionalController.text.isEmpty ||
        textAmountAdicionalController.text.isEmpty) {
      return;
    }

    double value =
        (double.parse(textValueAdicionalController.text.replaceAll(',', '.')));
    double unit =
        (double.parse(textAmountAdicionalController.text.replaceAll(',', '.')));

    textAdiCostUnitController.text = (value / unit).toString();
  }

  void cleanImage() {
    imageSelected = null;
    imageSelectedName.value = '';
  }

  void cleanTextControllers() {
    cleanImage();
    _itemSelected = null;
    isEdit.value = false;
    textTitleController.clear();
    textAmountController.clear();
    textValueController.clear();
    textUnitController.clear();
    textCostUnitController.clear();
    formkey = GlobalKey();

    textTitleAdicionalController.clear();
    textAmountAdicionalController.clear();
    textValueAdicionalController.clear();
    textAdiCostUnitController.clear();
  }

  Future<void> onImageSelected(XFile image) async {
    print('MY IMAGE -- ${image.path} -- nameSave: ${image.path}');
    imageSelected = image;
    imageSelectedName.value = base64String(await image.readAsBytes());
  }

  List<IngredientDTO> get listIngredients => _listIngredients;

  static StockController get to => Get.find();
}
