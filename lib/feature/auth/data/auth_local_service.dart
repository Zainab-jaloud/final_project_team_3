import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalService {
  
  // دالة قراءة البيانات عند فتح الشاشة أول مرة
  Future<Map<String, String>?> loadSavedUserData(bool isSignIn) async {
    final prefs = await SharedPreferences.getInstance();
    bool isRemembered = prefs.getBool('remember_me') ?? false;
    
    if (isSignIn && isRemembered) {
      return {
        'email': prefs.getString('saved_email') ?? '',
        'username': prefs.getString('username') ?? '',
      };
    }
    return null;
  }

  // دالة حفظ بيانات المستخدم عند تفعيل خيار تذكرني
  Future<void> saveUserData({required String email,String? username,}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('remember_me', true);
    await prefs.setString('saved_email', email.trim());
    await prefs.setBool('skip_onboarding', true); 
    if (username != null && username.trim().isNotEmpty) { await prefs.setString( 'username', username.trim(), ); }
  }

  // دالة حذف البيانات
  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('remember_me');
    await prefs.remove('saved_email');
    await prefs.remove('saved_password');
    await prefs.remove('username');
    await prefs.setBool('skip_onboarding', false); 
  }
}
