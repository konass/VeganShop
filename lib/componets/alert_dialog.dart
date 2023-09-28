import 'package:flutter/material.dart';

import '../pages/authentication/welcome/welcome_page.dart';

void userAlertDialog(
    BuildContext context, String title, String subTitle) async {
  await showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text('$title'),
      content: Text('$subTitle'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => WelcomePage())),
          child: const Text('Да'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'Нет'),
          child: const Text('Нет'),
        ),
      ],
    ),
  );
}
