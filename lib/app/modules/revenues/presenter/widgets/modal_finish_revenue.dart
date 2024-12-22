import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ms_dreams_delights/app/modules/revenues/presenter/controllers/revenues_selected_controller.dart';
import 'package:ms_dreams_delights/app/routes/routes.dart';
import 'package:ms_dreams_delights/app/theme/theme.dart';

class ModalFinishRevenue extends StatelessWidget {
  const ModalFinishRevenue({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: SimpleDialog(
        backgroundColor: Colors.white,

        // insetPadding: EdgeInsets.all(0),
        contentPadding: const EdgeInsets.all(10),
        children: [
          Column(
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxHeight: 400,
                  maxWidth: 400,
                ),
                // color: Colors.white,
                child: Lottie.asset(
                  'assets/lottie/finish-success.json',
                  height: 200,
                  width: 200,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Parabéns!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 300,
                ),
                child: Text(
                  'Você finalizou a receita ${RevenuesSelectedController.to.revenuesDetail.title}!',
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      side: WidgetStatePropertyAll(
                        BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      backgroundColor: const WidgetStatePropertyAll(
                        Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Fechar',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    onPressed: () {
                      Get.offAllNamed(MyRoutes.HOME_PAGE);
                    },
                    child: Text(
                      'Finalizar',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
