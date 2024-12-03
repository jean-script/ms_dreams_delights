import 'package:ms_dreams_delights/app/modules/stock/domain/entities/ingredient_dto.dart';
import 'package:ms_dreams_delights/app/modules/stock/infra/datasources/ingredient_add_datasource.dart';
import 'package:ms_dreams_delights/app/services/firebase/collection.dart';
import 'package:ms_dreams_delights/app/services/firebase/firebase_intence.dart';
import 'package:ms_dreams_delights/app/utils/is_online.dart';

class IngredientAddDatasourceImpl implements IIngredientAddDatasource {
  @override
  Future<IngredientDTO> call(IngredientDTO dto) async {
    try {
      // try {
      //   FileImage file = FileImage(File(dirImage.path + dto.pathImage!));

      //   file.file.copy(dirImage.path + dto.pathImage!);

      //   file.file.writeAsBytes((await dto.file!.readAsBytes()));
      // } on Error catch (e) {
      //   print('ERROR AO CRIAR ARQUIVO - \n\n${e.toString()}');
      // }

      // var myImageBytes =
      //     await StockController.to.imageAdiSelected?.readAsBytes();

      // String img = base64Encode(myImageBytes!);
      // print('mys bytes -- $img');

      var value = await (MyFirebaseIntence.firestore
          .collection(MyCollection.COLLECTION_INGREDIENTE)
          .add(IngredientDTO.toMap(dto)));

      return dto.copyWith(id: value.id);
    } on Exception catch (e) {
      print(e.toString());
      var isOn = await isOnline();
      if (isOn) {
        throw Exception('Sem conexão com internet');
      }
      print('ERROR no cadastro -- ${e.toString()}');
    }

    return dto;
  }
}
