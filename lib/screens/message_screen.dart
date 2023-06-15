import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iit_chat/widgets/app_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:typewritertext/typewritertext.dart';

import '../providers/auth_provider.dart';
import '../utils/app_theme.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen(
      {super.key,
      required this.chatId,
      required this.chatImageUrl,
      required this.chatName});
  final String chatId;
  final String chatImageUrl;
  final String chatName;
  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final AuthenticationProvider auth = AuthenticationProvider();
  final user = AuthenticationProvider().firebaseAuth.currentUser;
  final _firestore = FirebaseFirestore.instance;

  bool isLoading = false;

  final TextEditingController _textController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  List<ChatMessageWidget> chatMessageList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.chatImageUrl),
                radius: 20,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                widget.chatName,
              ),
            ],
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppTheme.redColor),
      backgroundColor: AppTheme.grayColor,
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: _firestore
                    .collection('chat')
                    .doc(widget.chatId)
                    .collection('messages')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: AppTheme.redColor,
                      ),
                    );
                  } else if (!snapshot.hasData) {
                    return Center(
                      child: Text(
                        'No Messages',
                        style: TextStyle(
                            color: AppTheme.redColor, fontSize: 16.sp),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'An Error Occured',
                        style: TextStyle(
                            color: AppTheme.redColor, fontSize: 16.sp),
                      ),
                    );
                  }

                  final messages = snapshot.data!.docs.reversed;

                  for (var message in messages) {
                    print("messages Loaded");
                    final messageData = message.data();
                    final content = messageData['content'];
                    final time = (messageData['time'] as Timestamp).toDate();
                    final isMe = messageData['senderId'] ==
                            AuthenticationProvider()
                                .firebaseAuth
                                .currentUser
                                ?.uid
                        ? true
                        : false;

                    final chatMessageWidgetList = ChatMessageWidget(
                      content: content,
                      isMe: isMe,
                      time: time,
                    );

                    chatMessageList.add(chatMessageWidgetList);
                    chatMessageList.sort(((a, b) => a.time.compareTo(b.time)));
                  }

                  return Column(
                    children: [
                      Expanded(child: ListView(children: chatMessageList)),
                    ],
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: _buildInput(),
          ),
        ],
      ),
    );
  }

  Expanded _buildInput() {
    return Expanded(
        child: AppTextField(
      textController: _textController,
      text: 'Type Something',
      icon: Icons.send,
      onPressed: () {
        _firestore
            .collection('chat')
            .doc(widget.chatId)
            .collection('messages')
            .add({
          'content': _textController.text.trim(),
          'senderId': user!.uid,
          'time': Timestamp.fromDate(DateTime.now())
        });

        setState(() {
          _textController.clear();
        });

        // Future.delayed(const Duration(microseconds: 50))
        //     .then((value) => _scrollDown());

_scrollDown();
        //API Call
      },
    ));
  }

  // funtion to anime scrolling after user entry
  void _scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }
}

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget(
      {super.key,
      required this.content,
      required this.isMe,
      required this.time});

  final String content;
  final bool isMe;
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: isMe == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(13),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: TypeWriterText(
                            maintainSize: false,
                            text: Text(
                              content,
                            ),
                            duration: const Duration(milliseconds: 50),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(left: 16),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/logo.png',
                      scale: 1.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/logo.png',
                      scale: 1.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.redColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(13),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: Text(
                            content,
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
