import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class Avatar extends ConsumerWidget {
  final String name;

  const Avatar(this.name, {super.key});

  Future<void> _onAvatarTap() async {
    final xfile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 40,
        maxHeight: 150,
        maxWidth: 150);

    if (xfile != null) {
      final file = File(xfile.path);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: _onAvatarTap,
      child: CircleAvatar(
        radius: 50,
        foregroundColor: Colors.blue,
        foregroundImage: NetworkImage(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsv_pZL9XVHMiLKMnV89B1LauRL2t1nis-LeK96R_yOtlAjBF8s1LSpMJHVPoFFrq1wlg&usqp=CAU",
        ),
        child: Text(name),
      ),
    );
  }
}
