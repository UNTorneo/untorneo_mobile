import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {

  const ChatBubble({
    super.key,
    required this.isSender,
    required this.content,
    required this.username,
    required this.sendedAt,
  });

  final bool isSender;
  final String content;
  final String username;
  final String sendedAt;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: isSender ? 
        CrossAxisAlignment.end
        : CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          color: isSender ? Colors.orange[300] : Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              !isSender ? Text(
                username,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
                ),
              )
              : const SizedBox(),
              Text(content),
              Text(
                sendedAt,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontSize: 8,
                  color: Colors.black45,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}