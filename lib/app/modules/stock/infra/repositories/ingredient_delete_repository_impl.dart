import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/exceptions/ingredient_exception.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/repositories/ingrediente_delete_repository.dart';
import 'package:ms_dreams_delights/app/modules/stock/infra/datasources/ingredient_delete_datasource.dart';

class IngredientDeleteRepositoryImpl extends IIngredientDeleteRepository {
  final IIngredientDeleteDatasource _datasource;

  IngredientDeleteRepositoryImpl(this._datasource);
  @override
  Future<Either<IngredientException, void>> call(String id) async {
    try {
      return Right(await _datasource(id));
    } on IngredientErrorDeleteException catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(IngredientException('Error inesperado -- $e'));
    }
  }
}
