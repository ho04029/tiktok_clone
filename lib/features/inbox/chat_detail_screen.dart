import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/inbox/view_models/messages_view_model.dart';

class ChatDetailScreen extends ConsumerStatefulWidget {
  static const String routeName = "chatDetail";
  static const String routeURL = ":chatId";

  final String chatId;

  const ChatDetailScreen({super.key, required this.chatId});

  @override
  ConsumerState<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends ConsumerState<ChatDetailScreen> {
  final TextEditingController _editingController = TextEditingController();

  void _onSendPress() {
    final text = _editingController.text;
    if (text == "") return;
    ref.read(messagesProvider.notifier).sendMessage(text);
    _editingController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(messagesProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: CircleAvatar(
            radius: Sizes.size24,
            foregroundImage: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsv_pZL9XVHMiLKMnV89B1LauRL2t1nis-LeK96R_yOtlAjBF8s1LSpMJHVPoFFrq1wlg&usqp=CAU",
            ),
            child: Text("user"),
          ),
          title: Text(
            "user (${widget.chatId})",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text("Active now"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.size20,
              horizontal: Sizes.size14,
            ),
            itemBuilder: (context, index) {
              final isMine = index % 2 == 0;
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                    isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(Sizes.size14),
                    decoration: BoxDecoration(
                      color: isMine
                          ? Colors.blue
                          : Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Sizes.size20),
                        topRight: Radius.circular(Sizes.size20),
                        bottomLeft: Radius.circular(
                          isMine ? Sizes.size20 : Sizes.size5,
                        ),
                        bottomRight: Radius.circular(
                          isMine ? Sizes.size5 : Sizes.size20,
                        ),
                      ),
                    ),
                    child: Text(
                      "this is a message!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => Gaps.v10,
            itemCount: 10,
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: BottomAppBar(
              color: Colors.grey.shade50,
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size8,
                horizontal: Sizes.size16,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _editingController,
                      textInputAction: TextInputAction.send,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size16,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Send a message...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Sizes.size16),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.faceLaugh,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      cursorColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  Gaps.h16,
                  Container(
                    padding: const EdgeInsets.all(Sizes.size8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade400,
                    ),
                    child: IconButton(
                      onPressed: isLoading ? null : _onSendPress,
                      icon: FaIcon(isLoading
                          ? FontAwesomeIcons.hourglass
                          : FontAwesomeIcons.solidPaperPlane),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
