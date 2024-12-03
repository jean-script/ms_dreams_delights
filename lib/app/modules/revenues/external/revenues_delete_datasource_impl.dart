import 'package:ms_dreams_delights/app/modules/revenues/domain/exceptions/revenues_exceptions.dart';
import 'package:ms_dreams_delights/app/modules/revenues/infra/datasources/revenues_delete_datasource.dart';
import 'package:ms_dreams_delights/app/services/firebase/collection.dart';
import 'package:ms_dreams_delights/app/services/firebase/firebase_intence.dart';
import 'package:ms_dreams_delights/app/utils/is_online.dart';

class RevenuesDeleteDatasourceImpl extends IRevenuesDeleteDatasource {
  @override
  Future<void> call(String id) async {
    try {
      await MyFirebaseIntence.firestore
          .collection(MyCollection.COLLECTION_REVENUES)
          .doc(id)
          .delete();
    } on Exception catch (e) {
      print(e.toString());
      var isOn = await isOnline();
      if (isOn) {
        throw Exception('Sem conexão com internet');
      }
      throw RevenuesExceptions('Erro ao obter receitas');
    }
  }
}
