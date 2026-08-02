import 'package:flutter/material.dart';
import 'package:flutter_application/feature/search/presentation/widget/facility_container.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/feature/search/presentation/widget/custom_checkbox.dart';
import 'package:flutter_application/feature/search/presentation/widget/custom_checkbox_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/feature/search/data/filter_selection_model.dart';
import 'package:flutter_application/feature/search/presentation/screens/filter_results_page.dart';
import 'package:go_router/go_router.dart';
class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  // متغيرات لتخزين خيارات المستخدم
  bool _forRent = false;
  bool _forSale = false;
  
  final Map<String, bool> _propertyTypes = {
    'Apartment': false,
    'Penhouse': false,
    'Hotel': false,
    'Villa': false,
  };

  RangeValues _currentPriceRange = const RangeValues(10, 800);
  
  final Map<String, bool> _facilities = {
    'Bedrooms': false,
    'Bathub': false,
    'AC': false,
    'WIFI': false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal:24.0, vertical: 16 ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
             Center(
               child: Container(width:45.w,height: 12.h, decoration: const BoxDecoration(
                       color: AppColors.dotColor,
                       borderRadius: BorderRadius.all( Radius.circular(8)),
                     ),),
             ),
             Center(child: SizedBox(height: 10,)),
            Center(
              child: Text(
                'Filter',
                style: AppTextStyle.optionValueStyle.copyWith(fontSize: 18,fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
    
             Text('Looking for', style: AppTextStyle.optionValueStyle.copyWith(fontSize: 15,fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            CustomCheckboxTile(
              title: 'For Rent',
              value: _forRent,
              onChanged: (val) => setState(() => _forRent = val ),
            ),
            CustomCheckboxTile(
              title: 'For Sale',
              value: _forSale,
              onChanged: (val) => setState(() => _forSale = val),
            ),
            const SizedBox(height: 16),
    
            
            const Text('Property Type', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ..._propertyTypes.keys.map((type) => CustomCheckboxTile(
                  title: type,
                  value: _propertyTypes[type]!,
                  onChanged: (val) => setState(() => _propertyTypes[type] = val ),
                )),
            TextButton(
              onPressed: () {
                
              },
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Text(
                'Show all', 
                style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
    
            // سلايدر
            const Text('Price Range', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SliderTheme(
                data: SliderTheme.of(context).copyWith(
                   trackHeight: 2.0, 
                    overlayShape: SliderComponentShape.noOverlay, //cancel circle aura
                       rangeThumbShape: const RoundRangeSliderThumbShape(
                       enabledThumbRadius: 6.0, // نصف قطر دائرة السلايدر
                      //  elevation: 2.0,        
                         ),
      //     thumbColor: AppColors.primaryColor,         //لون الدائرة عند السحب 
      // disabledThumbColor: AppColors.primaryColor,
                    activeTrackColor: AppColors.secondaryColor,
                    inactiveTrackColor: Colors.grey.shade200,
                    thumbColor: AppColors.secondaryColor,
                  ),
              child: RangeSlider(
                values: _currentPriceRange,
                min: 0,
                max: 1000,
                // activeColor: AppColors.secondaryColor, 
                // inactiveColor: Colors.grey.shade200,
                labels: RangeLabels(
                  '\$${_currentPriceRange.start.round()}',
                  '\$${_currentPriceRange.end.round()}',
                ),
                onChanged: (RangeValues values) {
                  setState(() => _currentPriceRange = values);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // اظهار السعر تصاعديا من اليسار لليمين حسب السلايدر
                Text('\$${_currentPriceRange.start.round()}', style: TextStyle(color: Colors.grey.shade500, fontSize: 13)),
                Text('\$${_currentPriceRange.end.round()}', style: TextStyle(color: Colors.grey.shade500, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 24),
    
            //قسم  facilities
            const Text('Facilities', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FacilityContainer(
                  icon: Icons.bed_outlined,
                  label: 'Bet room',
                  isSelected: _facilities['Bedrooms']!,
                  onTap: () => setState(() => _facilities['Bedrooms'] = !_facilities['Bedrooms']!),
                ),
                 SizedBox(width: 8.w),
                FacilityContainer(
                  icon: Icons.bathtub_outlined,
                  label: 'Bathub',
                  isSelected: _facilities['Bathub']!,
                  onTap: () => setState(() => _facilities['Bathub'] = !_facilities['Bathub']!),
                ),
                 SizedBox(width: 8.w),
                FacilityContainer(
                  icon: Icons.ac_unit,
                  label: 'AC',
                  isSelected: _facilities['AC']!,
                  onTap: () => setState(() => _facilities['AC'] = !_facilities['AC']!),
                ),
                 SizedBox(width: 8.w),
                FacilityContainer(
                  icon: Icons.wifi_rounded,
                  label: 'WIFI',
                  isSelected: _facilities['WIFI']!,
                  onTap: () => setState(() => _facilities['WIFI'] = !_facilities['WIFI']!),
                ),
              ],
            ),
            const SizedBox(height: 32),
    
          
            Row(
              children: [
                // Reset
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _forRent = false;
                        _forSale = false;
                        _propertyTypes.updateAll((key, value) => false);
                        _currentPriceRange = const RangeValues(0, 1000);
                        _facilities.updateAll((key, value) => false);
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide.none, 
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Reset', style: TextStyle(color: Colors.grey, fontSize: 16)),
                  ),
                ),
                const SizedBox(width: 16),
                // Apply
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                  List<String> selectedTypes = _propertyTypes.entries
                  .where((entry) => entry.value)
                  .map((entry) => entry.key)
                  .toList();

      // مودل لما اختاره المستخدم تتخزن البيانات في مودل الفلترة 
          final userSelection = FilterSelectionModel(
          forRent: _forRent,
          forSale: _forSale,
          selectedTypes: selectedTypes,
          minPrice: _currentPriceRange.start,
          maxPrice: _currentPriceRange.end,
          facilities: Map.from(_facilities), // اخذ نسخة من المرافق او الميزات المحددة
      );

      
      Navigator.pop(context, userSelection);

  // الانتقال الى صفحة النتائج المفلترة
           context.go(
             '/filterResults', 
             extra: userSelection,
                         );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 24),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Apply', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
