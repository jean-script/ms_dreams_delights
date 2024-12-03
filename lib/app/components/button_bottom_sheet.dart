import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_dreams_delights/app/modules/stock/presenter/controller/stock_controller.dart';
import 'package:ms_dreams_delights/app/utils/hexcolor.dart';

class ButtonBottomSheet extends StatelessWidget {
  final void Function()? onTap;
  const ButtonBottomSheet({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: onTap,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            hoverColor: Colors.transparent,
            child: Center(
              child: Obx(()=>  Text(
                StockController.to.isEdit.value ? 'Editar' : 'Adicionar',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
              ),)
            ),
          ),
        ),
      ),
    );
  }
}
