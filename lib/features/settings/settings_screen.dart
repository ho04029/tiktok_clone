import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/video/view_models/playback_config_vm.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Localizations.override(
      context: context,
      locale: Locale("es"),
      child: Scaffold(
        appBar: AppBar(title: Text("Settings")),
        body: ListView(
          children: [
            SwitchListTile(
              value: ref.watch(playbackConfigProvider).muted,
              onChanged:
                  (value) => {
                    ref.read(playbackConfigProvider.notifier).setMuted(value),
                  },
              title: Text("Mute Video"),
              subtitle: Text("Video will be muted by default"),
            ),
            SwitchListTile(
              value: ref.watch(playbackConfigProvider).autoplay,
              onChanged:
                  (value) => {
                    ref
                        .read(playbackConfigProvider.notifier)
                        .setAutoplay(value),
                  },
              title: Text("Autoplay"),
              subtitle: Text("Video will start playing automatically"),
            ),
            SwitchListTile(
              value: false,
              onChanged: (value) {},
              title: Text("Enable notifications"),
              subtitle: Text("Enable notifications"),
            ),
            CheckboxListTile(
              activeColor: Colors.black,
              value: false,
              onChanged: (value) {},
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
