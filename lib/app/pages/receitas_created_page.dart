import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ms_dreams_delights/app/components/my_scaffold.dart';
import 'package:ms_dreams_delights/app/components/my_text_form_field.dart';
import 'package:ms_dreams_delights/app/modules/revenues/presenter/controllers/revenues_controlle.dart';
import 'package:ms_dreams_delights/app/modules/revenues/presenter/widgets/item_selected_ingredients.dart';
import 'package:ms_dreams_delights/app/modules/revenues/presenter/widgets/selector_img.dart';
import 'package:ms_dreams_delights/app/utils/hexcolor.dart';

class ReceitasCreatedPage extends GetView<RevenuesController> {
  const ReceitasCreatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      bottomSheet: GestureDetector(
        onTap: () {
          if (controller.imageSelected.value.name.isEmpty &&
              !controller.isEdit) {
            Get.showSnackbar(const GetSnackBar(
              snackPosition: SnackPosition.BOTTOM,
              duration: Duration(seconds: 2),
              title: "Formulario invalido",
              message: "Adicione uma image!",
            ));
            return;
          }
          if (!controller.formkey.currentState!.validate()) return;
          if (controller.listIngredientes.isEmpty) return;
          print('SALVANDO RECEITA...');
          controller.isEdit ? controller.onEdit() : controller.onCreated();
        },
        child: Container(
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
          child: Center(
            child: Text(
              '${controller.isEdit ? "Editar" : 'Salvar'} receita',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: HexColor('#FFF'),
                  ),
            ),
          ),
        ),
      ),
      showFloatingAction: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: controller.obx(
        (_) => SingleChildScrollView(
          child: Form(
            key: controller.formkey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              // height: MediaQuery.of(context).size.height - 75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectorImg(),
                  const SizedBox(height: 10),
                  Text(
                    'Titúlo',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  MyTextFormField(
                    textController: controller.titleController,
                    hintText: 'Donuts Tradicional',
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Descrição',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  MyTextFormField(
                    textController: controller.descriptionController,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    height: 90,
                    hintText:
                        'Aprenda a fazer donuts americanos irresistíveis em casa! Uma receita perfeita para qualquer hora do dia. Experimente essa receita deliciosa!',
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 132,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Porções',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontSize: 12),
                            ),
                            MyTextFormField(
                              textController: controller.amountController,
                              isDense: true,
                              hintText: '10',
                              height: 55,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 132,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Custo',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontSize: 12),
                            ),
                            MyTextFormField(
                              readOnly: true,
                              textController: controller.totalValueController,
                              isDense: true,
                              isValide: false,
                              height: 55,
                              hintText: '12,99',
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ingredientes',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      IconButton(
                        onPressed: () => controller.onShowBottomSheet(),
                        icon: const Icon(
                          Icons.add_circle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Obx(
                      () => controller.listIngredientes.isEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Lottie.asset(
                                  'assets/lottie/empyt-ingredients.json',
                                  repeat: false,
                                  height: 150,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'Deixei sua receita mais saborasa!\nAdicione ingredientes!',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ),
                              ],
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 10),
                              itemCount: controller.listIngredientes.length,
                              itemBuilder: (_, index) {
                                var item = controller.listIngredientes[index];
                                return ItemSelectedIngredients(item: item);
                              },
                            ),
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
        onLoading: SizedBox(
          height: Get.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
