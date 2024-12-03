import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/entities/ingredient_dto.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/exceptions/ingredient_exception.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/repositories/ingredient_edit_repository.dart';

abstract class IIngredientEditUsecase {
  Future<Either<IngredientException, IngredientDTO>> call(IngredientDTO dto);
}

class IngredientEditUsecase extends IIngredientEditUsecase {
  final IIngredientEditRepository _repository;

  IngredientEditUsecase(this._repository);
  @override
  Future<Either<IngredientException, IngredientDTO>> call(
      IngredientDTO dto) async {
    return _repository(dto);
  }
}
