import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'chatmessages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  void _sendMessage(){
    ChatMessage _message  = ChatMessage(text: _controller.text, sender: "User");
    setState(() {
      _messages.insert(0, _message);
    });

    _controller.clear();
  }

  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (value) => _sendMessage(),
            style: TextStyle(color: Colors.white),
            decoration:
                InputDecoration.collapsed(hintText: 'What do you wanna know?'),
          ),
        ),
        IconButton(onPressed: () => _sendMessage(), icon: const Icon(Icons.send))
      ],
    ).px8();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Flexible(
              child: ListView.builder(
                  reverse: true,
                  padding: Vx.m8,
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return _messages[index];
                  })),
          Container(
            decoration: BoxDecoration(
              color: context.cardColor,
            ),
            child: _buildTextComposer(),
          )
        ],
      ),
    );
  }
}
