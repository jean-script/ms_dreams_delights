import 'package:get/get.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/repositories/ingredient_edit_repository.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/repositories/ingrediente_add_repository.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/repositories/ingrediente_delete_repository.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/repositories/ingrediente_get_repository.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/usecases/ingredient_add_usecase.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/usecases/ingredient_delete_usecase.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/usecases/ingredient_edit_usecase.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/usecases/ingredient_get_usecase.dart';
import 'package:ms_dreams_delights/app/modules/stock/external/ingredient_add_datasource_impl.dart';
import 'package:ms_dreams_delights/app/modules/stock/external/ingredient_delete_datasource_impl.dart';
import 'package:ms_dreams_delights/app/modules/stock/external/ingredient_edit_datasource_impl.dart';
import 'package:ms_dreams_delights/app/modules/stock/external/ingredient_get_datasource_impl.dart';
import 'package:ms_dreams_delights/app/modules/stock/infra/datasources/ingredient_add_datasource.dart';
import 'package:ms_dreams_delights/app/modules/stock/infra/datasources/ingredient_delete_datasource.dart';
import 'package:ms_dreams_delights/app/modules/stock/infra/datasources/ingredient_edit_datasource.dart';
import 'package:ms_dreams_delights/app/modules/stock/infra/datasources/ingredient_get_datasource.dart';
import 'package:ms_dreams_delights/app/modules/stock/infra/repositories/ingredient_add_repository_impl.dart';
import 'package:ms_dreams_delights/app/modules/stock/infra/repositories/ingredient_delete_repository_impl.dart';
import 'package:ms_dreams_delights/app/modules/stock/infra/repositories/ingredient_edit_repository_impl.dart';
import 'package:ms_dreams_delights/app/modules/stock/infra/repositories/ingredient_get_repository_impl.dart';
import 'package:ms_dreams_delights/app/modules/stock/presenter/controller/stock_controller.dart';

class StockBinder implements Bindings {
  @override
  void dependencies() {
    // created ingredientes / adicionais
    Get.put<IIngredientAddDatasource>(IngredientAddDatasourceImpl(), permanent: true);
    Get.put<IIngredientAddRepository>(IngredientAddRepositoryImpl(Get.find()), permanent: true);
    Get.put<IIngredientAddUsecase>(IngredientAddUsecase(Get.find()), permanent: true);

    // obter ingredientes / adicionais
    Get.put<IIngredientGetDatasource>(IngredientGetDatasourceImpl(), permanent: true);
    Get.put<IIngredientGetRepository>(IngredientGetRepositoryImpl(Get.find()), permanent: true);
    Get.put<IIngredientGetUsecase>(IngredientGetUsecase(Get.find()), permanent: true);

    // delete ingredientes / adicionais
    Get.put<IIngredientDeleteDatasource>(IngredientDeleteDatasourceImpl(), permanent: true);
    Get.put<IIngredientDeleteRepository>(
        IngredientDeleteRepositoryImpl(Get.find()), permanent: true);
    Get.put<IIngredientDeleteUsecase>(IngredientDeleteUsecase(Get.find()), permanent: true);

    // edit ingredientes / adicionais
    Get.put<IIngredienteEditDatasource>(IngredientEditDatasourceImpl(), permanent: true);
    Get.put<IIngredientEditRepository>(
        IngredientEditRepositoryImpl(Get.find()), permanent: true);
    Get.put<IIngredientEditUsecase>(IngredientEditUsecase(Get.find()), permanent: true);

    Get.put(StockController(Get.find(), Get.find(), Get.find(), Get.find()),
        permanent: true);
  }
}
