import 'package:flutter/material.dart';
import 'package:task_online_shop/componets/tabs_items.dart';
import 'package:task_online_shop/model/category.dart';
import 'package:task_online_shop/pages/home/widgets/drop_down_button.dart';
import 'package:task_online_shop/pages/home/widgets/logo_widget.dart';
import 'package:task_online_shop/pages/home/widgets/product_page.dart';
import '../../theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                      LogoWidget(),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: DropDownButton(),
                      ),
                      const SizedBox(
                        height: 5,
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
