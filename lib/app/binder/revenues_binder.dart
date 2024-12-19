import 'package:get/get.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/repositories/revenues_created_repository.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/repositories/revenues_delete_repository.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/repositories/revenues_edit_repository.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/repositories/revenues_favorite_repository.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/repositories/revenues_get_repository.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/usecases/revenues_created_usecase.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/usecases/revenues_delete_usecase.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/usecases/revenues_edit_usecase.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/usecases/revenues_favorite_usecase.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/usecases/revenues_get_usecase.dart';
import 'package:ms_dreams_delights/app/modules/revenues/external/revenues_created_datasource_impl.dart';
import 'package:ms_dreams_delights/app/modules/revenues/external/revenues_delete_datasource_impl.dart';
import 'package:ms_dreams_delights/app/modules/revenues/external/revenues_edit_datasource_impl.dart';
import 'package:ms_dreams_delights/app/modules/revenues/external/revenues_favorite_datasource_impl.dart';
import 'package:ms_dreams_delights/app/modules/revenues/external/revenues_get_datasource_impl.dart';
import 'package:ms_dreams_delights/app/modules/revenues/infra/datasources/revenues_created_datasource.dart';
import 'package:ms_dreams_delights/app/modules/revenues/infra/datasources/revenues_delete_datasource.dart';
import 'package:ms_dreams_delights/app/modules/revenues/infra/datasources/revenues_edit_datasource.dart';
import 'package:ms_dreams_delights/app/modules/revenues/infra/datasources/revenues_favorite_datasource.dart';
import 'package:ms_dreams_delights/app/modules/revenues/infra/datasources/revenues_get_datasource.dart';
import 'package:ms_dreams_delights/app/modules/revenues/infra/repositories/revenues_created_repository_impl.dart';
import 'package:ms_dreams_delights/app/modules/revenues/infra/repositories/revenues_delete_repository_impl.dart';
import 'package:ms_dreams_delights/app/modules/revenues/infra/repositories/revenues_edit_repository_impl.dart';
import 'package:ms_dreams_delights/app/modules/revenues/infra/repositories/revenues_favorite_repository_impl.dart';
import 'package:ms_dreams_delights/app/modules/revenues/infra/repositories/revenues_get_repository_impl.dart';
import 'package:ms_dreams_delights/app/modules/revenues/presenter/controllers/revenues_controlle.dart';

class RevenuesBinder extends Bindings {
  @override
  void dependencies() {
    // listar todos
    Get.put<IRevenuesGetDatasource>(RevenuesGetDatasourceImpl());
    Get.put<IRevenuesGetRepository>(RevenuesGetRepositoryImpl(Get.find()));
    Get.put<IRevenuesGetUsecase>(RevenuesGetUsecase(Get.find()));
    // created
    Get.put<IRevenuesCreatedDatasource>(RevenuesCreatedDatasourceImpl(),
        permanent: true);
    Get.put<IRevenuesCreatedRepository>(
        RevenuesCreatedRepositoryImpl(Get.find()),
        permanent: true);
    Get.put<IRevenuesCreatedUsecase>(RevenuesCreatedUsecase(Get.find()),
        permanent: true);

    // delete
    Get.put<IRevenuesDeleteDatasource>(RevenuesDeleteDatasourceImpl(),
        permanent: true);
    Get.put<IRevenuesDeleteRepository>(RevenuesDeleteRepositoryImpl(Get.find()),
        permanent: true);
    Get.put<IRevenuesDeleteUsecase>(RevenuesDeleteUsecase(Get.find()),
        permanent: true);

    // edit
    Get.put<IRevenuesEditDatasource>(RevenuesEditDatasourceImpl(),
        permanent: true);
    Get.put<IRevenuesEditRepository>(RevenuesEditRepositoryImpl(Get.find()),
        permanent: true);
    Get.put<IRevenuesEditUsecase>(RevenuesEditUsecase(Get.find()),
        permanent: true);

    // Favorite
    Get.put<IRevenuesFavoriteDatasource>(RevenuesFavoriteDatasourceImpl(),
        permanent: true);
    Get.put<IRevenuesFavoriteRepository>(
        RevenuesFavoriteRepositoryImpl(Get.find()),
        permanent: true);
    Get.put<IRevenuesFavoriteUsecase>(RevenuesFavoriteUsecase(Get.find()),
        permanent: true);

    Get.put(RevenuesController(Get.find(), Get.find(), Get.find(), Get.find(), Get.find()),
        permanent: true);
  }
}
