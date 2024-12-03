import 'package:ms_dreams_delights/app/modules/stock/domain/exceptions/ingredient_exception.dart';
import 'package:ms_dreams_delights/app/modules/stock/infra/datasources/ingredient_delete_datasource.dart';
import 'package:ms_dreams_delights/app/services/firebase/collection.dart';
import 'package:ms_dreams_delights/app/services/firebase/firebase_intence.dart';
import 'package:ms_dreams_delights/app/utils/is_online.dart';

class IngredientDeleteDatasourceImpl implements IIngredientDeleteDatasource {
  @override
  Future<void> call(String id) async {
    try {
      await MyFirebaseIntence.firestore
          .collection(MyCollection.COLLECTION_INGREDIENTE)
          .doc(id)
          .delete();
    } on Exception catch (e) {
      print(e.toString());
      var isOn = await isOnline();

      if (isOn) {
        throw Exception('Sem conexão com internet');
      }
      throw IngredientErrorDeleteException();
    }
  }
}
