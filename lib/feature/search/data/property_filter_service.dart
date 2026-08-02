import 'package:flutter_application/feature/home/data/model.dart';
import 'package:flutter_application/feature/search/data/filter_selection_model.dart';

class PropertyFilterService {
  //  تاخذ الاختيارات وتعيد قائمة العقارات المفلترة
  static List<PropertyModel> filter(FilterSelectionModel selection) {
    // دمج قوائم البيانات للبحث داخلها
    List<PropertyModel> allData = [...properties, ...recomended];

    return allData.where((property) {
      //  فلترة مجال السعر
      int cleanPrice = int.tryParse(property.price.replaceAll('\$', '').trim()) ?? 0;
      bool matchesPrice = cleanPrice >= selection.minPrice && cleanPrice <= selection.maxPrice;

      //  فلترة الحالة 
      bool matchesStatus = true;
      if (selection.forRent || selection.forSale) {
        matchesStatus = (selection.forRent && property.status == 'For Rent') ||
                        (selection.forSale && property.status == 'For Sale');
      }

      // فلترة النوع 
      bool matchesType = selection.selectedTypes.isEmpty || 
          selection.selectedTypes.any((type) => type.toLowerCase().contains(property.type.toLowerCase()));

      //  غرف النوم والحمامات
      bool matchesBedrooms = true;
      if (selection.facilities['Bedrooms'] == true) { 
        int count = int.tryParse(property.bedrooms) ?? 0;
        matchesBedrooms = count > 0; 
      }

      bool matchesBathub = true;
      if (selection.facilities['Bathub'] == true) { 
        int count = int.tryParse(property.bathub) ?? 0;
        matchesBathub = count > 0;
      }

      return matchesPrice && matchesStatus && matchesType && matchesBedrooms && matchesBathub;
    }).toList();
  }
}
