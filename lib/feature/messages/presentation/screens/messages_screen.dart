import 'package:flutter/material.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
import 'package:flutter_application/feature/messages/presentation/screens/chat_detail_screen.dart';
import 'package:flutter_application/feature/messages/presentation/widget/final_delete_confirmation_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import '../../data/message_model.dart';
import '../widget/chat_list_item_widget.dart';
import '../widget/chat_avatar_stack_widget.dart';
import '../widget/delete_confirmation_dialog.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late List<ChatModel> chats;

  @override
  void initState() {
    super.initState();
    chats = List.from(mockChats);
  }

  void _confirmDelete(ChatModel chat) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => DeleteConfirmationDialog(
        onConfirm: () {
          showDialog(
            context: context,
            builder: (_) => FinalDeleteConfirmationDialog(
              onConfirm: () {
                setState(() {
                  chats.remove(chat);
                });
              },
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pagescolor,
      appBar: CustomAppBar(
        title: 'Message',
        icon1: 'assets/icons/Search2.svg',
        icon2: '',
        rightIcon1: true,
        rightIcon2: false,
        onTap: () {},
        onPageChanged: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 12.h),
              ChatAvatarStackWidget(
                imagePaths: const [
                  'assets/images/Ellipse 25.png',
                  'assets/images/Ellipse 26.png',
                  'assets/images/Ellipse 27.png',
                  "assets/images/Ellipse 28.png",
                  'assets/images/Ellipse 17.png',
                ],
                onAddTap: () {},
              ),
              SizedBox(height: 16),
              Text(
                'All Message',
                style: AppTextStyle.fasilitiesTextStyl.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: chats.length,
                  separatorBuilder: (_, __) => Padding(
                    padding: EdgeInsets.only(left: 60.w),
                    child: Divider(
                      thickness: 0.5,
                      color: AppColors.divederMessage,
                      height: 2,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    final chat = chats[index];
                    return ChatListItemWidget(
                      chat: chat,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChatDetailScreen(
                              name: chat.name,
                              imagePath: chat.imagePath,
                            ),
                          ),
                        );
                      },
                      onMore: () {},
                      onDelete: () => _confirmDelete(chat),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
