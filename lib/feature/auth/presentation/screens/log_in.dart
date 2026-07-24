
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/widget/app_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  void initState() {
    super.initState();
    _loadSavedUserData(); // تقرا البيانات اول فتح الشاشة
  }

  Future<void> _loadSavedUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // هل يوجد بيانات محفوظة
      bool isRemembered = prefs.getBool('remember_me') ?? false;
      
      // اذا كنا في التسجيل وكان الخيار تذكرني تم اختياره سابقا  اعرض البيانات المدخلة سابقا
      if (isSignIn && isRemembered) {
        _rememberMe = true;
        _emailController.text = prefs.getString('saved_email') ?? '';
        _passwordController.text = prefs.getString('saved_password') ?? '';
      }
    });
  }


  Future<void> _saveUserData({required bool saveSession}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('remember_me', true);
    await prefs.setString('saved_email', _emailController.text.trim());
    await prefs.setString('saved_password', _passwordController.text.trim());
    
    // جعل قيمة العلام ترو من اجل ان يستمر في تخطي الاون بوردينغ عند الدخول طالما البيانات محفوظة
    await prefs.setBool('skip_onboarding', true); 
  }


  Future<void> _clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('remember_me');
    await prefs.remove('saved_email');
    await prefs.remove('saved_password');
    
    // تغيير قيمة العلام ليمنع تخطي الاون بووردينغ
    await prefs.setBool('skip_onboarding', false); 
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
                   key: const ValueKey('username_field'), 
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
                  key: const ValueKey('password_field'),
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
                        onPressed: () {(context).push('/reset-password');},
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

 
  //ملاحظة متغير الريميمبر مي هو نفسه لتشيك بوكس تذكرني والموافقة على الشروط والاحكام في كلا الصفحتين

                AppButton(
                    text: isSignIn ? "Sign in" : "Sign up",
                       onPressed: () async {
                        // تحقق من الصحة
                      if (_formKey.currentState!.validate()) {
      
                       //اذا كانت صفحة تسجيل هنا الريميمبر مي هي حقل تذكرني
                         if (isSignIn) {
                            if (_rememberMe == true) {
                            //اذا كان قد اختار تذكرني سيحتفظ ببياناته
                                 await _saveUserData(saveSession: true); 
                                } else {
                              // إذا لم يضغط هذا معناه امسح البيانات 
                                 await _clearUserData(); 
                                     }
                     // سواء نقر على تذكرني ام لم ينقر يجب ان يتم الانتقال
                           // ignore: use_build_context_synchronously
                           context.go('/setlocation');
                               } 
      
      // اذا كانت الصفحة انشاء حساب
      else if (!isSignIn) {
        //  هنا التشيك بوكس إجباري للموافقة على الشروط
        //اذا لم يوافق عليه يظهر سناك بار يحثه على ذلك
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
          return; // ولا يتم الانتقال 
        }
        
        //والا اذا وافق عليه ايضا يتم الانتقال 
        context.go('/setlocation');
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