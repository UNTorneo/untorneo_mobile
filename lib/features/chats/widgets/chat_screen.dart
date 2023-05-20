import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/features/chats/widgets/chat_bubble.dart';

class ChatScreen extends ConsumerStatefulWidget {

  const ChatScreen({
    super.key,
    required this.chatId,
  });

  final String chatId;

  static const route = '/chats_screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreen();
}

class _ChatScreen extends ConsumerState<ChatScreen> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppBar(
            title: const Text('Partido'),
            backgroundColor: Colors.deepOrange[400],
          ),
          Scrollbar(
            controller: _scrollController,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) => const ChatBubble(
                isSender: true, 
                content: 'content', 
                username: 'Usuario 628', 
                sendedAt: '17:08',
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  color: Colors.amber[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt,
                    size: 28,
                  ),
                  color: Colors.white,
                ),
              ),
              Flexible(
                  child: TextField(
                textInputAction: TextInputAction.send,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(hintText: 'Envía un mensaje'),
                onSubmitted: (value) {},
              ),),
              Container(
                margin: const EdgeInsets.only(left: 4),
                decoration: BoxDecoration(
                  color: Colors.amber[200],
                  borderRadius: BorderRadius.circular(0),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send_rounded),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
