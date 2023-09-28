import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task_online_shop/componets/getUserIdFunction.dart';
import 'package:task_online_shop/pages/authentication/log_out/widgets/log_out_btn.dart';
import 'package:task_online_shop/pages/home/home_page.dart';

import '../../../provider/shared_preferences_provider.dart';
import '../../../provider/user_provider.dart';
import '../../../theme/app_colors.dart';

class LogOutPage extends StatelessWidget {
  const LogOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    var prefsData = Provider.of<SharedPreferencesProvider>(context);
    int userId = getUserId(prefsData);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: SvgPicture.asset('assets/arrow_back_circle.svg'),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }),
      ),
      body: FutureBuilder(
          future: user.getCurrentUserById(userId),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error} "));
            } else if (snapshot.hasData) {
              var userName = snapshot.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: EdgeInsets.only(right: 30.0, left: 30.0),
                    child: Text('Вы вошли как: $userName . Желаете выйти?',
                        style: TextStyle(
                            fontSize: 24,
                            color: AppColors.textColor,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold)),

                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  LogOutButton()
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
