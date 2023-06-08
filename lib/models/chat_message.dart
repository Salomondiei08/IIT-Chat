class ChatMessage {
  int? id;
  DateTime? createdTime;
  final String content;
  final bool isBotText;

  ChatMessage({required this.content, required this.isBotText, e});
}
