import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/exceptions/revenues_exceptions.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/repositories/revenues_delete_repository.dart';
import 'package:ms_dreams_delights/app/modules/revenues/infra/datasources/revenues_delete_datasource.dart';

class RevenuesDeleteRepositoryImpl implements IRevenuesDeleteRepository {
  final IRevenuesDeleteDatasource _datasource;

  RevenuesDeleteRepositoryImpl(this._datasource);

  @override
  Future<Either<RevenuesExceptions, void>> call(String id) async {
    try {
      return Right(await _datasource(id));
    } on RevenuesExceptions catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(RevenuesExceptions('erro inesperado!\n${e.toString()}'));
    }
  }
}
