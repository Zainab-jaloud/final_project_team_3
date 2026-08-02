import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/feature/home/data/model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PropertyStatus extends StatelessWidget {
  const PropertyStatus({
    super.key,    required this.properties, required this.status, required this.date
  });

final PropertyModel properties;
   final String status;
     final String date;
  @override
  Widget build(BuildContext context) {
    Color containerColor;
Color textColor;

switch (status) {
  case 'Checkin':
  case 'completed':
    containerColor = const Color(0xFFE8F5E9); // أخضر فاتح
    textColor = Colors.green;
    break;
  case 'Cancelled':
  case 'Waiting payment':
    containerColor = const Color(0xFFFFEBEE); // أحمر فاتح
    textColor = Colors.red;
    break;

  default: // Upcoming
    containerColor = AppColors.primaryColor;
    textColor = Colors.white;
}
    
    return Column(
      children: [
        Container(width: 327.sw,
        
          padding: const EdgeInsets.only(bottom:5),  
        
         
         child: Row(crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           ClipRRect(
             borderRadius: BorderRadius.circular(6),
             child: Image.asset(
               properties.image,
               width: 80,
               height:62,
               fit: BoxFit.scaleDown,
             ),
           ),SizedBox(width: 12,),
         Expanded(
           child: Column(crossAxisAlignment: CrossAxisAlignment.start,
             children: [Row(
               children: [
                 Expanded(
                   child: Text(properties.name,style: 
                     AppTextStyle.optionValueStyle,  maxLines: 1,
                         overflow: TextOverflow.ellipsis,),
                 ),
            
           
               ],
             ),SizedBox(height:2,),
           Row(spacing: 4,
             children: [SvgPicture.asset('assets/icons/Location2.svg',colorFilter: ColorFilter.mode(AppColors.locationColor,BlendMode.srcIn,),),
               SizedBox(width: 100,
                 child: Text(properties.location,
                  overflow: TextOverflow.ellipsis,maxLines:1,
                  style:
                 AppTextStyle.optionLabelStyle.copyWith(fontSize: 10)),
               ),
             ],
           ),SizedBox(height: 4,),
           Row(
             children: [
                Text(date,style:AppTextStyle.fasilitiesTextStyl.copyWith(color: AppColors.dotColor,fontSize: 10),),
        
             const Spacer(),
               
             Expanded(
               child: Container(width:55,height:18,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
               color: containerColor,),
               child:  
                        
                 Center(
                   child: Text( status,style:
                    AppTextStyle. optionLabelStyle.copyWith(fontSize: 10,color: textColor)),
                 )),
             )],),
         ]),
             )
             ],
           ),
         ),
     Divider(color: AppColors.borderColor,thickness:0.5,) ],
    );
     
  }
}
