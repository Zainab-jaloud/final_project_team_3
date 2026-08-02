import 'package:flutter_application/feature/home/data/model.dart';
import 'package:flutter_application/feature/search/data/search_item.dart';
class PropertySearchService {
  // لوجك جلب العقارات التي نبحث عنها
  static List<PropertyModel> getSuggestions(String query) {
    if (query.trim().isEmpty) return [];
    
    final queryLower = query.toLowerCase().trim();
    return recomended.where((property) {
      final bool matchTitle = property.name.toLowerCase().contains(queryLower);
      final bool matchLocation = property.location.toLowerCase().contains(queryLower);
      return matchTitle || matchLocation;
    }).toList();
  }

  // property_search_service
static void addToRecentItem({PropertyModel? property, String? keyword, required List<SearchItem> recentList}) {
  SearchItem newItem;

  if (property != null) {
    // اذا كان عقار حقيقي ناخذ اسمه وموقعه ونخزنه
    if (recentList.any((item) => item.property?.id == property.id)) return;
    newItem = SearchItem(
      title: property.name,
      subtitle: property.location,
      property: property,
      isKeywordOnly: false,
    );
  } else if (keyword != null && keyword.trim().length >= 2) {
    // اذا كانت كلمة عشوائية كتبها المستخدم وضغط enter
    if (recentList.any((item) => item.title.toLowerCase() == keyword.toLowerCase().trim())) return;
    newItem = SearchItem(
      title: keyword.trim(),
      subtitle: '',
      isKeywordOnly: true,
    );
  } else {
    return;
  }

  recentList.insert(0, newItem);
  if (recentList.length > 3) recentList.removeLast();
}


}
