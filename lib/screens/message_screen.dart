import 'package:flutter/material.dart';
import 'package:iit_chat/widgets/app_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:typewritertext/typewritertext.dart';

import '../models/chat_message.dart';
import '../utils/app_theme.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  bool isLoading = false;
  final List<ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.png'),
                radius: 20,
              ),
              SizedBox(
                width: 2.w,
              ),
              const Text(
                'L1 Group',
              ),
            ],
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppTheme.redColor),
      backgroundColor: AppTheme.grayColor,
      body: Column(
        children: [
          Expanded(child: _buildList()),
          // CircularProgressIndicator is bot not anwser user question
          Visibility(
            visible: isLoading,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                color: Colors.white,
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                // chat body
                // l'input de saisie de l'user et le btn d'envoi
                _buildInput(),
              ],
            ),
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
        setState(() {
          _messages.add(
              ChatMessage(content: _textController.text, isBotText: false));
          isLoading = true;
        });

        setState(() {});
        // on recupere la saisie de l'user au sein d'une variable et on vide le texfield
        var input = _textController.text;
        _textController.clear();
        Future.delayed(const Duration(microseconds: 50))
            .then((value) => _scrollDown());

        //API Call
      },
    ));
  }

  Widget _buildSubmit() {
    return Visibility(
      visible: !isLoading,
      child: Container(
        color: AppTheme.redColor,
        child: IconButton(
          onPressed: () {
            setState(() {
              _messages.add(
                  ChatMessage(content: _textController.text, isBotText: false));

              isLoading = true;
            });
            // on recupere la saisie de l'user au sein d'une variable et on vide le texfield
            var input = _textController.text;
            _textController.clear();
            Future.delayed(const Duration(microseconds: 50))
                .then((value) => _scrollDown());

            //API Call
            _textController.clear();
            Future.delayed(const Duration(microseconds: 50))
                .then((value) => _scrollDown());
          },
          icon: const Icon(
            Icons.send_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // funtion to anime scrolling after user entry
  void _scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  ListView _buildList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _messages.length,
      controller: _scrollController,
      itemBuilder: ((context, index) {
        var message = _messages[index];
        return ChatMessageWidget(
          content: message.content,
          isBotText: message.isBotText,
        );
      }),
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget(
      {super.key, required this.content, required this.isBotText});

  final String content;
  final bool isBotText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(15),
      child: isBotText == true
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
