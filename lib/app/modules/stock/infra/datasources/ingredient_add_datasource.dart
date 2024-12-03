import 'package:ms_dreams_delights/app/modules/stock/domain/entities/ingredient_dto.dart';

abstract class IIngredientAddDatasource {
  Future<IngredientDTO> call(IngredientDTO dto);
}
