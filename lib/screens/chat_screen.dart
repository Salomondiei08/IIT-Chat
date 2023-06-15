import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppTheme.redColor,
          title: const Text(
            'Groupes',
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
        child: ChatListWidget(firestore: _firestore),
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

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({
    super.key,
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('chat').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: AppTheme.redColor,
              ),
            );
          }
          
          final chats = snapshot.data!.docs.reversed;
          List<ChatWidget> chatWidgetsList = [];

          for (var chat in chats) {
            print("element added");
            final id = chat.reference.id;
            final chatData = chat.data() as Map<String, dynamic>;
            final name = chatData['name'];
            final time = (chatData['time'] as Timestamp).toDate();
            final imageUrl = chatData['imageUrl'];

            final chatWidgets = ChatWidget(
              name: name,
              time: time,
              unredMessages: false,
              lastMessage: '',
              imageUrl: imageUrl,
              id: id,
              chatName: name,
            );

            chatWidgetsList.add(chatWidgets);
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${chatWidgetsList.length} conversations",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8), fontSize: 16.sp),
                ),
              ),
              Expanded(child: ListView(children: chatWidgetsList)),
            ],
          );
        });
  }
}
