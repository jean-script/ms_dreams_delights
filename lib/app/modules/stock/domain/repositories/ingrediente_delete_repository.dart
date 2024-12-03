import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/exceptions/ingredient_exception.dart';

abstract class IIngredientDeleteRepository {
  Future<Either<IngredientException, void>> call(String id);
}
