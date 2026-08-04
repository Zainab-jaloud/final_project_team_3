import 'package:flutter_application/core/constants/app_images.dart';

class ChatModel {
  final String name;
  final String imagePath;
  final String lastMessage;
  final String time;
  final bool isOnline;

  ChatModel({
    required this.name,
    required this.imagePath,
    required this.lastMessage,
    required this.time,
    this.isOnline = false,
  });
}

final List<ChatModel> mockChats = [
  ChatModel(
    name: 'Anggela',
    imagePath: AppImages.notificationAvatarAnggela,
    lastMessage: 'Thank you for information',
    time: '1:22 AM',
  ),
  ChatModel(
    name: 'Theresa Webb',
    imagePath:AppImages.person6,
    lastMessage: 'Hi there, the price is negotiable',
    time: '8:22 PM',
  ),
  ChatModel(
    name: 'Guy Hawkins',
    imagePath: AppImages.person7,
    lastMessage: 'Have a plan for discuss this ?',
    time: '8:22 PM',
  ),
  ChatModel(
    name: 'Savannah Nguyen',
    imagePath: AppImages.person8,
    lastMessage: 'Have a plan for discuss this ?',
    time: '8:22 PM',
  ),
  ChatModel(
    name: 'Arlene McCoy',
    imagePath:AppImages.person9,

    lastMessage: 'Have a plan for discuss this ?',
    time: '8:22 PM',
  ),
  ChatModel(
    name: 'Leslie Alexander',
    imagePath:AppImages.person10,
    lastMessage: 'Have a plan for discuss this ?',
    time: '8:22 PM',
  ),
];
