/// نوع الإشعار: bell = إشعار عادي (أيقونة جرس)، message = إشعار رسالة (أفاتار شخص)
enum NotificationType { bell, message }

class NotificationModel {
  final String id;
  final NotificationType type;
  final String section;
  final bool isRead;
  final String? avatarAsset;
  final String beforeBold;
  final String boldPart;
  final String afterBold;

  const NotificationModel({
    required this.id,
    required this.type,
    required this.section,
    required this.isRead,
    required this.beforeBold,
    required this.boldPart,
    required this.afterBold,
    this.avatarAsset,
  });
}