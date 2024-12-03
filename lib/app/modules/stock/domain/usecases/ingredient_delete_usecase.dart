import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/exceptions/ingredient_exception.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/repositories/ingrediente_delete_repository.dart';

abstract class IIngredientDeleteUsecase {
  Future<Either<IngredientException, void>> call(String id);
}

class IngredientDeleteUsecase extends IIngredientDeleteUsecase {
  final IIngredientDeleteRepository _repository;

  IngredientDeleteUsecase(this._repository);
  @override
  Future<Either<IngredientException, void>> call(String id) async {
    return _repository(id);
  }
}
