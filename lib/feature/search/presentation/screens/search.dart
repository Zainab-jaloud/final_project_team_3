// ignore_for_file: unnecessary_to_list_in_spreads
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_svg/svg.dart'; 
import 'package:flutter_application/feature/search/presentation/widget/search_location_tile.dart';
import 'package:flutter_application/feature/search/presentation/widget/cancel_search_icon.dart';
import 'package:flutter_application/feature/search/data/property_search_service.dart';
import 'package:flutter_application/feature/search/data/search_item.dart';

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

  // دالة تلوين الاحرف التي يتم البحث عنها
  Widget buildHighlightedText(String text, String query, TextStyle defaultStyle) {
    if (query.isEmpty || !text.toLowerCase().contains(query.toLowerCase())) {
      return Text(text, style: defaultStyle);
    }
    final int startIndex = text.toLowerCase().indexOf(query.toLowerCase());
    final int endIndex = startIndex + query.length;

    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: [
          TextSpan(text: text.substring(0, startIndex)),
          TextSpan(
            text: text.substring(startIndex, endIndex),
            style: defaultStyle.copyWith(
              color: AppColors.primaryColor, 
              fontWeight: defaultStyle.fontWeight ?? FontWeight.bold, 
              fontSize: defaultStyle.fontSize,
            ),
          ),
          TextSpan(text: text.substring(endIndex)),
        ],
      ),
    );
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
                padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        autofocus: true, 
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(14.r),
                          hintText: 'Search Property',
                          hintStyle: AppTextStyle.optionLabelStyle.copyWith(fontSize: 14.sp),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: SizedBox(
                              width: 24.w,
                              height: 24.h,
                              child: Center(child: SvgPicture.asset('assets/icons/Search.svg')),
                            ),
                          ),
                          suffixIcon: _query.isNotEmpty
                              ? CancelSearchIcon(onTap: () => _searchController.clear())
                              : SizedBox(
                                  width: 27.w,
                                  height: 27.h,
                                  child: Center(child: SvgPicture.asset('assets/icons/Filter.svg')),
                                ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: AppColors.inputBorderColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: AppColors.inputBorderColor),
                          ),
                        ),
                        // دالة لقراءة النص العشوائي وضغط enter
                        onSubmitted: (value) {
                          if (value.trim().isEmpty) return;
                          setState(() {
                            if (suggestions.isNotEmpty) {
                              PropertySearchService.addToRecentItem(
                                // property: suggestions.first, 
                                keyword: value, 
                                recentList: recentSearches,
                              );
                              // اكمال النص باول نتيجة مطابقة تلقائيا عند ضغط Enter
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
                  ],
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
                                  Image.asset('assets/images/no_results.png', width: 215.w, height: 119.h),
                                  SizedBox(height: 16.h),
                                  Text('Search not found', style: AppTextStyle.optionValueStyle.copyWith(fontSize: 20.sp)),
                                  SizedBox(height: 8.h),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                                    child: Text(
                                      'please enable your location services for more optimal result', 
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.grey, fontSize: 14.sp, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : ListView(
                            padding: EdgeInsets.all(16.0.r),
                            children: [
                          
                              if (recentSearches.isNotEmpty) ...[
                                Text(
                                  'Recent', 
                                  style: AppTextStyle.optionValueStyle.copyWith(fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.bold)
                                ),
                                SizedBox(height: 12.h),
                                ...recentSearches.map((searchItem) {
                                  return SearchLocationTile(
                                    isRecent: true,
                                    titleWidget: buildHighlightedText(searchItem.title, _query, AppTextStyle.optionValueStyle.copyWith(fontSize: 14.sp)),
                                    subtitleWidget: buildHighlightedText(searchItem.subtitle, _query, AppTextStyle.optionLabelStyle.copyWith(fontSize: 12.sp, color: Colors.grey)), 
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
                                SizedBox(height: 12.h),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(), 
                                  itemCount: suggestions.length,
                                  itemBuilder: (context, index) {
                                    final property = suggestions[index];
                                    return SearchLocationTile(
                                      isRecent: false, 
                                      titleWidget: buildHighlightedText(property.name, _query, AppTextStyle.optionValueStyle.copyWith(fontSize: 14.sp)),
                                      subtitleWidget: buildHighlightedText(property.location, _query, AppTextStyle.optionLabelStyle.copyWith(fontSize: 12.sp, color: Colors.grey)),
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
