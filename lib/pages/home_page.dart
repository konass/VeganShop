import 'package:flutter/material.dart';
import 'package:task_online_shop/componets/tabs_items.dart';
import 'package:task_online_shop/model/category.dart';
import 'package:task_online_shop/pages/product_page.dart';
import '../theme/app_colors.dart';

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
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: loadCategoriesFromJson(),
            //  body: Center(
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              } else if (snapshot.hasData) {
                var categoryList = snapshot.data as List<ProductCategory>;
                return DefaultTabController(
                  length: categoryList.length,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 25, top: 27, right: 30),
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
                                padding: EdgeInsets.only(top: 40),
                                child: Text('Plant world',
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: AppColors.textColor,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Vegan online store',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.textColor,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                          color: AppColors.primaryColor,
                          width: double.infinity,
                          child: TabBar(
                              indicatorColor: Colors.grey,
                              isScrollable: true,
                              tabs: createTabs(categoryList),
                              onTap: (index) {})),
                      Expanded(
                        child: TabBarView(
                            children: createTabs(categoryList)
                                .map((category) =>
                                    ProductPage(category: category.category))
                                .toList()),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
