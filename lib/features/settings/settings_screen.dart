import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        children: [
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
                            style: TextStyle(color: CupertinoColors.activeBlue),
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
          AboutListTile(),
        ],
      ),
    );
  }
}
