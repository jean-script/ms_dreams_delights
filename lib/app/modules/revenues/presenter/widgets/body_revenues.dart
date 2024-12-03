import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ms_dreams_delights/app/components/my_text_form_field.dart';
import 'package:ms_dreams_delights/app/modules/revenues/presenter/controllers/revenues_controlle.dart';
import 'package:ms_dreams_delights/app/modules/revenues/presenter/widgets/item_revenues.dart';

class BodyRevenues extends GetView<RevenuesController> {
  const BodyRevenues({super.key});

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
              hintText: "Procurar receita",
              textController: controller.textSearch,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Receitas",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          controller.obx(
            (state) => SizedBox(
              height: Get.height * 0.49,
              child: Obx(
                () => RefreshIndicator(
                  onRefresh: () async {
                    controller.getRevenues();
                  },
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        var item = controller.listFilter()[index];
                        return ItemRevenues(item: item);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: controller.listFilter().length),
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
                      'Adicione Receitas!',
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
