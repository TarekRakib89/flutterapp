import 'package:flutterapp/data/repository/recommended_food_repo.dart';
import 'package:flutterapp/models/product_models.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<ProductModel> _popularProductList = [];
  List<ProductModel> get recommendedProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(
          Product.fromMap(response.body).products as Iterable<ProductModel>);
      _isLoaded = true;
      update();
    } else {}
  }
}
