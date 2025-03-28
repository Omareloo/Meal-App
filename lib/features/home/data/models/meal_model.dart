import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_ware/features/home/domain/entity/meal_entity.dart';

class MealCreationReq extends MealModel {
  MealCreationReq({
    required final String id,
    required final String title,
    required final String category,
    required final String imgUrl,
    required final int prepTime,
    required final String summary,
    required final List<String> ingredients,
    required final List<String> directions,
    required final Map<String, dynamic> nutrients,
  }) : super(
    id: id,
    title: title,
    category: category,
    imgUrl: imgUrl,
    prepTime: prepTime,
    summary: summary,
    ingredients: ingredients,
    directions: directions,
    nutrients: nutrients,
  );

  /// Factory constructor to create an instance from Firestore document snapshot
  factory MealCreationReq.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>? ?? {};

    return MealCreationReq(
      id: snapshot.id, // Firestore-generated ID
      title: data['title'] as String? ?? '',
      category: data['category'] as String? ?? '',
      imgUrl: data['imgUrl'] as String? ?? '',
      prepTime: _parseInt(data['prepTime']),
      summary: data['summary'] as String? ?? '',
      ingredients: _parseStringList(data['ingredients']),
      directions: _parseStringList(data['directions']),
      nutrients: _parseMap(data['nutrients']),
    );
  }

  /// Converts the object to a Firestore-friendly Map
  Map<String, dynamic> toDocument() {
    return {
      "id": id,
      "title": title,
      "category": category,
      "imgUrl": imgUrl,
      "prepTime": prepTime,
      "summary": summary,
      "ingredients": ingredients,
      "directions": directions,
      "nutrients": nutrients,
    };
  }

  /// Parses `prepTime` safely, handling `int`, `num`, and `String` cases
  static int _parseInt(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0; // Default if null or invalid
  }

  /// Ensures input is a `List<String>`, converting safely
  static List<String> _parseStringList(dynamic value) {
    if (value is List) {
      return value.whereType<String>().toList();
    }
    return [];
  }

  /// Ensures input is a valid `Map<String, dynamic>`
  static Map<String, dynamic> _parseMap(dynamic value) {
    if (value is Map<String, dynamic>) return value;
    if (value is Map) {
      return value.map((key, val) => MapEntry(key.toString(), val));
    }
    return {}; // Default empty map if null or invalid
  }
}

/// 🔹 Extension to convert `MealModel` to `MealCreationReq`
extension MealModelExtension on MealModel {
  MealCreationReq toMealCreationReq() {
    return MealCreationReq(
      id: id!,
      title: title!,
      category: category!,
      imgUrl: imgUrl!,
      prepTime: prepTime!,
      summary: summary!,
      ingredients: ingredients!,
      directions: directions!,
      nutrients: nutrients!,
    );
  }
}
