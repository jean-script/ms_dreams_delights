import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_dreams_delights/app/components/my_scaffold.dart';
import 'package:ms_dreams_delights/app/components/title.dart';
import 'package:ms_dreams_delights/app/modules/revenues/presenter/controllers/revenues_controlle.dart';
import 'package:ms_dreams_delights/app/modules/revenues/presenter/widgets/body_revenues.dart';
import 'package:ms_dreams_delights/app/routes/routes.dart';
import 'package:ms_dreams_delights/app/utils/hexcolor.dart';

class ReceitasPage extends StatelessWidget {
  const ReceitasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      onTap: () {
        RevenuesController.to.changeSucess();
        Get.toNamed(MyRoutes.REVENUES_CREATE_PAGE);
      },
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                flex: 2,
                child: TitleWidget(title: 'Receitas'),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    border: Border.all(
                      color: HexColor('#D0CDCD'),
                      width: 1,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(000, 000, 000, 25),
                        offset: Offset(-4, -1),
                        blurRadius: 4,
                        spreadRadius: 0,
                      )
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: const SizedBox(
                    width: double.infinity,
                    child: BodyRevenues(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}