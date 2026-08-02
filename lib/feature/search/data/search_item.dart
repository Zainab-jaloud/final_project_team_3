import 'package:flutter_application/feature/home/data/model.dart';
//كلاس ليحتفظ بالذي يتم البحث عنه
class SearchItem {
  final String title;      
  final String subtitle;    
  final PropertyModel? property; // يحتفظ بالعقار كامل ان وجد لاكمال الكتابة
  final bool isKeywordOnly; //  هل هو نص لا نتيجة له ام عقار حقيقي

  SearchItem({
    required this.title,
    required this.subtitle,
    this.property,
    required this.isKeywordOnly,
  });
}
