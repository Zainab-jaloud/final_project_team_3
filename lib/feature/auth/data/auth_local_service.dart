import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalService {
  
  // دالة قراءة البيانات عند فتح الشاشة أول مرة
  Future<Map<String, String>?> loadSavedUserData(bool isSignIn) async {
    final prefs = await SharedPreferences.getInstance();
    bool isRemembered = prefs.getBool('remember_me') ?? false;
    
    if (isSignIn && isRemembered) {
      return {
        'email': prefs.getString('saved_email') ?? '',
        'password': prefs.getString('saved_password') ?? '',
      };
    }
    return null;
  }

  // دالة حفظ بيانات المستخدم عند تفعيل خيار تذكرني
  Future<void> saveUserData({required String email, required String password}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('remember_me', true);
    await prefs.setString('saved_email', email.trim());
    await prefs.setString('saved_password', password.trim());
    await prefs.setBool('skip_onboarding', true); 
  }

  // دالة حذف البيانات
  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('remember_me');
    await prefs.remove('saved_email');
    await prefs.remove('saved_password');
    await prefs.setBool('skip_onboarding', false); 
  }
}
