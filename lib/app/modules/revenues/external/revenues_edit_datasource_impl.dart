import 'package:get/get.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/entities/revenues_entity.dart';
import 'package:ms_dreams_delights/app/modules/revenues/domain/exceptions/revenues_exceptions.dart';
import 'package:ms_dreams_delights/app/modules/revenues/infra/datasources/revenues_edit_datasource.dart';
import 'package:ms_dreams_delights/app/services/firebase/collection.dart';
import 'package:ms_dreams_delights/app/services/firebase/firebase_intence.dart';
import 'package:ms_dreams_delights/app/utils/is_online.dart';

class RevenuesEditDatasourceImpl implements IRevenuesEditDatasource {
  @override
  Future<RevenuesDTO> call(RevenuesEditDTO dto) async {
    try {
      await MyFirebaseIntence.firestore
          .collection(MyCollection.COLLECTION_REVENUES)
          .doc(dto.id)
          .set(dto.toMap());

      print('MINHA LISTA ${dto.ingredients.length}');

      return RevenuesDTO(
        id: dto.id,
        image: dto.image ?? '',
        title: dto.title,
        description: dto.description,
        amount: dto.amount,
        totalValue: dto.totalValue,
        ingredients: dto.ingredients,
        favorite: (dto.favorite).obs,
      );
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
