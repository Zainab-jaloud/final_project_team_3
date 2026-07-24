import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/feature/reset_password/presentation/widget/password_field_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/widget/app_button.dart';
import 'package:go_router/go_router.dart';
import '../widget/reset_header_widget.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String _newPassword = '';
  String _confirmPassword = '';

  bool get _isFormValid =>
      _newPassword.isNotEmpty &&
      _confirmPassword.isNotEmpty &&
      _newPassword == _confirmPassword;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pagescolor,
      appBar: AppBar(
        backgroundColor: AppColors.pagescolor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.titleColor),
          onPressed: () {
            context.go('/verify-email');
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const ResetHeaderWidget(
                        title: 'Create New Password',
                        subtitle: 'Please enter a new password\n to change',
                      ),
                      SizedBox(height: 24.h),
                      PasswordFieldWidget(
                        label: 'New Password',
                        hint: 'Password',
                        controller: _newPasswordController,
                        onChanged: (value) {
                          setState(() => _newPassword = value);
                        },
                      ),
                      SizedBox(height: 16.h),
                      PasswordFieldWidget(
                        label: 'Confirm Password',
                        hint: 'Password',
                        controller: _confirmPasswordController,
                        onChanged: (value) {
                          setState(() => _confirmPassword = value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.h, top: 12.h),
                child: AppButton(
                  text: 'Change password',
                  onPressed: _isFormValid
                      ? () {
                          context.go('/success-reset');
                        }
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
