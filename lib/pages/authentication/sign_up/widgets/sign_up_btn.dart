import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/user.dart';
import '../../../../provider/shared_preferences_provider.dart';
import '../../../../provider/user_provider.dart';
import '../../../../theme/app_colors.dart';
import '../../../home/home_page.dart';

class SignUpFormButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController passwordController;

  const SignUpFormButton(
      {Key? key,
      required this.formKey,
      required this.nameController,
      required this.passwordController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    var prefsData = Provider.of<SharedPreferencesProvider>(context);
    return TextButton(
      onPressed: () {
        prefsData.clearPreferences();
        if (formKey.currentState!.validate()) {
          var userId = UniqueKey().hashCode;
          user.addNewUser(User(
              id: userId,
              name: nameController.text,
              password: passwordController.text));
          prefsData.saveUserId(userId);
          prefsData.saveAuthValue(true);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        } else {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          const snackBar = SnackBar(content: Text("Заполните все поля"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        child: Text("Зарегистрироваться",
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
