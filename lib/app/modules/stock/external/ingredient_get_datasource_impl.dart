import 'package:ms_dreams_delights/app/modules/stock/domain/entities/ingredient_dto.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/exceptions/ingredient_exception.dart';
import 'package:ms_dreams_delights/app/modules/stock/infra/datasources/ingredient_get_datasource.dart';
import 'package:ms_dreams_delights/app/services/firebase/collection.dart';
import 'package:ms_dreams_delights/app/services/firebase/firebase_intence.dart';
import 'package:ms_dreams_delights/app/utils/is_online.dart';

class IngredientGetDatasourceImpl implements IIngredientGetDatasource {
  @override
  Future<List<IngredientDTO>> call() async {
    List<IngredientDTO> list = [];
    try {
      await MyFirebaseIntence.firestore
          .collection(MyCollection.COLLECTION_INGREDIENTE)
          .get()
          .then((event) {
        for (var doc in event.docs) {
          list.add(IngredientDTO.fromMap(doc.data(), doc.id));
          print("${doc.id} => ${doc.data()}");
        }
      });

      return list;
    } on Exception catch (e) {
      print(e.toString());
      var isOn = await isOnline();
      if (isOn) {
        throw Exception('Sem conexão com internet');
      }
      throw IngredientException('Erro ao obter ingrediente/ adicionais');
    }
  }
}
