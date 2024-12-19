import 'package:ms_dreams_delights/app/modules/revenues/domain/entities/revenues_entity.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/exceptions/revenues_exceptions.dart';
import 'package:ms_dreams_delights/app/modules/revenues/infra/datasources/revenues_favorite_datasource.dart';
import 'package:ms_dreams_delights/app/services/firebase/collection.dart';
import 'package:ms_dreams_delights/app/services/firebase/firebase_intence.dart';
import 'package:ms_dreams_delights/app/utils/is_online.dart';

class RevenuesFavoriteDatasourceImpl implements IRevenuesFavoriteDatasource {
  @override
  Future<void> call(RevenuesIsFavoriteDTO dto) async {
    try {
      await MyFirebaseIntence.firestore
          .collection(MyCollection.COLLECTION_REVENUES)
          .doc(dto.id)
          .update(dto.toMap());
    } on Exception catch (e) {
      print('MY ERROR -- ${e.toString()}');
      var isOn = await isOnline();
      if (isOn) {
        throw Exception('Sem conexão com internet');
      }
      throw RevenuesExceptions('Erro ao criar receitas');
    }
  }
}
