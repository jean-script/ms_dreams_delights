import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/entities/revenues_entity.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/exceptions/revenues_exceptions.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/repositories/revenues_created_repository.dart';
import 'package:ms_dreams_delights/app/modules/revenues/infra/datasources/revenues_created_datasource.dart';

class RevenuesCreatedRepositoryImpl extends IRevenuesCreatedRepository {
  final IRevenuesCreatedDatasource _datasource;

  RevenuesCreatedRepositoryImpl(this._datasource);

  @override
  Future<Either<RevenuesExceptions, RevenuesDTO>> call(
      RevenuesCreatedDTO dto) async {
    try {
      return Right(await _datasource(dto));
    } on RevenuesExceptions catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(RevenuesExceptions('error inesperado\n ${e.toString()}'));
    }
  }
}
