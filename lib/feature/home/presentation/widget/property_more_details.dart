import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/feature/home/data/model.dart';
import 'package:flutter_application/feature/home/presentation/widget/property_details.dart';
import 'package:flutter_svg/svg.dart';

class PropertyMoreDetails extends StatelessWidget {
  const PropertyMoreDetails({
    super.key, required this.property,
  });
final PropertyModel property;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Property Details',style:  AppTextStyle.optionValueStyle.copyWith(fontSize: 16)
        ,),
        SizedBox(height: 16,),
        Row(mainAxisAlignment: MainAxisAlignment.start,
         children: [Column(crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             PropertyDetails(title: 'Bedrooms', number: property.bedrooms,icon:Icon(Icons.bed_outlined,size: 18,),),
          SizedBox(height: 12,),PropertyDetails(title: 'Build', number:'2020'), 
           ],
         ),SizedBox(width: 71,),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PropertyDetails(title: 'Bathub', number: property.bathub,icon: SvgPicture.asset('assets/icons/path.svg'),),
       SizedBox(height: 12,),PropertyDetails(title: 'Parking', number: '1 Indoor'), ],
        ),SizedBox(width: 71,),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PropertyDetails(title: 'Area', number: '1,880 sqft',icon: SvgPicture.asset('assets/icons/area.svg'),),
        SizedBox(height: 12,),  PropertyDetails(title:'Status', number: property.status,)],
        )],),
    SizedBox(height: 12,),
     
      ],
    );
  }
}
