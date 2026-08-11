import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application/core/widget/app_button.dart';
import '../widget/reset_header_widget.dart';
import '../widget/contact_method_selector_widget.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  String? selectedContactMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pagescolor,
 

 
      appBar: CustomAppBar(
        title: '',
        icon1: '',
        icon2: '',
        rightIcon1: false,
        rightIcon2: false,
        onPageChanged: () => Navigator.pop(context),
 
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const ResetHeaderWidget(
                        title: 'Forgot Password',
                        subtitle:
                            'Select which contact details should we use\n to reset your password',
                      ),
                      const SizedBox(height: 24),
                      ContactMethodSelectorWidget(
                        phoneValue: '+62 85-5***488-65',
                        emailValue: 'mu***@gmail.com',
                        onSelected: (value) {
                          setState(() => selectedContactMethod = value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 12),
 
                child: AppButton(
                  textColor: AppColors.whiteColor,
                  backgroundColor: AppColors.primaryColor,
 
                  text: 'Continue',
                  onPressed: selectedContactMethod == null
                      ? null
                      : () {
                          context.go('/verify-email');
                        },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
