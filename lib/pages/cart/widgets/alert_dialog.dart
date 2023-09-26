import 'package:flutter/material.dart';

import '../../authentication/welcome/welcome_page.dart';

void cartAlertDialog(BuildContext context) async {
  await showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Для данного действия необходимо авторизоваться'),
      content: const Text('Пройти регистрацию/войти?'),
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
