import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_dreams_delights/app/extensions/double_extension.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/entities/ingredient_dto.dart';
import 'package:ms_dreams_delights/app/modules/stock/presenter/controller/stock_controller.dart';
import 'package:ms_dreams_delights/app/utils/hexcolor.dart';
import 'package:ms_dreams_delights/app/widgets/image.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemStock extends StatelessWidget {
  final IngredientDTO item;
  const ItemStock({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(item.id),
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {
          StockController.to.onDeleteItem(item);
        }),
        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {
              StockController.to.onDeleteItem(item);
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) {
              StockController.to.onEditItem(item);
            },
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Editar',
          ),
        ],
      ),
      // endActionPane: ActionPane(
      //   motion: const ScrollMotion(),
      //   children: [
      //     SlidableAction(
      //       // An action can be bigger than the others.
      //       // flex: 2,
      //       onPressed: (context) {},
      //       backgroundColor: const Color(0xFF7BC043),
      //       foregroundColor: Colors.white,
      //       icon: Icons.archive,
      //       label: 'Archive',
      //     ),
      //     SlidableAction(
      //       onPressed: (context) {},
      //       backgroundColor: const Color(0xFF0392CF),
      //       foregroundColor: Colors.white,
      //       icon: Icons.save,
      //       label: 'Save',
      //     ),
      //   ],
      // ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        constraints: const BoxConstraints(
          minWidth: 250,
          maxWidth: 380,
        ),
        height: 84,
        decoration: BoxDecoration(
          color: HexColor("#FFFFFF"),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: HexColor("#D0CDCD")),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 3,
              spreadRadius: 0,
              color: Colors.black12,
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxWidth: 124,
              ),
              child: ImageWidget(
                imagePath: item.pathImage,
                'String',
                width: 124,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 12,
                          color: HexColor("000"),
                        ),
                  ),
                  Text(
                    '${item.amount} unidades',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // if (item.type == Type.ingredient)
                Text(
                  'Custo por ${item.measurement?.name.toLowerCase()} ${item.costUnit.toPrecision(2).currency}',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 10,
                      ),
                ),
                Text(
                  'Valor total ${(item.type == Type.additional ? item.value : (item.value * item.amount)).currency}',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 12,
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
