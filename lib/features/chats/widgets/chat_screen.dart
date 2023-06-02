import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/features/chats/models/chats_model.dart';
import 'package:untorneo_mobile/features/chats/widgets/chat_bubble.dart';
import 'package:untorneo_mobile/widgets/widgets/custom_text_field.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({
    super.key,
  });

  static const route = '/chats_screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreen();
}

class _ChatScreen extends ConsumerState<ChatScreen> {
  final _scrollController = ScrollController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Partido'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return ChatBubble(
                    isSender: chat.isMine,
                    content: chat.content,
                    username: chat.name,
                    sendedAt: chat.time,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt,
                      size: 20,
                    ),
                    color: Colors.white,
                  ),
                ),
                Flexible(
                  child: CustomTextField(
                    textInputAction: TextInputAction.send,
                    keyboardType: TextInputType.text,
                    label: 'Envía un mensaje',
                    controller: _messageController,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send_rounded,
                      size: 20,
                    ),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
