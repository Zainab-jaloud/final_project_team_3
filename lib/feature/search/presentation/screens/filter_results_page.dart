import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
import 'package:flutter_application/feature/search/data/filter_selection_model.dart';
import 'package:flutter_application/feature/home/data/model.dart';
import 'package:flutter_application/feature/home/presentation/widget/near_places.dart';
import 'package:flutter_application/feature/search/data/property_filter_service.dart'; 
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
class FilterResultsPage extends StatelessWidget {
  final FilterSelectionModel selection;

  const FilterResultsPage({super.key, required this.selection});

  @override
  Widget build(BuildContext context) {
    //  استدعاء السيرفس الخارجية
    List<PropertyModel> filteredProperties = PropertyFilterService.filter(selection);

    return Scaffold(
      appBar: CustomAppBar(title: 'Filtered Results', icon1: '', icon2: '', rightIcon1: false, rightIcon2: false),
      // Text('Filtered Results',style:AppTextStyle.optionValueStyle,)
      body: filteredProperties.isEmpty
          ? Center(child:  
          Column(children:[ 
            SizedBox(height: 104.h,),
            Image.asset('assets/images/no_results.png',width: 215.w,height: 119.h,),
            SizedBox(height: 24.h,),
           Text('No Results Found',style: AppTextStyle.optionValueStyle.copyWith(fontSize: 20.sp),),
                                  SizedBox(height: 15.h,),
           Text('Try broadening your filters',style:AppTextStyle.optionLabelStyle.copyWith(fontSize: 14.sp)),

                      //  SizedBox(height: 104.h,),
          ])) 
          : StatefulBuilder(
              builder: (context, setStatePage) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: filteredProperties.length,
                  itemBuilder: (context, index) {
                    return NearPlaces(
                      isPopular: true,             
                      properties: filteredProperties[index],        
                      onChange: () => setStatePage(() {}),
                    );
                  },
                );
              },
            ),
    );
  }
}

