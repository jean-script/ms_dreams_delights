import 'package:ms_dreams_delights/app/modules/revenues/domain/entities/revenues_entity.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/exceptions/revenues_exceptions.dart';
import 'package:ms_dreams_delights/app/modules/revenues/infra/datasources/revenues_get_datasource.dart';
import 'package:ms_dreams_delights/app/services/firebase/collection.dart';
import 'package:ms_dreams_delights/app/services/firebase/firebase_intence.dart';
import 'package:ms_dreams_delights/app/utils/is_online.dart';

class RevenuesGetDatasourceImpl extends IRevenuesGetDatasource {
  @override
  Future<List<RevenuesDTO>> call() async {
    List<RevenuesDTO> list = [];
    try {
      await MyFirebaseIntence.firestore
          .collection(MyCollection.COLLECTION_REVENUES)
          .get()
          .then((event) {
        for (var doc in event.docs) {
          list.add(RevenuesDTO.fromMap(doc.data(), doc.id));
          print("${doc.id} => ${doc.data()}");
        }
      });

      return list;
    } on Exception catch (e) {
      print(e.toString());
      var isOn = await isOnline();
      if (isOn) {
        throw Exception('Sem conexão com internet -- $e');
      }
      throw RevenuesExceptions('Erro ao obter receitas');
    }
  }
}
