import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ms_dreams_delights/app/extensions/double_extension.dart';
import 'package:ms_dreams_delights/app/modules/revenues/presenter/controllers/revenues_controlle.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/entities/ingredient_dto.dart';
import 'package:ms_dreams_delights/app/theme/theme.dart';
import 'package:ms_dreams_delights/app/widgets/image.dart';

class ItemSelectedIngredients extends GetView<RevenuesController> {
  const ItemSelectedIngredients({
    super.key,
    required this.item,
    this.readOnly = false,
  });

  final IngredientDTO item;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    var itemContainer = Container(
      width: 380,
      height: 70,
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(3))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageWidget(
                '',
                imagePath: item.pathImage,
                width: 70,
                height: 48,
              ),
              Text(
                item.title,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.amountUseRevenues != null
                    ? ((double.tryParse(item.amountUseRevenues.toString()) ??
                                0) *
                            item.totalValueCost.value)
                        .currency
                    : item.totalValueCost.value.currency,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: MyTheme.positive,
                    ),
              ),
              if (item.amountUseRevenues != null)
                Text(
                  '${item.amountUseRevenues?.toStringAsFixed(0)} ${item.measurement?.name}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: MyTheme.positive,
                      ),
                ),
            ],
          ),
        ],
      ),
    );
    return readOnly
        ? itemContainer
        : Slidable(
            key: ValueKey(item.id),
            startActionPane: ActionPane(
              // A motion is a widget used to control how the pane animates.
              motion: const ScrollMotion(),

              // A pane can dismiss the Slidable.
              dismissible: DismissiblePane(onDismissed: () {
                controller.removeItemInListingredien(item);
              }),
              // All actions are defined in the children parameter.
              children: [
                // A SlidableAction can have an icon and/or a label.
                SlidableAction(
                  onPressed: (context) {
                    controller.removeItemInListingredien(item);
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: itemContainer,
          );
  }
}
