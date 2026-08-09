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
import 'package:flutter_application/feature/search/presentation/widget/apply_reset_filter_buttons.dart';
import 'package:flutter_application/feature/search/presentation/widget/price_range_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/svg.dart';
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(48)),
      ),
      padding: const EdgeInsets.symmetric(horizontal:24.0, vertical: 10 ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: SizedBox(height:9 ,)),
             Center(
               child: Container(width:48.w,height: 10.h, decoration: const BoxDecoration(
                       color: AppColors.dotColor,
                       borderRadius: BorderRadius.all( Radius.circular(8)),
                     ),),
             ),
             Center(child: SizedBox(height: 20,)),
            Center(
              child: Text(
                'Fillter',
                style: AppTextStyle.optionValueStyle.copyWith(fontSize: 18,fontWeight: FontWeight.bold,),
              ),
            ),
            const SizedBox(height: 24),
    
             Text('Looking for', style: AppTextStyle.optionValueStyle.copyWith(fontSize: 16,fontWeight: FontWeight.w700)),
            const SizedBox(height: 16),
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
            const SizedBox(height: 24),
    
            
             Text('Property Type', style:AppTextStyle.optionValueStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ..._propertyTypes.keys.map((type) => CustomCheckboxTile(
                  title: type,
                  value: _propertyTypes[type]!,
                  onChanged: (val) => setState(() => _propertyTypes[type] = val ),
                )),

             

            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Text(
                'Show all', 
                style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 16),
    
            // سلايدر
             Text('Price Range', style:AppTextStyle.optionValueStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
             const SizedBox(height: 16),
                  PriceRangeSlider(
                  initialValues: _currentPriceRange,
                      min: 0,
                      max: 1000,
                      onChanged: (RangeValues values) {
                    setState(() {
                      _currentPriceRange = values; // تحديث المتغير المحلي لتبني عليه الفلترة
                        });
                      },
                    ),

            const SizedBox(height:8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // اظهار السعر تصاعديا من اليسار لليمين حسب السلايدر
                Text('\$${_currentPriceRange.start.round()}', style: AppTextStyle.optionValueStyle.copyWith(fontSize: 12,color: AppColors.locationColor)),
                Text('\$${_currentPriceRange.end.round()}',style: AppTextStyle.optionValueStyle.copyWith(fontSize: 12,color: AppColors.locationColor)),
              ],
            ),
            const SizedBox(height: 24),
    
            //قسم  facilities
             Text('Facilities', style:AppTextStyle.optionValueStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: FacilityContainer(
                    icon: Icon(Icons.bed_outlined, color: AppColors.secondaryColor, size: 24),
                    label: 'Bet room',
                    isSelected: _facilities['Bedrooms']!,
                    onTap: () => setState(() => _facilities['Bedrooms'] = !_facilities['Bedrooms']!),
                  ),
                ),
                 SizedBox(width: 8.w),
                Expanded(
                  child: FacilityContainer(
                    icon: SvgPicture.asset("assets/icons/Bathub.svg"),
                    label: 'Bathub',
                    isSelected: _facilities['Bathub']!,
                    onTap: () => setState(() => _facilities['Bathub'] = !_facilities['Bathub']!),
                  ),
                ),
                 SizedBox(width: 8.w),
                Expanded(
                  child: FacilityContainer(
                    icon: SvgPicture.asset('assets/icons/AC.svg'),
                    label: 'AC',
                    isSelected: _facilities['AC']!,
                    onTap: () => setState(() => _facilities['AC'] = !_facilities['AC']!),
                  ),
                ),
                 SizedBox(width: 8.w),
                Expanded(
                  child: FacilityContainer(
                    icon: SvgPicture.asset('assets/icons/Wifi.svg'),
                    label: 'WIFI',
                    isSelected: _facilities['WIFI']!,
                    onTap: () => setState(() => _facilities['WIFI'] = !_facilities['WIFI']!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
    
          
            FilterActionButtons(
              onResetPressed: () {
                setState(() {
                  _forRent = false;
                  _forSale = false;
                  _propertyTypes.updateAll((key, value) => false);
                  _currentPriceRange = const RangeValues(0, 1000);
                  _facilities.updateAll((key, value) => false);
                });
              },
              onApplyPressed: () {
                List<String> selectedTypes = _propertyTypes.entries
                    .where((entry) => entry.value)
                    .map((entry) => entry.key)
                    .toList();

                // تخزين البيانات التي اختارها المستخدم في المودل
                final userSelection = FilterSelectionModel(
                  forRent: _forRent,
                  forSale: _forSale,
                  selectedTypes: selectedTypes,
                  minPrice: _currentPriceRange.start,
                  maxPrice: _currentPriceRange.end,
                  facilities: Map.from(_facilities),
                );

                Navigator.pop(context, userSelection);
                context.push('/filterResults', extra: userSelection);
                // context.go('/filterResults', extra: userSelection);
              },
            ),
          ],
        ),
      ),
    );
  }
}
