import 'package:flutter/material.dart';

void showSuccessSnackBar(
    {required BuildContext context,
    required String message,
    String? iconPath}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(child: Text(message)),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
