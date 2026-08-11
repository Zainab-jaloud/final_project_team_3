import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/widget/app_button.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
import 'package:flutter_application/feature/profile/presentation/widget/profile_avatar.dart';
import 'package:flutter_application/feature/profile/presentation/widget/profile_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  bool _nameError = false;
  bool _usernameError = false;
  bool _emailError = false;
  bool _dobError = false;

  File? _pickedImage;

  @override
  void initState() {
    super.initState();
    _loadSavedProfileData();
  }
 Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _pickedImage = File(picked.path);
      });
    }
  }

 
  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  bool _isValidEmail(String value) {
    if (!value.contains('@')) return false;
    final afterAt = value.split('@').last;
    if (!afterAt.contains('gmail.com')) return false;
    return true;
  }
Future _loadSavedProfileData() async {
  final prefs = await SharedPreferences.getInstance();

  final username = prefs.getString('username') ?? '';

  final firstName = username.trim().split(' ').first;

  setState(() {
    _nameController.text = username;       // الاسم الكامل
    _usernameController.text = firstName;  // الاسم الأول
    _emailController.text =
        prefs.getString('saved_email') ?? '';
    _dobController.text =
        prefs.getString('saved_dob') ?? '';
  });
}
  Future<void> _onSaveChange() async {
    final name = _nameController.text.trim();
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final dob = _dobController.text.trim();

    setState(() {
      _nameError = name.isEmpty;
      _usernameError = username.isEmpty;
      _dobError = dob.isEmpty;
      _emailError = email.isEmpty || !_isValidEmail(email);
    });

    if (_nameError || _usernameError || _emailError || _dobError) {
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', name);
    await prefs.setString('firstName', username);
    await prefs.setString('saved_email', email);
    await prefs.setString('saved_dob', dob);
    if (_pickedImage != null) {
      await prefs.setString('saved_avatar_path', _pickedImage!.path);
    }

    if (!mounted) return;
    Navigator.of(context).pop();
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1992, 11, 21),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text =
            '${_monthName(picked.month)}/${picked.day.toString().padLeft(2, '0')}/${picked.year}';
        _dobError = false;
      });
    }
  }

  String _monthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(
        title: 'Edit Profile',
        icon1: '',
        icon2: '',
        rightIcon1: false,
        rightIcon2: false,
        onPageChanged: () => Navigator.of(context).pop(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24,),
        child: Column(
          children: [
            SizedBox(height: 32.h),
            ProfileAvatar(
              imagePath: 'assets/images/user_avatar.png',
              imageFile: _pickedImage,
              onCameraTap: _pickImage,
            ),
            SizedBox(height: 48),
            ProfileTextField(
              label: 'Text Form',
              controller: _nameController,
              hasError: _nameError,
            ),
            SizedBox(height: 16.h),
            ProfileTextField(
              label: 'User Name',
              controller: _usernameController,
              hasError: _usernameError,
            ),
            SizedBox(height: 16.h),
            ProfileTextField(
              label: 'Email',
              controller: _emailController,
              type: ProfileFieldType.email,
              hasError: _emailError,
            ),
            SizedBox(height: 16.h),
            ProfileTextField(
              label: 'Date of birth',
              controller: _dobController,
              type: ProfileFieldType.date,
              hasError: _dobError,
              onTap: _pickDate,
            ),
            SizedBox(height: 64.h),
            AppButton(textColor: AppColors.whiteColor,
            backgroundColor: AppColors.primaryColor,
              text: 'Save Change',
              onPressed: _onSaveChange,
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}