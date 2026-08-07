
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:lucide_icons/lucide_icons.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isPassword; // لتحديد اذا كان خاص بكلمة المرور
  final String? Function(String?)? validator; 
  final ValueChanged<String>? onChanged;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText = '',
    this.isPassword = false, 
    this.validator,
    this.onChanged,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
 
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        Text(widget.labelText, style: AppTextStyle.optionValueStyle.copyWith(fontSize: 14,fontWeight: FontWeight.bold)),
        SizedBox(height: 4.h),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText, 
          validator: widget.validator,
          style: AppTextStyle.optionLabelStyle.copyWith(fontSize: 14,color:AppColors.titleColor),
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: widget.hintText, 
            hintStyle: AppTextStyle.optionLabelStyle.copyWith(fontSize: 14,color: AppColors.inputHintColor),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 17.w,
              vertical: 19.h,
            ),
            
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: 
                      _obscureText
                          ? Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: SvgPicture.asset('assets/icons/Hide.svg',width: 19.5,height: 16.77,),
                          )
                          : Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Icon(Icons.visibility_outlined , color: AppColors.inputHintColor,size:20,),
                          ),
                         color: AppColors.inputHintColor,
                      
                    
                    onPressed: () {
                     
                      setState(() => _obscureText = !_obscureText);
                    },
                  )
                : null, 
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.inputBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: AppColors.redHeartColor, width: 1)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: AppColors.redHeartColor, width: 1)),
            errorStyle: TextStyle(color: AppColors.redHeartColor, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
