import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/entities/revenues_entity.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/exceptions/revenues_exceptions.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/repositories/revenues_created_repository.dart';

abstract class IRevenuesCreatedUsecase {
  Future<Either<RevenuesExceptions, RevenuesDTO>> call(RevenuesCreatedDTO dto);
}

class RevenuesCreatedUsecase implements IRevenuesCreatedUsecase {
  final IRevenuesCreatedRepository _repository;

  RevenuesCreatedUsecase(this._repository);

  @override
  Future<Either<RevenuesExceptions, RevenuesDTO>> call(
      RevenuesCreatedDTO dto) async {
    return await _repository(dto);
  }
}
