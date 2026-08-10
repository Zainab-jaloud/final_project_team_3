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
    imagePath: 'assets/images/Ellipse 17.png',
    lastMessage: 'Thank you for information',
    time: '1:22 AM',
  ),
  ChatModel(
    name: 'Theresa Webb',
    imagePath: 'assets/images/Ellipse 17 (7).png',
    lastMessage: 'Hi there, the price is negotiable',
    time: '8:22 PM',
  ),
  ChatModel(
    name: 'Guy Hawkins',
    imagePath: 'assets/images/Ellipse 17 (2).png',
    lastMessage: 'Have a plan for discuss this ?',
    time: '7:22 AM',
  ),
  ChatModel(
    name: 'Savannah Nguyen',
    imagePath: 'assets/images/Ellipse 17 (3).png',
    lastMessage: 'Have a plan for discuss this ?',
    time: '10:00 PM',
  ),
  ChatModel(
    name: 'Arlene McCoy',
    imagePath: 'assets/images/Ellipse 17 (4).png',

    lastMessage: 'Have a plan for discuss this ?',
    time: '5:45 AM',
  ),
  ChatModel(
    name: 'Leslie Alexander',
    imagePath: 'assets/images/Ellipse 17 (5).png',
    lastMessage: 'Have a plan for discuss this ?',
    time: '6:00 AM',
  ),
];
