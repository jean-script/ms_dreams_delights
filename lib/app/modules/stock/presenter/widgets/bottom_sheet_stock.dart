import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_dreams_delights/app/components/button_bottom_sheet.dart';
import 'package:ms_dreams_delights/app/modules/stock/presenter/controller/stock_controller.dart';
import 'package:ms_dreams_delights/app/modules/stock/presenter/widgets/form_adicionais.dart';
import 'package:ms_dreams_delights/app/modules/stock/presenter/widgets/form_ingredientes.dart';

class BottomSheetEstoque extends StatefulWidget {
  final StockController controller;
  const BottomSheetEstoque({
    super.key,
    required this.controller,
  });

  @override
  State<BottomSheetEstoque> createState() => _BottomSheetEstoqueState();
}

class _BottomSheetEstoqueState extends State<BottomSheetEstoque> {
  @override
  void dispose() {
    StockController.to.cleanTextControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).viewInsets.bottom == 0.0) {
      try {
        widget.controller.scrollBottomSheetController.animateTo(0.0,
            duration: const Duration(milliseconds: 700),
            curve: Curves.decelerate);
      } catch (e) {}
    } else {
      try {
        widget.controller.scrollBottomSheetController.animateTo(
            MediaQuery.of(context).viewInsets.bottom,
            duration: const Duration(milliseconds: 700),
            curve: Curves.decelerate);
      } catch (e) {}
    }
    return Stack(
      children: [
        SingleChildScrollView(
          controller: widget.controller.scrollBottomSheetController,
          child: Obx(() => SizedBox(
                height: (widget.controller.tabIndex.value == 0 ? 810 : 810) +
                    (widget.controller.tabIndex.value == 0
                        ? MediaQuery.of(context).viewInsets.bottom
                        : 40),
                child: Column(
                  children: [
                    SizedBox(
                      height: 34,
                      width: 342,
                      child: DefaultTabController(
                        length: 2,
                        initialIndex: widget.controller.tabIndex.value,
                        child: Material(
                          color: Colors.transparent,
                          child: TabBar(
                            dividerColor: Colors.transparent,
                            indicatorColor:
                                Theme.of(context).colorScheme.secondary,
                            onTap: StockController.to.isEdit.value
                                ? null
                                : (value) =>
                                    widget.controller.tabIndex.value = value,
                            tabs: [
                              SizedBox(
                                height: 34,
                                child: Center(
                                  child: Obx(() => Text(
                                        'ingrediente',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                                fontSize: 20,
                                                color: widget.controller
                                                            .tabIndex.value ==
                                                        0
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .secondary
                                                    : null),
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 34,
                                child: Center(
                                  child: Obx(
                                    () => Text(
                                      'Adicional',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                              fontSize: 20,
                                              color: widget.controller.tabIndex
                                                          .value ==
                                                      1
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .secondary
                                                  : null),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => widget.controller.tabIndex.value == 0
                          ? const FormIngredientes()
                          : const FormAdicionais(),
                    ),
                  ],
                ),
              )),
        ),
        Positioned(
          bottom: 0,
          child: ButtonBottomSheet(
            onTap: () {
              widget.controller.tabIndex.value == 0
                  ? widget.controller.onValidForm(
                      widget.controller.formKeyIngrediente,
                      widget.controller.isEdit.value
                          ? widget.controller.editItem
                          : widget.controller.onCreatedIngredient)
                  : widget.controller.onValidForm(
                      widget.controller.formKeyAdicional,
                      widget.controller.isEdit.value
                          ? widget.controller.editItem
                          : widget.controller.onCreatedAdicional);
            },
            //   if (widget.controller.imageSelected == null ||
            //       widget.controller.imageSelected!.name.isEmpty) return;
            //   print(
            //       'form is not valid -- ${_formKey.currentState!.validate()}');
            //   if (_formKey.currentState!.validate()) {
            //     // Se o form for válido exibe um a snackbar
            //     widget.controller.onCreated();
            //     return;
            //   }
            //   Get.showSnackbar(const GetSnackBar(
            //     snackPosition: SnackPosition.TOP,
            //     duration: Duration(seconds: 2),
            //     title: "Formulario invalido",
            //     message: "Preencha todos os campos",
            //   ));
            //   return;
            //   // print('chama create');
            // },
          ),
        ),
      ],
    );
  }
}
