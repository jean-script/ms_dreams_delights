import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/entities/ingredient_dto.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/exceptions/ingredient_exception.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/repositories/ingredient_edit_repository.dart';
import 'package:ms_dreams_delights/app/modules/stock/infra/datasources/ingredient_edit_datasource.dart';

class IngredientEditRepositoryImpl extends IIngredientEditRepository {
  final IIngredienteEditDatasource _datasource;

  IngredientEditRepositoryImpl(this._datasource);
  @override
  Future<Either<IngredientException, IngredientDTO>> call(
      IngredientDTO dto) async {
    try {
      return Right(await _datasource(dto));
    } on IngredientErrorDeleteException catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(IngredientException('Erro inerperado $e'));
    }
  }
}
