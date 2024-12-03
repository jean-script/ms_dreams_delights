import 'package:fpdart/fpdart.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/exceptions/revenues_exceptions.dart';

abstract class IRevenuesDeleteRepository {
  Future<Either<RevenuesExceptions, void>> call(String id);
}
