import 'package:flutter/material.dart';
import 'package:iit_chat/screens/message_screen.dart';
import 'package:iit_chat/utils/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/chat_widget.dart';
import '../widgets/search_delegate.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppTheme.redColor,
          title: const Text(
            'Groupe',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate:
                          CustomSearchHintDelegate(hintText: 'Rechercher'));
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ]),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "10 conversations",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.8), fontSize: 16.sp),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ChatWidget(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((ctx) => const MessageScreen()))),
                ),
                const ChatWidget(),
                const ChatWidget(),
              ],
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.redColor,
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 25.sp,
        ),
      ),
    );
  }
}
