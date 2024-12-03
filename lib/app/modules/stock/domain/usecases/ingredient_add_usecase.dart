import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/entities/ingredient_dto.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/exceptions/ingredient_exception.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/repositories/ingrediente_add_repository.dart';

abstract class IIngredientAddUsecase {
  Future<Either<IngredientException, IngredientDTO>> call(IngredientDTO dto);
}

class IngredientAddUsecase implements IIngredientAddUsecase {
  final IIngredientAddRepository _repository;

  IngredientAddUsecase(this._repository);

  @override
  Future<Either<IngredientException, IngredientDTO>> call(IngredientDTO dto) async {
    return _repository(dto);
  }
}
