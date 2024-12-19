import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/entities/revenues_entity.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/exceptions/revenues_exceptions.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/repositories/revenues_edit_repository.dart';

abstract class IRevenuesEditUsecase {
  Future<Either<RevenuesExceptions, RevenuesDTO>> call(RevenuesEditDTO dto);
}

class RevenuesEditUsecase implements IRevenuesEditUsecase {
  final IRevenuesEditRepository _repository;

  RevenuesEditUsecase(this._repository);

  @override
  Future<Either<RevenuesExceptions, RevenuesDTO>> call(
      RevenuesEditDTO dto) async {
    return await _repository(dto);
  }
}
