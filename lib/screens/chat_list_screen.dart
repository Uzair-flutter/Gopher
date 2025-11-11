import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/route_generator.dart';
import 'package:gopher/utils/assets.dart';
import 'package:gopher/widgets/chat_list_tile.dart';
import 'package:gopher/widgets/custom_app_bar.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Chats",
        showSearchIcon: true,
        isBackButtonVisible: false,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,

                itemCount: 10,
                itemBuilder: (context, index) {
                  return ChatListTile(
                    onTap: () {
                      Navigator.pushNamed(context, chatScreen);
                    },
                    imageUrl: DummyAssets.person,
                    userName: "Christopher Smith",
                    messagePreview:
                        "Hello Chris, thankyou for your services!....",
                    time: "09:00",
                    unreadCount: 1,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
