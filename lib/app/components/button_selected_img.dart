import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ms_dreams_delights/app/utils/hexcolor.dart';

// ignore: must_be_immutable
class ButtonSelectedImg extends StatefulWidget {
  ButtonSelectedImg({
    super.key,
    required this.onImageSelected,
    required this.onClose,
    required this.imageSelected,
    required this.imageSelectedName,
  });

  XFile? imageSelected;
  String imageSelectedName;

  final void Function() onClose;
  final Future<void> Function(XFile image) onImageSelected;

  @override
  State<ButtonSelectedImg> createState() => _ButtonSelectedImgState();
}

class _ButtonSelectedImgState extends State<ButtonSelectedImg> {
  final ImagePicker picker = ImagePicker();

  Future<void> _onImageSelected(XFile image) async {
    print('MY IMAGE -- ${await (image.readAsBytes())}');
    widget.imageSelected = image;
    widget.imageSelectedName = image.name;
    setState(() {});
  }

  @override
  void dispose() {
    print('cloase buttonnn');

    widget.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          print('open image');
          final response = await picker.pickImage(source: ImageSource.gallery);

          print('viem reposnse $response');
          if (response == null) return;
          _onImageSelected(response);
          widget.onImageSelected(response);
        } catch (e) {
          print('error ${e.toString()}');
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            side: BorderSide(color: HexColor("#D0CDCD"))),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: widget.imageSelectedName.isEmpty
                ? Text(
                    'Selecionar Image',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                : Text(
                    widget.imageSelectedName,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  )
            // Obx(() => Text(
            //       StockController.to.imageSelectedName.value.isEmpty
            //           ? 'Selecionar Image'
            //           : StockController.to.imageSelectedName.value,
            //       textAlign: TextAlign.center,
            //       style: Theme.of(context).textTheme.titleSmall,
            //     )),
            ),
      ),
    );
  }
}
