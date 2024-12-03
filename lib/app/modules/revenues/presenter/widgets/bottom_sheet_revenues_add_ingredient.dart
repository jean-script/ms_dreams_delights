import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_dreams_delights/app/components/my_text_form_field.dart';
import 'package:ms_dreams_delights/app/modules/revenues/presenter/controllers/revenues_controlle.dart';
import 'package:ms_dreams_delights/app/theme/theme.dart';
import 'package:ms_dreams_delights/app/utils/hexcolor.dart';
import 'package:ms_dreams_delights/app/widgets/image.dart';

class BottomSheetRevenuesAddIngredient extends GetView<RevenuesController> {
  const BottomSheetRevenuesAddIngredient({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: Get.height,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: MyTextFormField(
                      width: 343,
                      prefix: const Icon(
                        Icons.search,
                        size: 25,
                      ),
                      textController: controller.textSearchIngredients,
                      hintText: 'Pesquise ingrediente',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Adicionados',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: 120,
                    child: Obx(
                      () => ListView.builder(
                        controller: controller.scrollAdicionadosController,
                        itemCount: controller.listIngreisAdd.length,
                        itemBuilder: (_, index) {
                          var item = controller.listIngreisAdd[index];

                          return GestureDetector(
                            onTap: () {
                              print('my item -- ${item.title}');
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              height: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () => controller
                                            .removeItemInListingredienAdd(item),
                                        icon: Icon(
                                          Icons.check_box,
                                          color: MyTheme.positive,
                                          size: 30,
                                        ),
                                      ),
                                      const SizedBox(width: 3),
                                      ImageWidget(
                                        '',
                                        imagePath: item.pathImage ?? '',
                                        width: 70,
                                        height: 48,
                                      ),
                                      const SizedBox(width: 2),
                                      Container(
                                        constraints:
                                            const BoxConstraints(maxWidth: 150),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item.title,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(),
                                            ),
                                            Obx(
                                              () => FittedBox(
                                                child: Text(
                                                  'Adicional  +${item.totalValueCost.value.toStringAsFixed(2)}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall
                                                      ?.copyWith(
                                                        color: MyTheme.positive,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  MyTextFormField(
                                    width: 112,
                                    isDense: true,
                                    onChanged: (value) {
                                      if (value.isEmpty) return;
                                      double cal = value.isEmpty
                                          ? 1.0
                                          : double.parse(value);
                                      item.totalValueCost.value =
                                          (item.costUnit * cal);
                                      controller.calculeTotalAdicional();
                                    },
                                    suffixText: item.measurement!.name[0],
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    textController: item.textController,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Ingredientes',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(
                      height: 210,
                      child: Obx(
                        () => ListView.builder(
                          itemCount: controller.listIngredientesFilter().length,
                          itemBuilder: (_, index) {
                            var item =
                                controller.listIngredientesFilter()[index];
                            return GestureDetector(
                              onTap: () {
                                print('my item -- ${item.title}');
                                controller.addItemInListingredienAdd(item);
                              },
                              child: SizedBox(
                                height: 70,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 28,
                                          width: 28,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(3)),
                                              border: Border.all(
                                                  color: HexColor('#D0CDCD'))),
                                        ),
                                        const SizedBox(width: 3),
                                        ImageWidget(
                                          '',
                                          imagePath: item.pathImage ?? '',
                                          width: 70,
                                          height: 48,
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          item.title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 29,
                                      width: 111,
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8)),
                                          border: Border.all(
                                              color: HexColor('#D0CDCD'))),
                                      child: Center(
                                        child: FittedBox(
                                          child: Text(
                                            'g / ml usado',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: GestureDetector(
            onTap: () {
              controller.addIngredienteInRevenues();
            },
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30))),
              child: Obx(
                () => Center(
                  child: Text(
                    'Adicionar +${controller.totalAdicionais.value.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
