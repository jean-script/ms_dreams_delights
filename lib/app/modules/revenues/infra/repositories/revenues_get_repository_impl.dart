import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/entities/revenues_entity.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/exceptions/revenues_exceptions.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/repositories/revenues_get_repository.dart';
import 'package:ms_dreams_delights/app/modules/revenues/infra/datasources/revenues_get_datasource.dart';

class RevenuesGetRepositoryImpl extends IRevenuesGetRepository {
  final IRevenuesGetDatasource _datasource;

  RevenuesGetRepositoryImpl(this._datasource);

  @override
  Future<Either<RevenuesExceptions, List<RevenuesDTO>>> call() async {
    try {
      return Right(await _datasource());
    } on RevenuesExceptions catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(RevenuesExceptions('Erro ineperado!\n${e.toString()}'));
    }
  }
}
