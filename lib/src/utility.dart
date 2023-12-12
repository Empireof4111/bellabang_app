import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

// void showSnackBar(BuildContext context, String text) {
//   GlobalKey<ScaffoldMessengerState>();

//   ScaffoldMessenger.(BuildContext context) {
//     assert(context != null);
//     assert(debugCheckHasScaffoldMessenger(context));

//     final _ScaffoldMessengerScope scope =
//         context.dependOnInheritedWidgetOfExactType<_ScaffoldMessengerScope>()!;
//     return scope._scaffoldMessengerState;
//   }(context).showSnackBar(
//     SnackBar(
//       content: Text(text),
//     ),
//   );
// }

Future<List<File>> pickImage() async {
  List<File> images = [];

  try {
    var files = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: true);
    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}

// based URL
String basedUrl ="https://service.phopis.com/bellabanga";

//IMAGE FILE URL
String imageUrl = "https://sauki-storage.s3.amazonaws.com/pictures/";