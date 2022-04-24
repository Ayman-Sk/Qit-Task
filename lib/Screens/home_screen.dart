import 'package:flutter/material.dart';

import 'package:task_for_qit/Api/categories_repository.dart';
import 'package:task_for_qit/Api/products_repository.dart';
import 'package:task_for_qit/Models/product.dart';
import 'package:task_for_qit/Theme/app_colors.dart';
import 'package:task_for_qit/Widgets/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = 'HomeScreenRoute';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // late final _tabController;
  List<Product> products = [];
  final CategoriesRepository _categoriesRepository = CategoriesRepository();
  final ProductsRepository _productsRepository = ProductsRepository();
  int index = 0;
  bool wait = true;
  bool isLoading = true;
  List<String> categories = [];
  List<Tab> _tabs = [];

  List<Widget> _views = [];
  @override
  void initState() {
    super.initState();
    // getData();
    _categoriesRepository.getAllCategories().then((value) {
      print(value);
      value.forEach((element) {
        categories.add(element);
      });
      setState(() {
        wait = false;
        isLoading = false;
      });
    });
  }

  Widget _buildView() {
    return ListView.builder(itemBuilder: (context, index) {
      Product product = products[index];
      return ListTile(
        title: Text(product.title.toString()),
      );
    });
  }

  Future<void> getData() async {
    await _categoriesRepository.getAllCategories().then((value) {
      setState(() {
        _tabs = [];
        _views = [];
        value.forEach((element) async {
          _tabs.add(Tab(text: element));
          final res = await _productsRepository.getAllCategoryProducts(element);
          print(res);

          res.forEach((element) {
            products.add(Product.fromJson(element));
          });
          _views.add(_buildView());
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: Drawer(),
      appBar:
          AppBar(backgroundColor: AppColors.background, elevation: 0, actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined))
      ]),
      body: Column(
        children: [
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : Container(
                  color: AppColors.background,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 20,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: ((context, index) {
                        return _buildCategoryItem(categories[index], index);
                      })),
                ),
          wait
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : FutureBuilder(
                  future: _productsRepository
                      .getAllCategoryProducts(categories[index]),
                  builder: ((context, AsyncSnapshot snapshot) {
                    print('innnnnnnn');
                    if (!snapshot.hasData) {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      print(snapshot.data);
                      products = [];
                      snapshot.data.forEach((element) {
                        products.add(Product.fromJson(element));
                      });
                      return Expanded(
                        child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 5,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: products.length,
                            itemBuilder: (BuildContext ctx, index) {
                              Product product = products[index];
                              return ProductItem(
                                  title: product.title,
                                  price: product.price,
                                  averageRate: product.rating!.rate,
                                  imagePath: product.image);
                            }),
                      );
                    }
                    return Container();
                  }))
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String text, int textIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          index = textIndex;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        child: Text(
          text,
          style: TextStyle(
            color: index == textIndex ? Colors.white : Colors.grey,
            fontSize: 14,
            fontWeight:
                index == textIndex ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
