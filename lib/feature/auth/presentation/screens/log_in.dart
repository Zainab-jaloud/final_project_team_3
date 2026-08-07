import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
import 'package:flutter_application/core/widget/app_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application/feature/search/presentation/widget/custom_checkbox.dart';
//استدعاء ملف auth_local_service
import 'package:flutter_application/feature/auth/data/auth_local_service.dart';
import 'package:flutter_application/feature/auth/presentation/widget/auth_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController(); 
  final TextEditingController _passwordController = TextEditingController();
  
  // 
  final AuthLocalService _authLocalService = AuthLocalService();

  bool _rememberMe = false;
  bool isSignIn = true; 

  @override
  void initState() {
    super.initState();
    _initSavedData(); 
  }

  Future<void> _initSavedData() async {
    final savedData = await _authLocalService.loadSavedUserData(isSignIn);
    if (savedData != null) {
      setState(() {
        _rememberMe = true;
        _emailController.text = savedData['email'] ?? '';
        _passwordController.text = savedData['password'] ?? '';
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: '',icon1: '',icon2: '',rightIcon1: false,rightIcon2: false,),

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 14.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: 14.h),
                 
                  Text(
                    isSignIn ? "Welcome Back!" : "Register Account", 
                    style: AppTextStyle.optionValueStyle.copyWith(fontSize: 21,fontWeight: FontWeight.w700)
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(width: 250,
                    child: Text(
                      "Sign in with your email and password or social media to continue.",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.locationColor),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  
                  AuthTextField(
                    controller: _emailController,
                    labelText: 'Email',
                    hintText: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.toLowerCase().contains('@gmail.com')) {
                        return 'Email must be a valid @gmail.com account';
                      }
                      return null;
                    },
                  ),
                  if (!isSignIn) ...[
                    SizedBox(height: 16.h),
                    AuthTextField(
                      key: const ValueKey('username_field'), 
                      controller: _usernameController,
                      labelText: 'Username',
                      hintText: 'Username',
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
                    key: const ValueKey('password_field'),
                    controller: _passwordController,
                    labelText: 'Password',
                    hintText: 'Password',
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length <= 6) {
                        return 'Password must be more than 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 16,
                              height: 16,
                              // child: Checkbox(
                              //   value: _rememberMe,
                              //   onChanged: (newValue) {
                              //     setState(() {
                              //       _rememberMe = newValue ?? false;
                              //     });
                              //   },
                              //   shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(6.0),
                              //   ),
                              //   activeColor: AppColors.secondaryColor,    
                              // ),
                              child:  CustomCheckbox(
                              value: _rememberMe,
                              onChanged: (newValue) {
                              setState(() {
                                  _rememberMe = newValue;
                                    });
                              },
                            ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: isSignIn 
                                ? Text(
                                    "Remember me", 
                                    style: AppTextStyle.optionLabelStyle.copyWith(fontSize: 14,color: AppColors.titleColor),
                                  )
                                : RichText(
                                    text: TextSpan(
                                      style: AppTextStyle.optionLabelStyle.copyWith(fontSize: 14,color: AppColors.titleColor,fontWeight: FontWeight.w400),
                                      children: [
                                        const TextSpan(text: "Agree with "),
                                        TextSpan(
                                          text: "terms", 
                                          style: AppTextStyle.optionValueStyle.copyWith(fontWeight: FontWeight.w600,fontSize:14)
                                        ),
                                        const TextSpan(text: " and "),
                                        TextSpan(
                                          text: "privacy", 
                                          style: AppTextStyle.optionValueStyle.copyWith(fontWeight: FontWeight.w600,fontSize:14 )
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
                            style: AppTextStyle.optionLabelStyle.copyWith(
                              fontSize: 14,   
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  AppButton(
                    backgroundColor: AppColors.primaryColor,
                    textColor: AppColors.whiteColor,
                    text: isSignIn ? "Sign in" : "Sign up",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (isSignIn) {
                          if (_rememberMe == true) {
                            // استدعاء دالة الحفظ 
                            await _authLocalService.saveUserData(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ); 
                          } else {
                           // استدعاء دالة المسح
                            await _authLocalService.clearUserData(); 
                          }
                          context.go('/home');
                        } else if (!isSignIn) {
                          if (_rememberMe == false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Please agree to the Terms and privacy policy to continue.',
                                  style: TextStyle(fontFamily: 'Inter'),
                                ),
                                backgroundColor: Color.fromARGB(255, 99, 99, 99),
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(seconds: 3),
                              ),
                            );
                            return; 
                          }
                          context.go('/setlocation');
                        }
                      }
                    },
                  ),
                  
                  SizedBox(height: 24.h), 
                  
                  Center(
                    child: Text(
                      "Or",
                      style: AppTextStyle.optionLabelStyle.copyWith(fontSize: 14,color: AppColors.titleColor),
                    ),
                  ),
                  
                  SizedBox(height: 24.h), 
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: [
                      CircleAvatar(
                        radius: 23,
                        backgroundColor: const Color(0XFFE5E7EB),
                        child: SvgPicture.asset('assets/icons/facebook.svg'),
                      ),
                      SizedBox(width: 16.w), 
                      CircleAvatar(
                        radius: 23,
                        backgroundColor: const Color(0XFFE5E7EB),
                        child: SvgPicture.asset('assets/icons/google.svg'),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 32.h), 
                  
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isSignIn ? 'Don\'t have account ? ' : 'Already Have an account ? ',
                          style: AppTextStyle.optionLabelStyle.copyWith(fontSize: 14, color: AppColors.titleColor),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            setState(() {
                              isSignIn = !isSignIn; 
                            });
                          },
                          child: Text(
                            isSignIn ? "Sign up" : "Sign in",
                            style: AppTextStyle.fasilitiesTextStyl.copyWith(
                              fontSize: 14,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


