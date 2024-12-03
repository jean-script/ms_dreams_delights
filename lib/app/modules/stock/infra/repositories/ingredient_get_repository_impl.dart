import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/entities/ingredient_dto.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/exceptions/ingredient_exception.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/repositories/ingrediente_get_repository.dart';
import 'package:ms_dreams_delights/app/modules/stock/infra/datasources/ingredient_get_datasource.dart';

class IngredientGetRepositoryImpl implements IIngredientGetRepository {
  final IIngredientGetDatasource _datasource;

  IngredientGetRepositoryImpl(this._datasource);

  @override
  Future<Either<IngredientException, List<IngredientDTO>>> call() async {
    try {
      return Right(await _datasource());
    } on IngredientException catch (e) {
      return Left(e);
    } on Exception {
      return Left(IngredientException('Erro inesperado'));
    }
  }
}
