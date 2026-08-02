//مودل للاحتفاظ بخيارات المستخدم عند رغبته بالفلترة

class FilterSelectionModel {
  final bool forRent;
  final bool forSale;
  final List<String> selectedTypes;
  final double minPrice;
  final double maxPrice;
  final Map<String, bool> facilities;


  FilterSelectionModel({
    this.forRent = false,
    this.forSale = false,
    this.selectedTypes = const [],
    this.minPrice = 0,
    this.maxPrice = 1000,
    this.facilities = const {},
  });
}

