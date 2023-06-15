import 'package:flutter/material.dart';
import 'package:iit_chat/screens/message_screen.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.id,
    required this.name,
    required this.time,
    required this.unredMessages,
    required this.lastMessage,
    required this.imageUrl,
    required this.chatName,
  });

  final String name;
  final DateTime time;
  final String lastMessage;
  final bool unredMessages;
  final String imageUrl;
  final String chatName;

  final String id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => MessageScreen(
                    chatId: id,
                    chatImageUrl: imageUrl,
                    chatName: chatName,
                  ))),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 4),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: 8.w,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.sp),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      lastMessage,
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 3.w,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    FittedBox(
                      child: Text(
                        DateFormat('hh:mm').format(time),
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    unredMessages
                        ? Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blue),
                            child: Center(
                              child: Text(
                                '',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.sp),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
