
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/widget/app_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
// import '../../../../core/widget/app_button.dart';
// import '../widget/auth_text_field.dart';
import 'package:flutter_application/feature/auth/presentation/widget/auth_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController(); 
  final TextEditingController _passwordController =  TextEditingController();
  
  bool _rememberMe = false;
  bool isSignIn = true; 

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(leading: IconButton(onPressed:(){}, icon:Icon(Icons.arrow_back_outlined),), backgroundColor: Colors.transparent, elevation: 0, ),
      body: 
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 72.h),
               
                Text(
                  isSignIn ? "Welcome Back!" : "Register Account", 
                  style: AppTextStyle.topCaption
                ),
                SizedBox(height: 8.h),
                Text(
                  "Sign in with your email and password or social media to continue.",
                  style: AppTextStyle.fieldHintStyle,
                ),
                SizedBox(height: 30.h),
                
              
                AuthTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  hintText: 'brooklynsim@gmail.com',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.toLowerCase().contains('@gmail')) {
                      return 'Email must be a valid @gmail account';
                    }

                    return null;
                  },
                ),
                
                
                if (!isSignIn) ...[
                  SizedBox(height: 16.h),
                  AuthTextField(
                    controller: _usernameController,
                    labelText: 'Username',
                    hintText: 'brooklynsim',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                ],
                
                SizedBox(height: 16.h),
                
              
                AuthTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                        if (value.length <= 6) {
                    return 'Password must be more than 6 characters';}

                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 24.w,
                            child: Checkbox(
                              value: _rememberMe,

                              onChanged: (newValue) {
                                setState(() {
                                  _rememberMe = newValue ?? false;
                                });
                              },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                 
                                  ),
                             activeColor:AppColors.primaryColor,    
                           ),
                          ),
                          SizedBox(width: 8.w),

                          Expanded(
                            child: isSignIn 
                              ? Text(
                                  "Remember me", 
                                  style: AppTextStyle.fieldHintStyle.copyWith(fontSize: 14.sp),
                                )
                              : RichText(
                                  text: TextSpan(
                                    style: AppTextStyle.fieldInputStyle,
                                    children: [
                                      const TextSpan(text: "Agree with "),
                                      TextSpan(
                                        text: "terms", 
                                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp)
                                      ),
                                      const TextSpan(text: " and "),
                                      TextSpan(
                                        text: "privacy", 
                                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp)
                                      ),
                                    ],
                                  ),
                                ),
                          ),
                        ],
                      ),
                    ),
                    
                    if (isSignIn)
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {},
                        child: Text(
                          "Forgot password?", 
                          style: AppTextStyle.fieldHintStyle.copyWith(
                            fontSize: 14.sp,   
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Inter', 
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 32.h),
                
                
                AppButton(
                  text: isSignIn ? "Sign in" : "Sign up",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                       if (isSignIn) {
                              context.go('/setlocation'); 
                                      } 

               else        
               if (!isSignIn && _rememberMe == false) {
       
                        ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: const Text(
                            'Please agree to the Terms and privacy policy to continue.',
                             style: TextStyle(fontFamily: 'Inter'),
                                  ),
                           backgroundColor: const Color.fromARGB(255, 99, 99, 99),
                                    behavior: SnackBarBehavior.floating, 
                                  duration: const Duration(seconds: 3), 
                                      ),
                                           );
                                            return;
 
                       }
                    }
                  },
                ),
                
                SizedBox(height: 24.h), 
                
                Center(
                  child: Text(
                    "or",
                    style: AppTextStyle.fieldInputStyle,
                  ),
                ),
                
                SizedBox(height: 24.h), 
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: Color(0XFFE5E7EB),
                    child: SvgPicture.asset('assets/icons/facebook.svg'),
                    ),
                    SizedBox(width: 20.w), 
                    
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: Color(0XFFE5E7EB),
                       child: SvgPicture.asset('assets/icons/google.svg'),
                    ),
                  ],
                ),
                
                SizedBox(height: 48.h), 
                
               
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isSignIn ? 'Don\'t have account? ' : 'Already Have an account? ',
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          setState(() {
                            isSignIn = !isSignIn; // لعكس الحالة الحالية عند النقر لتتبدل الواجهة
                          });
                        },
                        child: Text(
                          isSignIn ? "Sign up" : "Sign in",
                              style: AppTextStyle.fieldHintStyle.copyWith(fontSize: 14.sp,
                                                    color:AppColors.secondaryColor,
                                                    fontWeight: FontWeight.bold,)
                                                    ,)
                                                  ,)
                                                ,]
                                            ,)
                                            ,),
                                            
                                            SizedBox(height: 16.h),
                                            ]
                                      ,)
                                    ,)
                                  ,)
                              ,)
                            ,);
                          }
                        }