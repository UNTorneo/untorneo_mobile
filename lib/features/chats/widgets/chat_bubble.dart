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
      mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 0.5),
          ),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              !isSender
                  ? Text(
                      username,
                      style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                    )
                  : const Text(
                      'Yo',
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                    ),
              Text(content),
              Text(
                sendedAt,
                textAlign: TextAlign.end,
                style: const TextStyle(fontSize: 8, color: Colors.black45),
              )
            ],
          ),
        ),
      ],
    );
  }
}
