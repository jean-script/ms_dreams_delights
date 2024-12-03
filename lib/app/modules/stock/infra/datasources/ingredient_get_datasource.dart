import 'package:ms_dreams_delights/app/modules/stock/domain/entities/ingredient_dto.dart';

abstract class IIngredientGetDatasource {
  Future<List<IngredientDTO>> call();
}
