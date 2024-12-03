import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_dreams_delights/app/components/button_selected_img.dart';
import 'package:ms_dreams_delights/app/components/my_text_form_field.dart';
import 'package:ms_dreams_delights/app/modules/stock/presenter/controller/stock_controller.dart';

class FormAdicionais extends GetView<StockController> {
  const FormAdicionais({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 13.0),
      child: Form(
        key: controller.formKeyAdicional,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ButtonSelectedImg(
              onClose: () => controller.cleanImage(),
              imageSelected: controller.imageAdiSelected,
              imageSelectedName:  controller.imageAdiSelectedName.value,
              onImageSelected: (image) async {
                controller.imageAdiSelected = image;
                controller.imageAdiSelectedName.value = image.name;
              },
            ),
            Text(
              'Titúlo do Adicional',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            MyTextFormField(
              textController: controller.textTitleAdicionalController,
              hintText: 'Etiqueta',
            ),
            const SizedBox(height: 5),
            Text(
              'Quantidade',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            MyTextFormField(
              onChanged: controller.onCalculCustAdd,
              textController: controller.textAmountAdicionalController,
              hintText: '10',
              suffixText: "Un",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 5),
            Text(
              'Valor',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            MyTextFormField(
              onChanged: controller.onCalculCustAdd,
              textController: controller.textValueAdicionalController,
              hintText: '10.0',
              prefixText: "R\$",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 5),
            Text(
              'Custo Unidade',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            MyTextFormField(
              readOnly: true,
              textController: controller.textAdiCostUnitController,
              hintText: '2,99',
              prefixText: "R\$",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
