import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("DirectMessages"),
        actions: [
          IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.plus)),
        ],
      ),
      body: AnimatedList(
        key: _key,
        padding: EdgeInsets.symmetric(vertical: Sizes.size10),
        itemBuilder: (context, index, animation) {
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              foregroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsv_pZL9XVHMiLKMnV89B1LauRL2t1nis-LeK96R_yOtlAjBF8s1LSpMJHVPoFFrq1wlg&usqp=CAU",
              ),
              child: Text("user"),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "another ($index)",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  "2: 16pm",
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: Sizes.size16,
                  ),
                ),
              ],
            ),
            subtitle: Text("don't forget to make video"),
          );
        },
      ),
    );
  }
}
