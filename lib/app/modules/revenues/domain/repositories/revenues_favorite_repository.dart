import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/entities/revenues_entity.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/exceptions/revenues_exceptions.dart';

abstract class IRevenuesFavoriteRepository {
  Future<Either<RevenuesExceptions, void>> call(RevenuesIsFavoriteDTO dto);
}
