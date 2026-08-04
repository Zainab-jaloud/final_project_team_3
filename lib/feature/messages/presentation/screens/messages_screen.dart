import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_images.dart';
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
      appBar: AppBar(
        backgroundColor: AppColors.pagescolor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.titleColor),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Message',
          style: AppTextStyle.optionValueStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: SvgPicture.asset(
              'assets/icons/Search.svg',
              width: 22.w,
              height: 22.w,
              colorFilter: ColorFilter.mode(
                AppColors.titleColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 12.h),
              ChatAvatarStackWidget(
                imagePaths:  [
               AppImages.person1,
               AppImages.person2,
               AppImages.person3,
               AppImages.person4,
               AppImages.person5
                ],
                onAddTap: () {},
              ),
              SizedBox(height: 16.h),
              Text(
                'All Message',
                style: AppTextStyle.fasilitiesTextStyl.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: ListView.separated(
                  itemCount: chats.length,
                  // ignore: unnecessary_underscores
                  separatorBuilder: (_, __) => Padding(
                    padding: EdgeInsets.only(left: 60.w),
                    child: Divider(
                      color: AppColors.dotColor,
                      height: 1,
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
