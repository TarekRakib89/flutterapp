import 'package:flutter/material.dart';
import 'package:flutterapp/controller/popular_product_controller.dart';
import 'package:flutterapp/controller/recommended_product_controller.dart';
import 'package:flutterapp/routes/route_helper.dart';
import 'package:get/get.dart';

import 'pages/home/main_food_page.dart';
import 'helper/dpendencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const MainFoodPage(),
        initialRoute: RouterHelper.initial,
        getPages: RouterHelper.routes);
  }
}
