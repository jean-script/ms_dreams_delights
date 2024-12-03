import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_dreams_delights/app/components/button_selected_img.dart';
import 'package:ms_dreams_delights/app/components/my_text_form_field.dart';
import 'package:ms_dreams_delights/app/modules/stock/presenter/controller/stock_controller.dart';

class FormIngredientes extends GetView<StockController> {
  const FormIngredientes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 13.0),
      child: Form(
        key: controller.formKeyIngrediente,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ButtonSelectedImg(
              onClose: () {},
              imageSelected: controller.imageSelected,
              imageSelectedName: controller.imageSelectedName.value,
              onImageSelected: (image) async {
                controller.imageSelected = image;
                controller.imageSelectedName.value = image.name;
              },
            ),
            Text(
              'Titúlo do ingrediente',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            MyTextFormField(
              textController: controller.textTitleController,
              hintText: 'Leite moça',
            ),
            const SizedBox(height: 5),
            Text(
              'Quantidade',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            MyTextFormField(
              textController: controller.textAmountController,
              hintText: '10',
              suffixText: "Un",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 5),
            Text(
              'Custo Unidade',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            MyTextFormField(
              textController: controller.textValueController,
              hintText: '2,99',
              prefixText: "R\$",
              keyboardType: TextInputType.number,
              onChanged: controller.onCalculCust,
            ),
            const SizedBox(height: 5),
            Text(
              'Unidade de medida',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            MyTextFormFieldWithDropdown(
              hintText: '350.0',
              keyboardType: TextInputType.number,
              onChanged: controller.onCalculCust,
              textController: controller.textUnitController,
            ),
            const SizedBox(height: 5),
            Obx(() => Text(
                  'Custo por ${controller.seletedMeasurement.value.name}',
                  style: Theme.of(context).textTheme.titleSmall,
                )),
            MyTextFormField(
              hintText: "0,97",
              prefixText: "R\$",
              textController: controller.textCostUnitController,
              keyboardType: TextInputType.number,
              readOnly: true,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
