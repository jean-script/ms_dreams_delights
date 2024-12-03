import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class IngredientDTO {
  final String id;
  final String title;
  final int amount;
  final double value;
  final double unit;
  final double costUnit;
  final Measurement? measurement;
  final Type type;
  final String? pathImage;
  final XFile? file;
  final RxDouble totalValueCost = 0.0.obs;
  final TextEditingController textController = TextEditingController(text: '1');
  final double? amountUseRevenues;

  IngredientDTO({
    required this.id,
    required this.title,
    required this.amount,
    required this.value,
    required this.unit,
    required this.costUnit,
    this.measurement,
    required this.type,
    required this.pathImage,
    this.file,
    this.amountUseRevenues,
  }) {
    totalValueCost.value = costUnit * double.parse(textController.text);
  }

  factory IngredientDTO.createdIngredient(IngredienCreatedtDTO dto,
      {String? id}) {
    return IngredientDTO(
      id: id ?? '',
      title: dto.title,
      amount: dto.amount,
      value: dto.value,
      unit: dto.unit,
      costUnit: dto.costUnit,
      measurement: dto.measurement,
      type: dto.type,
      pathImage: dto.pathImage,
      file: dto.file,
    );
  }
  factory IngredientDTO.createdAdicional(AdditionalCreatedtDTO dto,
      {String? id}) {
    return IngredientDTO(
      id: id ?? '',
      title: dto.title,
      amount: dto.amount,
      value: dto.value,
      unit: 0,
      costUnit: dto.costUnit,
      type: dto.type,
      pathImage: dto.pathImage,
      file: dto.file,
      measurement: Measurement.unit,
    );
  }

  IngredientDTO copyWith({
    String? id,
    String? title,
    int? amount,
    double? value,
    double? unit,
    double? costUnit,
    Measurement? measurement,
    Type? type,
    String? pathImage,
  }) {
    return IngredientDTO(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      value: value ?? this.value,
      unit: unit ?? this.unit,
      costUnit: costUnit ?? this.costUnit,
      measurement: measurement ?? this.measurement,
      type: type ?? this.type,
      pathImage: pathImage ?? this.pathImage,
    );
  }

  static Map<String, dynamic> toMap(IngredientDTO dto) {
    return <String, dynamic>{
      // 'id': dto.id,
      'title': dto.title,
      'amount': dto.amount,
      'value': dto.value,
      'unit': dto.unit,
      'costUnit': dto.costUnit,
      'measurement': dto.measurement?.name ?? '',
      'type': dto.type.name,
      'pathImage': dto.pathImage,
    };
  }

  static Map<String, dynamic> toMapWithID(IngredientDTO dto) {
    return <String, dynamic>{
      'id': dto.id,
      'title': dto.title,
      'amount': dto.amount,
      'value': dto.value,
      'unit': dto.unit,
      'costUnit': dto.costUnit,
      'measurement': dto.measurement?.name ?? '',
      'type': dto.type.name,
      'pathImage': dto.pathImage,
      'amountUseRevenues': (double.tryParse(dto.textController.text) ?? 0.0),
    };
  }

  factory IngredientDTO.fromMap(Map<String, dynamic> map, String id) {
    return IngredientDTO(
      id: id,
      title: map['title'] as String,
      amount: (int.tryParse(map['amount'].toString()) ?? 0),
      value: (double.tryParse(map['value'].toString()) ?? 0),
      unit: (double.tryParse(map['unit'].toString()) ?? 0),
      costUnit: (double.tryParse(map['costUnit'].toString()) ?? 0),
      measurement: getMeasurement(map['measurement']),
      type: getType(map['type']),
      pathImage: map['pathImage'] as String,
      amountUseRevenues: map['amountUseRevenues'] as double?,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory IngredientDTO.fromJson(String source) =>
  //     IngredientDTO.fromMap(json.decode(source) as Map<String, dynamic>, );

  static Type getType(String type) {
    switch (type) {
      case 'ingredient':
        return Type.ingredient;
      default:
        return Type.additional;
    }
  }

  static Measurement getMeasurement(String type) {
    switch (type) {
      case 'grama':
        return Measurement.grama;
      case 'unit':
        return Measurement.unit;
      default:
        return Measurement.mililitro;
    }
  }

  @override
  String toString() {
    return 'IngredientDTO(id: $id, title: $title, amount: $amount, value: $value, unit: $unit, costUnit: $costUnit, measurement: $measurement, imagePath: $pathImage)';
  }

  @override
  bool operator ==(covariant IngredientDTO other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.amount == amount &&
        other.value == value &&
        other.unit == unit &&
        other.costUnit == costUnit;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        amount.hashCode ^
        value.hashCode ^
        unit.hashCode ^
        costUnit.hashCode;
  }
}

class IngredienCreatedtDTO {
  final String? pathImage;
  final String title;
  final int amount;
  final double value;
  final double unit;
  final double costUnit;
  final Measurement measurement;
  final Type type;
  final XFile? file;

  IngredienCreatedtDTO({
    required this.pathImage,
    required this.title,
    required this.amount,
    required this.value,
    required this.unit,
    required this.costUnit,
    required this.measurement,
    this.file,
    this.type = Type.ingredient,
  });
}

class AdditionalCreatedtDTO {
  final String? pathImage;
  final String title;
  final int amount;
  final double value;
  final Type type;
  final XFile? file;
  final double costUnit;

  AdditionalCreatedtDTO({
    this.pathImage,
    required this.title,
    required this.amount,
    required this.value,
    required this.costUnit,
    this.file,
    this.type = Type.additional,
  });
}

enum Measurement { grama, unit, mililitro }

enum Type { ingredient, additional }
