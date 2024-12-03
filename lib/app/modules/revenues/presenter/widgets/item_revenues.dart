import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ms_dreams_delights/app/extensions/double_extension.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/entities/revenues_entity.dart';
import 'package:ms_dreams_delights/app/modules/revenues/presenter/controllers/revenues_controlle.dart';
import 'package:ms_dreams_delights/app/routes/routes.dart';
import 'package:ms_dreams_delights/app/utils/hexcolor.dart';
import 'package:ms_dreams_delights/app/widgets/image.dart';

class ItemRevenues extends GetView<RevenuesController> {
  const ItemRevenues({super.key, required this.item});

  final RevenuesDTO item;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(item.id),
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {
          controller.onDeleteRevenues(item);
        }),
        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {
              controller.onDeleteRevenues(item);
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) {
              Get.toNamed(MyRoutes.REVENUES_CREATE_PAGE);
              controller.editRevenues(item);
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
      child: GestureDetector(
        onTap: () {
          controller.revenuesDetail = item;
          print('CLIQUEI -- ${item.ingredients.length}');
          Get.toNamed(MyRoutes.REVENUES_DETAIL_PAGE);
        },
        child: Container(
          // padding: const EdgeInsets.all(8.0),
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
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 80,
                  ),
                  child: ImageWidget(
                    imagePath: item.image,
                    'String',
                    width: 124,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
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
                        '${item.amount} porções',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 10,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                height: Get.height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // if (item.type == Type.ingredient)
                    Text(
                      'Custo ${item.totalValue.currency} ',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 10,
                          ),
                    ),
                    Obx(
                      () => Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(60)),
                        color: Colors.transparent,
                        child: Ink(
                          child: InkWell(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(60)),
                            onTap: () {
                              controller.favorite(item);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 2.0, vertical: 2.0),
                              child: Icon(
                                item.favorite.value
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 25,
                                color: HexColor(item.favorite.value
                                    ? '#F582A1'
                                    : '#D0CDCD'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
