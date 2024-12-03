import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/entities/ingredient_dto.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/exceptions/ingredient_exception.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/repositories/ingrediente_add_repository.dart';
import 'package:ms_dreams_delights/app/modules/stock/infra/datasources/ingredient_add_datasource.dart';

class IngredientAddRepositoryImpl implements IIngredientAddRepository {
  final IIngredientAddDatasource _datasource;

  IngredientAddRepositoryImpl(this._datasource);

  @override
  Future<Either<IngredientException, IngredientDTO>> call(
      IngredientDTO dto) async {
    try {
      return Right(await _datasource(dto));
    } on IngredientException catch (e) {
      return Left(e);
    } on Exception {
      return Left(IngredientException('Erro inesperado'));
    }
  }
}
