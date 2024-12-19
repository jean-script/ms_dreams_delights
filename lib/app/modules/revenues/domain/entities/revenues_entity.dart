// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:ms_dreams_delights/app/modules/stock/domain/entities/ingredient_dto.dart';

class RevenuesDTO {
  final String id;
  final String image;
  final String title;
  final String description;
  final int amount;
  final double totalValue;
  final List<IngredientDTO> ingredients;
  RxBool favorite = false.obs;
  RevenuesDTO({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.amount,
    required this.totalValue,
    required this.ingredients,
    required this.favorite,
  });

  RevenuesDTO copyWith({
    String? id,
    String? image,
    String? title,
    String? description,
    int? amount,
    double? totalValue,
    List<IngredientDTO>? ingredients,
    RxBool? favorite,
  }) {
    return RevenuesDTO(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      totalValue: totalValue ?? this.totalValue,
      ingredients: ingredients ?? this.ingredients,
      favorite: favorite ?? this.favorite,
    );
  }

  static Map<String, dynamic> toMap(RevenuesCreatedDTO dto) {
    return <String, dynamic>{
      // 'id': id,
      'image': dto.image.toString(),
      'title': dto.title,
      'description': dto.description,
      'amount': dto.amount,
      'totalValue': dto.totalValue,
      'ingredients':
          dto.ingredients.map((x) => IngredientDTO.toMapWithID(x)).toList(),
      'favorite': dto.favorite,
    };
  }

  static Map<String, dynamic> toMapWithId(RevenuesDTO dto) {
    return <String, dynamic>{
      'id': dto.id,
      'image': dto.image,
      'title': dto.title,
      'description': dto.description,
      'amount': dto.amount,
      'totalValue': dto.totalValue,
      'ingredients':
          dto.ingredients.map((x) => IngredientDTO.toMapWithID(x)).toList(),
      'favorite': dto.favorite.value,
    };
  }

  factory RevenuesDTO.fromMap(Map<String, dynamic> map, String id) {
    return RevenuesDTO(
      id: id,
      image: map['image'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      amount: map['amount'] as int,
      totalValue: map['totalValue'] as double,
      ingredients: (map['ingredients'] as List<dynamic>)
          .map(
            (item) => IngredientDTO.fromMap(item, item['id']),
          )
          .toList(),
      favorite: (map['favorite'] as bool).obs,
    );
  }

  //  String toJson() => json.encode(toMap());

  // factory RevenuesDTO.fromJson(String source) =>
  //     RevenuesDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RevenuesDTO(id: $id, image: $image, title: $title, description: $description, amount: $amount, totalValue: $totalValue, ingredients: $ingredients)';
  }

  @override
  bool operator ==(covariant RevenuesDTO other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.image == image &&
        other.title == title &&
        other.description == description &&
        other.amount == amount &&
        other.totalValue == totalValue &&
        listEquals(other.ingredients, ingredients) &&
        other.favorite == favorite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        image.hashCode ^
        title.hashCode ^
        description.hashCode ^
        amount.hashCode ^
        totalValue.hashCode ^
        ingredients.hashCode;
  }
}

class RevenuesIsFavoriteDTO {
  final String id;
  final bool favorite;
  RevenuesIsFavoriteDTO({
    required this.id,
    required this.favorite,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'favorite': favorite,
    };
  }

  factory RevenuesIsFavoriteDTO.fromMap(Map<String, dynamic> map) {
    return RevenuesIsFavoriteDTO(
      id: map['id'] as String,
      favorite: map['favorite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory RevenuesIsFavoriteDTO.fromJson(String source) => RevenuesIsFavoriteDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}

class RevenuesEditDTO {
  final String id;
  final String? image;
  final String title;
  final String description;
  final int amount;
  final double totalValue;
  final List<IngredientDTO> ingredients;
  final bool favorite;
  RevenuesEditDTO({
    required this.id,
     this.image,
    required this.title,
    required this.description,
    required this.amount,
    required this.totalValue,
    required this.ingredients,
    required this.favorite,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'id': id,
      'image': image,
      'title': title,
      'description': description,
      'amount': amount,
      'totalValue': totalValue,
      'ingredients': ingredients.map((x) => IngredientDTO.toMapWithID(x)).toList(),
      'favorite': favorite,
    };
  }

  factory RevenuesEditDTO.fromMap(Map<String, dynamic> map) {
    return RevenuesEditDTO(
      id: map['id'] as String,
      image: map['image'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      amount: map['amount'] as int,
      totalValue: map['totalValue'] as double,
      ingredients: (map['ingredients'] as List<Map<String, dynamic>>)
          .map(
            (item) => IngredientDTO.fromMap(item, item['id']),
          )
          .toList(),
      favorite: map['favorite'] as bool,
    );
  }

  factory RevenuesEditDTO.fromJson(String source) =>
      RevenuesEditDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}

class RevenuesCreatedDTO {
  final String image;
  final String title;
  final String description;
  final int amount;
  final double totalValue;
  final List<IngredientDTO> ingredients;
  bool favorite = false;
  RevenuesCreatedDTO({
    required this.image,
    required this.title,
    required this.description,
    required this.amount,
    required this.totalValue,
    required this.ingredients,
  });

  RevenuesCreatedDTO copyWith({
    String? image,
    String? title,
    String? description,
    int? amount,
    double? totalValue,
    List<IngredientDTO>? ingredients,
    bool? favorite,
  }) {
    return RevenuesCreatedDTO(
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      totalValue: totalValue ?? this.totalValue,
      ingredients: ingredients ?? this.ingredients,
      // favorite: favorite ?? this.favorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image.toString(),
      'title': title,
      'description': description,
      'amount': amount,
      'totalValue': totalValue,
      'ingredients': ingredients.map((x) => IngredientDTO.toMap(x)).toList(),
      'favorite': favorite,
    };
  }

  factory RevenuesCreatedDTO.fromMap(Map<String, dynamic> map) {
    return RevenuesCreatedDTO(
      image: map['image'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      amount: map['amount'] as int,
      totalValue: map['totalValue'] as double,
      ingredients: (map['ingredients'] as List<Map<String, dynamic>>)
          .map(
            (item) => IngredientDTO.fromMap(item, item['id']),
          )
          .toList(),
      // favorite: map['favorite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory RevenuesCreatedDTO.fromJson(String source) =>
      RevenuesCreatedDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RevenuesCreatedDTO(image: $image, title: $title, description: $description, amount: $amount, totalValue: $totalValue, ingredients: $ingredients, favorite: $favorite)';
  }

  @override
  bool operator ==(covariant RevenuesCreatedDTO other) {
    if (identical(this, other)) return true;

    return other.image == image &&
        other.title == title &&
        other.description == description &&
        other.amount == amount &&
        other.totalValue == totalValue &&
        listEquals(other.ingredients, ingredients) &&
        other.favorite == favorite;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        title.hashCode ^
        description.hashCode ^
        amount.hashCode ^
        totalValue.hashCode ^
        ingredients.hashCode ^
        favorite.hashCode;
  }
}
