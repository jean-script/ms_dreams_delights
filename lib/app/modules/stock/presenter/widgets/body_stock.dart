import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ms_dreams_delights/app/components/my_text_form_field.dart';
import 'package:ms_dreams_delights/app/modules/stock/presenter/controller/stock_controller.dart';
import 'package:ms_dreams_delights/app/modules/stock/presenter/widgets/item_stock.dart';

class BodyStock extends GetView<StockController> {
  const BodyStock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      padding: const EdgeInsets.only(top: 21, left: 11, right: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: MyTextFormField(
              onChanged: controller.filterList,
              isDense: true,
              hintText: "Procurar item",
              textController: controller.textSearchItems,
            ),
            // TextFormField(
            //     decoration: InputDecoration(
            //         isDense: true,
            //         disabledBorder: OutlineInputBorder(
            //             borderSide: BorderSide(
            //               color: HexColor('#D0CDCD'),
            //             ),
            //             borderRadius:
            //                 const BorderRadius.all(Radius.circular(8.0))),
            //         border: OutlineInputBorder(
            //             borderSide: BorderSide(
            //               color: HexColor('#D0CDCD'),
            //             ),
            //             borderRadius:
            //                 const BorderRadius.all(Radius.circular(8.0))))),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Ingredientes / Adicionais",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          controller.obx(
            (state) => SizedBox(
              height: Get.height * 0.49,
              child: Obx(
                () => RefreshIndicator(
                    onRefresh: () => controller.getAllItems(),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...controller
                              .listIngredientesFilter()
                              .map((item) => Column(
                                    children: [
                                      ItemStock(item: item),
                                      const SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  )),
                          const SizedBox(
                            height: 60,
                          )
                        ],
                      ),
                    )
                    // ListView.separated(
                    //   separatorBuilder: (context, index) =>
                    //       const SizedBox(height: 10),
                    //   itemCount: StockController.to.listIngredients.length,
                    //   itemBuilder: (context, index) {
                    //     IngredientDTO item =
                    //         StockController.to.listIngredients[index];
                    //     return ItemStock(item: item);
                    //   },
                    // ),
                    ),
              ),
            ),
            onEmpty: SizedBox(
              height: 350,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/lottie/empyt-ingredients.json',
                    repeat: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Adicione ingredientes!',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  )
                ],
              ),
            ),
            onLoading: const SizedBox(
              height: 300,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
