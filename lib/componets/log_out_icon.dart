import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task_online_shop/provider/shared_preferences_provider.dart';

import '../pages/authentication/welcome/welcome_page.dart';

class LogOutIcon extends StatelessWidget {
  const LogOutIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prefsData = Provider.of<SharedPreferencesProvider>(context);
    return IconButton(
      icon: SvgPicture.asset('assets/log_out.svg'),
      onPressed: () {
        prefsData.clearPreferences();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomePage()));
      },
    );
  }
}
