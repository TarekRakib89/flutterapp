import 'package:flutterapp/controller/cart_controller.dart';
import 'package:flutterapp/data/repository/popular_product_repo.dart';
import 'package:flutterapp/models/product_models.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(
          Product.fromMap(response.body).products as Iterable<ProductModel>);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQunatity(_quantity + 1);
    } else {
      _quantity = checkQunatity(_quantity - 1);
    }
    update();
  }

  int checkQunatity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar("Item count", "You can't reduce more !"
          // backgroundColor:
          // colorText:
          );
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    //if (_quantity > 0) {
    _cart.addItems(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    update();
    // } else {
    //   Get.snackbar("Item count", "You should at least add an item in the cart!"
    //       // backgroundColor:
    //       // colorText:
    //       );
    //}
  }

  int get totalItems {
    return _cart.totalItems;
  }
}
