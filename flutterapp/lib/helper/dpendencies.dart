import 'package:flutterapp/controller/cart_controller.dart';
import 'package:flutterapp/controller/popular_product_controller.dart';
import 'package:flutterapp/controller/recommended_product_controller.dart';
import 'package:flutterapp/data/api/apiClient.dart';
import 'package:flutterapp/data/repository/cart_repo.dart';
import 'package:flutterapp/data/repository/popular_product_repo.dart';
import 'package:flutterapp/data/repository/recommended_food_repo.dart';
import 'package:flutterapp/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(
    () => ApiClient(
      appBaseUrl: AppConstants.BASE_URL,
    ),
  );

  Get.lazyPut(
    () => PopularProductRepo(
      apiClient: Get.find(),
    ),
  );
  Get.lazyPut(
    () => RecommendedProductRepo(
      apiClient: Get.find(),
    ),
  );
  Get.lazyPut(
    () => CartRepo(),
  );

  Get.lazyPut(
    () => PopularProductController(
      popularProductRepo: Get.find(),
    ),
  );
  Get.lazyPut(
    () => RecommendedProductController(
      recommendedProductRepo: Get.find(),
    ),
  );
  Get.lazyPut(
    () => CartController(
      cartRepo: Get.find(),
    ),
  );
}
