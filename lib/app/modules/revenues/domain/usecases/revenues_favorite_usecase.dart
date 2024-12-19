import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/entities/revenues_entity.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/exceptions/revenues_exceptions.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/repositories/revenues_favorite_repository.dart';

abstract class IRevenuesFavoriteUsecase {
  Future<Either<RevenuesExceptions, void>> call(RevenuesIsFavoriteDTO dto);
}

class RevenuesFavoriteUsecase implements IRevenuesFavoriteUsecase {
  final IRevenuesFavoriteRepository _repository;

  RevenuesFavoriteUsecase(this._repository);

  @override
  Future<Either<RevenuesExceptions, void>> call(
      RevenuesIsFavoriteDTO dto) async {
    return await _repository(dto);
  }
}
