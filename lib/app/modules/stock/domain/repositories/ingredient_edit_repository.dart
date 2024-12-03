import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/entities/ingredient_dto.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/exceptions/ingredient_exception.dart';

abstract class IIngredientEditRepository {
  Future<Either<IngredientException, IngredientDTO>> call(IngredientDTO dto);
}
