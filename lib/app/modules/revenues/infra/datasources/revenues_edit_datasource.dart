import 'package:ms_dreams_delights/app/modules/revenues/domain/entities/revenues_entity.dart';

abstract class IRevenuesEditDatasource {
  Future<RevenuesDTO> call(RevenuesEditDTO dto);
}
