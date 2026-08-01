import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import '../widget/property_card_widget.dart';
import '../widget/chat_bubble_widget.dart';
import '../widget/chat_input_field_widget.dart';

class ChatDetailScreen extends StatefulWidget {
  final String name;
  final String imagePath;

  const ChatDetailScreen({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();

  final List<Map<String, dynamic>> _messages = [
    {
      'text': 'Hello we are interested in this how\n about the price ?',
      'time': '1:22 AM',
      'isMe': true,
    },
    {'text': 'can it be negotiated ?', 'time': '1:22 AM', 'isMe': true},
    {
      'text': 'Hi there, the price\n is negotiable',
      'time': '1:30 AM',
      'isMe': false,
    },
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;
    setState(() {
      _messages.add({
        'text': _messageController.text.trim(),
        'time': 'Now',
        'isMe': true,
      });
      _messageController.clear();
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
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
          icon: SvgPicture.asset(
            'assets/icons/Arrow - Left.svg',
            width: 24.w,
            height: 24.w,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 23.r,
              backgroundImage: AssetImage(widget.imagePath),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: AppTextStyle.optionValueStyle.copyWith(fontSize: 13),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Container(
                      width: 8.w,
                      height: 8.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.green,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Online',
                      style: AppTextStyle.optionLabelStyle.copyWith(
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/icons/phone.svg',
              width: 36.w,
              height: 36.w,
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/icons/IconsVedio.svg',
              width: 40.w,
              height: 40.w,
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Today',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.optionValueStyle,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: PropertyCardWidget(),
                      ),
                      SizedBox(height: 13.h),
                      ..._messages.map(
                        (msg) => ChatBubbleWidget(
                          message: msg['text'],
                          time: msg['time'],
                          isMe: msg['isMe'],
                          senderImagePath: msg['isMe']
                              ? null
                              : widget.imagePath,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              ChatInputFieldWidget(
                controller: _messageController,
                onAddTap: () {},
                onSendTap: _sendMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
