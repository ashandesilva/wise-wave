import 'package:flutter/material.dart';
import 'package:wisewave/components/theme/main_bg_gradient.dart';
import 'package:wisewave/components/theme/nav_bg_gradient.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class Message {
  final String text;
  final bool isSentByUser;

  Message({required this.text, required this.isSentByUser});
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<Message> messages = [];
  final ScrollController _scrollController = ScrollController();


void sendMessage(String text) {
    final message = Message(text: text, isSentByUser: true);
    setState(() {
      messages.add(message);
      _textEditingController.clear();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
    // TODO: Make API call to send message
  }

  void receiveMessage(String text) {
    final message = Message(text: text, isSentByUser: false);
    setState(() {
      messages.add(message);

    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
    // TODO: Make API call to receive message
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AI Assistant',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
        flexibleSpace: Container(
          decoration: setNavBgGradient(),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: setMainBgGradient(),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return Align(
                    alignment: message.isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: message.isSentByUser ? Colors.green[300]!.withOpacity(0.4) : Colors.blue[300]!.withOpacity(0.4),
                      ),
                      child: Text(
                        message.text,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.grey.withOpacity(0.5),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your message',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      sendMessage(_textEditingController.text);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




