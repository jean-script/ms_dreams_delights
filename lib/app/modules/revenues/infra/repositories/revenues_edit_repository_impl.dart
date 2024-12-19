import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/entities/revenues_entity.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/exceptions/revenues_exceptions.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/repositories/revenues_edit_repository.dart';
import 'package:ms_dreams_delights/app/modules/revenues/infra/datasources/revenues_edit_datasource.dart';

class RevenuesEditRepositoryImpl extends IRevenuesEditRepository {
  final IRevenuesEditDatasource _datasource;

  RevenuesEditRepositoryImpl(this._datasource);

  @override
  Future<Either<RevenuesExceptions, RevenuesDTO>> call(
      RevenuesEditDTO dto) async {
    try {
      return Right(await _datasource(dto));
    } on RevenuesExceptions catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(RevenuesExceptions('error inesperado\n ${e.toString()}'));
    }
  }
}
