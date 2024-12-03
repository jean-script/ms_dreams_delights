import 'package:flutter/material.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/entities/ingredient_dto.dart';
import 'package:ms_dreams_delights/app/modules/stock/presenter/controller/stock_controller.dart';
import 'package:ms_dreams_delights/app/utils/hexcolor.dart';

class MyTextFormField extends StatelessWidget {
  final String? hintText;
  final String? prefixText;
  final String? suffixText;
  final Widget? suffix;
  final Widget? prefix;
  final TextInputType? keyboardType;
  final bool readOnly;
  final void Function(String value)? onChanged;
  final TextEditingController textController;
  final bool? isDense;
  final double? width;
  final double? height;
  final int? maxLines;
  final TextAlign textAlign;
  final bool isValide;
  const MyTextFormField({
    super.key,
    required this.textController,
    this.hintText,
    this.prefixText,
    this.suffixText,
    this.suffix,
    this.prefix,
    this.keyboardType,
    this.readOnly = false,
    this.isDense,
    this.onChanged,
    this.height,
    this.width,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.isValide = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.only(top: 5),
      child: TextFormField(
        validator: isValide
            ? (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor preencha o campo';
                }
                return null;
              }
            : null,
        onChanged: onChanged,
        controller: textController,
        keyboardType: keyboardType,
        readOnly: readOnly,
        maxLines: maxLines,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.labelSmall,
        decoration: InputDecoration(
          prefixText: prefixText,
          suffixText: suffixText,
          suffix: suffix,
          prefix: prefix,
          isDense: isDense,
          suffixStyle: Theme.of(context).textTheme.labelLarge,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Colors.black26,
              ),
          focusColor: HexColor('#D0CDCD'),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: HexColor('#D0CDCD'),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}

class MyTextFormFieldWithDropdown extends MyTextFormField {
  const MyTextFormFieldWithDropdown({
    super.key,
    required super.textController,
    super.hintText,
    super.prefixText,
    super.suffixText,
    super.suffix,
    super.keyboardType,
    super.readOnly = false,
    super.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MyTextFormField(
          textController: textController,
          hintText: hintText,
          keyboardType: keyboardType,
          onChanged: onChanged,
          prefixText: prefixText,
          readOnly: readOnly,
          suffix: suffix,
          suffixText: suffixText,
        ),
        Positioned(
          right: 5,
          top: 7,
          child: DropdownMenu<Measurement>(
            width: 80,
            initialSelection: StockController.to.seletedMeasurement.value,
            onSelected: (value) => StockController.to.seletedMeasurement.value =
                value ?? Measurement.grama,
            textStyle: Theme.of(context).textTheme.labelLarge,
            inputDecorationTheme: const InputDecorationTheme(
              border: InputBorder.none,

              // contentPadding: EdgeInsets.only(left: 10),
            ),
            menuStyle: const MenuStyle(
              shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)))),
            ),
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: Measurement.grama, label: 'g'),
              DropdownMenuEntry(value: Measurement.unit, label: 'un'),
              DropdownMenuEntry(value: Measurement.mililitro, label: 'ml'),
            ],
          ),
        ),
      ],
    );
  }
}
