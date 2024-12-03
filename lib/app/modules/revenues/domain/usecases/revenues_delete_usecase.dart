import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/exceptions/revenues_exceptions.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/repositories/revenues_delete_repository.dart';

abstract class IRevenuesDeleteUsecase {
  Future<Either<RevenuesExceptions, void>> call(String id);
}

class RevenuesDeleteUsecase implements IRevenuesDeleteUsecase {
  final IRevenuesDeleteRepository _repository;

  RevenuesDeleteUsecase(this._repository);

  @override
  Future<Either<RevenuesExceptions, void>> call(String id) async {
    return await _repository(id);
  }
}
