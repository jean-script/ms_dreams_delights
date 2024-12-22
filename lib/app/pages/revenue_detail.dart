import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ms_dreams_delights/app/components/my_scaffold.dart';
import 'package:ms_dreams_delights/app/extensions/double_extension.dart';
import 'package:ms_dreams_delights/app/modules/revenues/presenter/controllers/revenues_selected_controller.dart';
import 'package:ms_dreams_delights/app/modules/revenues/presenter/widgets/item_selected_ingredients.dart';
import 'package:ms_dreams_delights/app/theme/theme.dart';
import 'package:ms_dreams_delights/app/widgets/image.dart';

class RevenueDetail extends GetView<RevenuesSelectedController> {
  const RevenueDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var revenue = controller.revenuesDetail;
    return MyScaffold(
      showFloatingAction: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageWidget(
              '',
              imagePath: revenue.image,
              width: MediaQuery.of(context).size.width,
              height: 203,
              fit: BoxFit.fitWidth,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  FittedBox(
                    child: Text(
                      revenue.title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 36,
                          ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    revenue.description,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 12,
                        ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${revenue.amount} ${revenue.amount.toString().length > 1 ? 'porções' : 'porção'}',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      Text(
                        'Custo ${revenue.totalValue.currency}',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Ingredientes',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 24,
                        ),
                  ),
                  if (revenue.ingredients.isEmpty)
                    const Text("ESTOU VAZIO \\\\(°0°)//"),
                  Obx(
                    () => SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: controller.listIngrediente().isEmpty
                          ? 100
                          : controller.listIngrediente().length * 80,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: controller.listIngrediente().length,
                        itemBuilder: (_, index) {
                          var item = controller.listIngrediente()[index];
                          return ItemSelectedIngredients(
                            item: item,
                            detail: true,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (controller.listDoneIngredients.isNotEmpty)
                          Text(
                            'Adicionados',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: 24,
                                  color: MyTheme.positive,
                                ),
                          ),
                        if (controller.listDoneIngredients.isNotEmpty)
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: controller.listDoneIngredients.isEmpty
                                ? 100
                                : controller.listDoneIngredients.length * 70,
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 10),
                              itemCount: controller.listDoneIngredients.length,
                              itemBuilder: (_, index) {
                                var item =
                                    controller.listDoneIngredients[index];
                                return ItemSelectedIngredients(
                                  item: item,
                                  detail: true,
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
