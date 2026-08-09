import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_application/feature/search/presentation/widget/search_location_tile.dart';
import 'package:flutter_application/feature/search/presentation/widget/cancel_search icon.dart';
import 'package:flutter_application/feature/search/data/property_search_service.dart';
import 'package:flutter_application/feature/search/data/search_item.dart';
import 'package:flutter_application/feature/search/presentation/widget/search_field.dart';
import 'package:flutter_application/feature/search/presentation/widget/highlighted_text.dart';
import 'package:go_router/go_router.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  
  // قائمة لاستقبال عناصر البحث
  static List<SearchItem> recentSearches = []; 

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _query = _searchController.text;
      });
      
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    // استدعاء لوجك البحث من السيرفيس الخارجية
    final suggestions = PropertySearchService.getSuggestions(_query);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, 
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
        
              SizedBox(height: 24.0.h), 

              // search field
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: CustomSearchField(
    controller: _searchController,
    hintText: 'Search Property', 
    autofocus: true,
    
    suffixIcon: _query.isNotEmpty
        ? UnconstrainedBox(child: CancelSearchIcon(onTap: () { _searchController.clear();
                        FocusScope.of(context).unfocus(); // اغلاق الكيبورد
                        Navigator.pop(context);
                        }
           
        ))
        : SizedBox(
            width: 27.w,
            height: 27.h,
            // child: Center(child: SvgPicture.asset('assets/icons/Filter.svg')),
          ),
    
    onSubmitted: (value) {
      if (value.trim().isEmpty) return;
      setState(() {
        if (suggestions.isNotEmpty) {
          PropertySearchService.addToRecentItem(
            keyword: value, 
            recentList: recentSearches,
          );
          _searchController.text = suggestions.first.name;
          _searchController.selection = TextSelection.collapsed(offset: suggestions.first.name.length);
        } else {
          PropertySearchService.addToRecentItem(
            keyword: value, 
            recentList: recentSearches,
          );
        }
      });
    },
  ),
),



              
              Expanded(
                child: _query.isEmpty && recentSearches.isEmpty
                    ? Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/Search.svg', 
                                width: 64.w, 
                                height: 64.h, 
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                'Search for your dream property',
                                style: AppTextStyle.fasilitiesTextStyl.copyWith(fontSize: 16.sp),
                              ),
                              Text(
                                'Type a name or location to get started',
                                style: AppTextStyle.optionLabelStyle.copyWith(fontSize: 13.sp),
                              ),
                            ],
                          ),
                        ),
                      )
                    : (_query.isNotEmpty && suggestions.isEmpty
                        ? Center(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 19.0),
                                    child: Image.asset('assets/images/no_results.png', width: MediaQuery.of(context).size.width * 0.6, fit: BoxFit.contain,),// 
                                  ),
                                  SizedBox(height: 24.h),
                                  Text('Search not found', style: AppTextStyle.optionValueStyle.copyWith(fontSize: 20.sp)),
                                  SizedBox(height: 16.h),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                                    child: Text(
                                      'please enable your location services for\nmore optimal result', 
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.fasilitiesTextStyl.copyWith(color: AppColors.locationColor, fontSize: 14.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : ListView(
                            padding: EdgeInsets.symmetric(horizontal:26.r,vertical:24.r ),
                            children: [
                          
                              if (recentSearches.isNotEmpty) ...[
                                Text(
                                  'Recent', 
                                  style: AppTextStyle.optionValueStyle.copyWith(fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.bold)
                                ),
                                SizedBox(height: 8.h),
                                ...recentSearches.map((searchItem) {
                                  return SearchLocationTile(
                                    isRecent: true,
                                    titleWidget:HighlightedText(text: searchItem.title,query: _query, defaultStyle: AppTextStyle.optionValueStyle.copyWith(fontSize: 14.sp),),
                                    subtitleWidget:HighlightedText(text: searchItem.title,query: _query, defaultStyle:  AppTextStyle.optionLabelStyle.copyWith(fontSize: 12.sp, color: Colors.grey),), 
                                    onTap: () {
                                      setState(() {
                                        _searchController.text = searchItem.title;
                                        _searchController.selection = TextSelection.collapsed(offset: searchItem.title.length);
                                      });
                                    },
                                  );
                                }).toList(),
                                if (_query.isNotEmpty && suggestions.isNotEmpty) SizedBox(height: 24.h),
                              ],

                              // result للبحث الجديد
                              if (_query.isNotEmpty && suggestions.isNotEmpty) ...[
                                Text(
                                  'Result', 
                                  style: AppTextStyle.optionValueStyle.copyWith(fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.bold)
                                ),
                                SizedBox(height: 8.h),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(), 
                                  itemCount: suggestions.length,
                                  itemBuilder: (context, index) {
                                    final property = suggestions[index];
                                    return SearchLocationTile(
                                      isRecent: false, 
                                      titleWidget: HighlightedText(text: property.name, query: _query,defaultStyle: AppTextStyle.optionValueStyle.copyWith(fontSize: 14.sp),),
                                      subtitleWidget:  HighlightedText(text: property.location, query: _query,defaultStyle: AppTextStyle.optionLabelStyle.copyWith(fontSize: 12.sp, color: Colors.grey),),
                                      onTap: () {
                                        setState(() {
                                          //حفظ العقار في property model
                                          PropertySearchService.addToRecentItem(property: property, recentList: recentSearches);
                                          
                                          // اتمام الكلمة داخل الحقل ونقل المؤشر للنهاية
                                          _searchController.text = property.name;
                                          _searchController.selection = TextSelection.collapsed(offset: property.name.length);
                                        });
                                      },
                                    );
                                  },
                                ),
                              ],
                            ],
                          )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
