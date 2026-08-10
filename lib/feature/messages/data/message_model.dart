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
    time: '8:45 PM',
  ),
  ChatModel(
    name: 'Theresa Webb',
    imagePath: 'assets/images/Ellipse 17 (7).png',
    lastMessage: 'Hi there, the price is negotiable',
    time: '6:30 PM',
  ),
  ChatModel(
    name: 'Guy Hawkins',
    imagePath: 'assets/images/Ellipse 17 (2).png',
    lastMessage: 'Have a plan for discuss this ?',
    time: '3:15 PM',
  ),
  ChatModel(
    name: 'Savannah Nguyen',
    imagePath: 'assets/images/Ellipse 17 (3).png',
    lastMessage: 'Is the apartment still available?',
    time: '11:20 AM',
  ),
  ChatModel(
    name: 'Arlene McCoy',
    imagePath: 'assets/images/Ellipse 17 (4).png',

    lastMessage: 'Can we schedule a viewing tomorrow?',
    time: '9:05 AM',
  ),
  ChatModel(
    name: 'Leslie Alexander',
    imagePath: 'assets/images/Ellipse 17 (5).png',
    lastMessage: "Thanks, I'll get back to you soon",
    time: '7:40 AM',
  ),
];
