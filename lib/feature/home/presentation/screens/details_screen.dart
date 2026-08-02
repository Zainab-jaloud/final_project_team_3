import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import  'package:flutter_application/feature/home/presentation/widget/details_widget.dart';
import 'package:flutter_application/core/constants/app_images.dart';
import 'package:flutter_application/core/services/favorite_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
import 'package:flutter_application/feature/home/data/model.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/widget/app_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsScreen extends StatefulWidget {
     DetailsScreen({super.key, required this.property});
  final PropertyModel property;
final List reviews = [
  {
    'name': 'Theresa Webb',
    'comment': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s,',
    'image': AppImages.user,
  },
  {
    'name': 'Annette Black',
     'comment': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s,  ',
    'image': AppImages.user1,
  },
];
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
    int currentIndex = 0;
    final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
     List images= [
     widget.property.image,
     AppImages.image1,
     AppImages.image2,
     AppImages.image3,
     AppImages.image4,
  ];
     Map<String,String>fasilities= {    
     'Hospital':  'assets/icons/hospital.svg',
    'Gas stations': 'assets/icons/station.svg',
     'Mall':'assets/icons/Bag.svg',
     'Mosque':'assets/icons/mosqu.svg',
     
   
    
     };
     
    return Scaffold(
      appBar: CustomAppBar(title:'Details',
       icon1:'assets/icons/share.svg', icon2:FavoriteManager.isFavorite(widget.property)
      ? 'assets/icons/Heart_red.svg'
      : 'assets/icons/blackheart.svg',
        rightIcon1: true, rightIcon2:true,onTap: () {showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      // ignore: deprecated_member_use
      barrierColor: Colors.black.withOpacity(0.1),
      builder: (_) => const ShareBottomSheet()
      );}
        ,onPressed: () {setState(() {
      FavoriteManager.toggle(widget.property);
    });},),



        body: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width:327.sw,height:0.35.sh,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: images.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
              
                  Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count:4,
                        effect: WormEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          activeDotColor:AppColors.secondaryColor,
                          dotColor: AppColors.dotColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              ),
              SizedBox(height: 12,),
            PropertyImageDetails(images: images, pageController: _pageController),
            SizedBox(height: 24,),
            PropertyInformation(widget: widget),
            SizedBox(height: 24,),
           PropertyMoreDetails() ,
           
        PropertyDescription() ,SizedBox(height:24,), 
        Text('Agent',style:AppTextStyle.optionValueStyle.copyWith(fontSize: 16)
        
          ),
          SizedBox(height: 16,),
          AgentInfo(), 
                SizedBox(height: 24,),
                Text('Location & Public Fasilities',style:AppTextStyle.optionValueStyle.copyWith(fontSize: 16)
        
        ),  
     PublicFasilities(fasilities:fasilities),  SizedBox(height: 16,),
     MapLocation(),
     SizedBox(height: 24,),
     MainTitles(title:'Reviews 152', onTap:(){}),
     SizedBox(height:16,),
     ReviewsList(widget: widget)
     ])
          ,),
        ),
      
    bottomNavigationBar:Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 44),
      child: AppButton(text: 'Rent now', onPressed: () {},),
    ));
  
  }
}



