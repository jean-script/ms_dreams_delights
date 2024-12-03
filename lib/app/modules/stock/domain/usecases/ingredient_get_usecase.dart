import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/entities/ingredient_dto.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/exceptions/ingredient_exception.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/repositories/ingrediente_get_repository.dart';

abstract class IIngredientGetUsecase {
  Future<Either<IngredientException, List<IngredientDTO>>> call();
}

class IngredientGetUsecase extends IIngredientGetUsecase {
  final IIngredientGetRepository _repository;

  IngredientGetUsecase(this._repository);

  @override
  Future<Either<IngredientException, List<IngredientDTO>>> call() async {
    return _repository();
  }
}
