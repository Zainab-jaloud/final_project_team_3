import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/feature/reset_password/presentation/widget/password_field_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/widget/app_button.dart';
import 'package:go_router/go_router.dart';
import '../widget/reset_header_widget.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';

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
      _newPassword.length > 6 &&
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
      appBar: CustomAppBar(
        title: '',
        icon1: '',
        icon2: '',
        rightIcon1: false,
        rightIcon2: false,
        onPageChanged: () {
          context.go('/verify-email');
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12.h),
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
 
                      SizedBox(height: 32),
 
                      PasswordFieldWidget(
                        label: 'New Password',
                        hint: 'Password',
                        errorText:
                            _newPassword.isNotEmpty && _newPassword.length <= 6
                            ? 'Password must be more than 6 characters'
                            : null,
                        controller: _newPasswordController,
                        onChanged: (value) {
                          setState(() => _newPassword = value);
                        },
                      ),
                      SizedBox(height: 16.h),
                      PasswordFieldWidget(
                        label: 'Confirm Password',
                        hint: 'Password',
                        errorText:
                            _confirmPassword.isNotEmpty &&
                                _confirmPassword != _newPassword
                            ? 'Passwords do not match'
                            : null,
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
 
                padding: EdgeInsets.only(bottom: 16.h, top: 46),
                child: AppButton(
                  textColor: AppColors.whiteColor,
                  backgroundColor: AppColors.primaryColor,
                  text: 'Change password',
                  onPressed: _isFormValid
                      ? () async {
                          FocusScope.of(context).unfocus();

                          await Future.delayed(
                            const Duration(milliseconds: 150),
                          );
                          if (!mounted) return;
                          // ignore: use_build_context_synchronously
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
