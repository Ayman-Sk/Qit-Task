import 'dio_helper.dart';
import 'end_point.dart';

class ProductsRepository {
  Future<dynamic> getAllCategoryProducts(String? category) async {
    try {
      dynamic response = await DioHelper.getCategoryProducts(
          url: EndPoint.getProducts(category));
      print(response);
      if (response.data != null) {
        print('\nResponse : ${response.data}');

        return response.data;
      } else {
        print('Error in Login');
        return false;
      }
    } catch (e) {
      print('Login error is $e');
      return Future.value(false);
    }
  }
}
