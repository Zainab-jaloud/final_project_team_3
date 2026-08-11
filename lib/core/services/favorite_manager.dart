import 'package:flutter_application/feature/home/data/model.dart';

class FavoriteManager {
  static List<PropertyModel> favorites = [];

  static void toggle(PropertyModel property) {
    if (favorites.any((e) => e.id == property.id)) {
      favorites.removeWhere((e) => e.id == property.id);
    } else {
      favorites.add(property);
    }
  }

  static bool isFavorite(PropertyModel property) {
    return favorites.any((e) => e.id == property.id);
  }
}