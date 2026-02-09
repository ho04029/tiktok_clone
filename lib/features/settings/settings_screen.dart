import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/common/widgets/video_configuration/video_config.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: Locale("es"),
      child: Scaffold(
        appBar: AppBar(title: Text("Settings")),
        body: ListView(
          children: [
            SwitchListTile(
              value: context.watch<VideoConfig>().isMuted,
              onChanged: (value) => context.read<VideoConfig>().toggleIsMuted(),
              title: Text("Auto Mute"),
              subtitle: Text("Videos muted by default"),
            ),
            SwitchListTile(
              value: _notifications,
              onChanged: _onNotificationsChanged,
              title: Text("Enable notifications"),
              subtitle: Text("Enable notifications"),
            ),
            CheckboxListTile(
              activeColor: Colors.black,
              value: _notifications,
              onChanged: _onNotificationsChanged,
              title: Text("Enable notifications"),
              subtitle: Text("Enable notifications"),
            ),
            ListTile(
              onTap:
                  () => showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1980),
                    lastDate: DateTime(2030),
                  ),
              title: Text("What is your birthday?"),
            ),
            ListTile(
              title: Text("Log out (iOS)"),
              textColor: Colors.red,
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder:
                      (context) => CupertinoAlertDialog(
                        title: Text("Are you sure?"),
                        content: Text("Plz dont go"),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              "No",
                              style: TextStyle(
                                color: CupertinoColors.activeBlue,
                              ),
                            ),
                          ),
                          CupertinoDialogAction(
                            onPressed: () => Navigator.of(context).pop(),
                            isDestructiveAction: true,
                            child: Text("Yes"),
                          ),
                        ],
                      ),
                );
              },
            ),
            ListTile(
              title: Text("Log out (AOS)"),
              textColor: Colors.red,
              onTap: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: Text("Are you sure?"),
                        content: Text("Plz dont go"),
                        actions: [
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: FaIcon(FontAwesomeIcons.car),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("Yes"),
                          ),
                        ],
                      ),
                );
              },
            ),
            ListTile(
              title: Text("Log out (iOS/Bottom)"),
              textColor: Colors.red,
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder:
                      (context) => CupertinoActionSheet(
                        title: Text("Are you sure?"),
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () {},
                            child: Text("Not log out"),
                          ),
                          CupertinoActionSheetAction(
                            isDefaultAction: true,
                            onPressed: () {},
                            child: Text("Yes plz"),
                          ),
                        ],
                      ),
                );
              },
            ),
            AboutListTile(),
          ],
        ),
      ),
    );
  }
}
