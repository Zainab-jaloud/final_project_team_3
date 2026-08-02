import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/router/app_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(  designSize: const Size(390, 844),
    minTextAdapt: true,
    splitScreenMode: true,
      builder: (context, child) {
        return  MaterialApp.router(debugShowCheckedModeBanner: false,
         theme: ThemeData(
    scaffoldBackgroundColor: AppColors.pagescolor,),
         routerConfig: AppRoute.pageRoute,);});
       
        }
}
