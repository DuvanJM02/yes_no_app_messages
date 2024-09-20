import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://instagram.ftkd1-1.fna.fbcdn.net/v/t51.2885-19/450960035_1178653930076737_6327883345138578095_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.ftkd1-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=CbKBS-uyuxoQ7kNvgHFyX5u&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AYAroIGtEMpOJAkL182bB8BMaQsTpej5ZwQfmugPWdsSLA&oe=66EE988F&_nc_sid=8b3546'),
          ),
        ),
        title: const Text('Mi amor ❤️'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            // caja de texto,
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
