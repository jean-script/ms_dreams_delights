import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/entities/revenues_entity.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/exceptions/revenues_exceptions.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/repositories/revenues_get_repository.dart';

abstract class IRevenuesGetUsecase {
  Future<Either<RevenuesExceptions, List<RevenuesDTO>>> call();
}

class RevenuesGetUsecase implements IRevenuesGetUsecase {
  final IRevenuesGetRepository _repository;

  RevenuesGetUsecase(this._repository);

  @override
  Future<Either<RevenuesExceptions, List<RevenuesDTO>>> call() async {
    return await _repository();
  }
}
