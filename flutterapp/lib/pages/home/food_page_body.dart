import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Widgets/big_text.dart';
import 'package:flutterapp/Widgets/icon_text_widget.dart';
import 'package:flutterapp/Widgets/small_text.dart';
import 'package:flutterapp/controller/popular_product_controller.dart';
import 'package:flutterapp/controller/recommended_product_controller.dart';
import 'package:flutterapp/models/product_models.dart';
import 'package:flutterapp/routes/route_helper.dart';
import 'package:flutterapp/utils/app_constants.dart';
import 'package:get/get.dart';

import '../../Widgets/app_column.dart';
import '../../apps_color.dart';
import '../../constant.dart';

class MyFoodPageBody extends StatefulWidget {
  const MyFoodPageBody({super.key});

  @override
  State<MyFoodPageBody> createState() => _MyFoodPageBodyState();
}

class _MyFoodPageBodyState extends State<MyFoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFacto = 0.8;
  double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GetBuilder<PopularProductController>(
        builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  height: 320,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.length,
                      scrollBehavior: MyCustomScrollBehavior(),
                      itemBuilder: (context, possition) {
                        return _buildPageItem(possition,
                            popularProducts.popularProductList[possition]);
                      }),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        },
      ),
      GetBuilder<PopularProductController>(builder: (popularProducts) {
        return DotsIndicator(
          dotsCount: popularProducts.popularProductList.isEmpty
              ? 1
              : popularProducts.popularProductList.length,
          position: _currentPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        );
      }),
      const SizedBox(
        height: 30,
      ),
      Container(
        margin: const EdgeInsets.only(left: 30),
        child: Row(
          children: [
            BigText(text: "Recommended"),
            const SizedBox(
              width: 10,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 3),
              child: BigText(
                text: ".",
                color: Colors.black26,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: SmallText(
                text: "Food pairing",
              ),
            ),
          ],
        ),
      ),
      GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
        return recommendedProduct.isLoaded
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: recommendedProduct.recommendedProductList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(RouterHelper.getRecommendedFood(index));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(AppConstants.BASE_URL +
                                    AppConstants.UPLOAD_URL +
                                    recommendedProduct
                                        .recommendedProductList[index].img!),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 100,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding:const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigText(
                                        text: recommendedProduct
                                            .recommendedProductList[index]
                                            .name!),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SmallText(
                                        text: "With chinese characteristics"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children:  [
                                        IconText(
                                            icon: Icons.circle_sharp,
                                            text: "Normal",
                                            color: Colors.black,
                                            iconColor: Colors.yellowAccent),
                                        IconText(
                                            icon: Icons.location_on,
                                            text: "Normal",
                                            color: Colors.black,
                                            iconColor: Colors.yellowAccent),
                                        IconText(
                                            icon: Icons.access_time,
                                            text: "Normal",
                                            color: Colors.black,
                                            iconColor: Colors.yellowAccent),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
            : CircularProgressIndicator(color: AppColors.mainColor);
      })
    ]);
  }

  Widget _buildPageItem(
    int index,
    ProductModel popularProdut,
  ) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFacto);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFacto + (_currentPageValue - index + 1) * (1 - _scaleFacto);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFacto);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - currScale) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(RouterHelper.getPopularFood(index));
          },
          child: Container(
            height: 200,
            margin: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(AppConstants.BASE_URL +
                    AppConstants.UPLOAD_URL +
                    popularProdut.img!),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 120,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 20),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: AppColumn(
                  text: popularProdut.name!,
                ),
              )),
        ),
      ]),
    );
  }
}
