import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../provider/shared_preferences_provider.dart';
import '../../../../provider/user_provider.dart';
import '../../../../theme/app_colors.dart';
import '../../../home/home_page.dart';

class SignInFormButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController passwordController;

  const SignInFormButton(
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
        user
            .getUser(nameController.text, passwordController.text)
            .then((value) {
          if (value != null) {
            prefsData.saveUserId(value.id);
            prefsData.saveAuthValue(true);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          } else {
            prefsData.saveAuthValue(false);
            prefsData.saveUserId(-1);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            const snackBar =
                SnackBar(content: Text("Имя или пароль введены неверно"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        });
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        child: Text("Войти",
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
