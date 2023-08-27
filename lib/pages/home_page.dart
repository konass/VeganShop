import 'package:flutter/material.dart';
import 'package:task_online_shop/componets/tabs_items.dart';
import '../theme/AppColors.dart';
import 'Tab/dairy_product_tab.dart';
import 'Tab/meat_tab.dart';
import 'Tab/sweetness_tab.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
@override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: tabsItems.length,
      child: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children:[
           Row(
          children: [
        Padding(
        padding : EdgeInsets.only(left: 25, top: 27, right: 30),
            child: Image.asset(
              'assets/vegan_logo.jpg',
              width: 81,
              height: 78,
            ),
        ),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top:40),
                  child: Text(
                      'Plant world',
                      style: TextStyle(
                          fontSize: 24,
                          color: AppColors.textColor,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                    'Vegan online store',
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textColor,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal
                    )
                ),
              ],
            ),
          ],
        ),
            const SizedBox(height: 24,),
            Container(
              color: AppColors.primaryColor,
               width: double.infinity,
           child:  TabBar(
             indicatorColor: Colors.grey,
             isScrollable: true,
             tabs: tabsItems,
             onTap: (index){
             },
           )
            ),
            Expanded(
              child: TabBarView(
                children: [
                  DairyProductsTab(),
                  MeatTab(),
                  SweetnessTab(),
                ],
        ),
            ),
        ], ),
    ),
      ),
    );
  }
}
