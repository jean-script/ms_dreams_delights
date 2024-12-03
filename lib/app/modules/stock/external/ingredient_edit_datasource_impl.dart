import 'package:ms_dreams_delights/app/modules/stock/domain/entities/ingredient_dto.dart';
import 'package:ms_dreams_delights/app/modules/stock/domain/exceptions/ingredient_exception.dart';
import 'package:ms_dreams_delights/app/modules/stock/infra/datasources/ingredient_edit_datasource.dart';
import 'package:ms_dreams_delights/app/services/firebase/collection.dart';
import 'package:ms_dreams_delights/app/services/firebase/firebase_intence.dart';
import 'package:ms_dreams_delights/app/utils/is_online.dart';

class IngredientEditDatasourceImpl implements IIngredienteEditDatasource {
  @override
  Future<IngredientDTO> call(IngredientDTO dto) async {
    try {
      print(dto.toString());
      await MyFirebaseIntence.firestore
          .collection(MyCollection.COLLECTION_INGREDIENTE)
          .doc(dto.id)
          .update(IngredientDTO.toMap(dto));

      return dto;
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
