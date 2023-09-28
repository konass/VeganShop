import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/shared_preferences_provider.dart';
import '../../../../theme/app_colors.dart';
import '../../welcome/welcome_page.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prefsData = Provider.of<SharedPreferencesProvider>(context);
    return TextButton(
      onPressed: () {
        prefsData.clearPreferences();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomePage()));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        child: Text("Выйти",
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold)),
      ),
      style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          foregroundColor: Colors.white,
          elevation: 2,
          backgroundColor: AppColors.primaryColor),
    );
  }
}
