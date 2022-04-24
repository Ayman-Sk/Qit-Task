import 'dio_helper.dart';
import 'end_point.dart';

class CategoriesRepository {
  Future<dynamic> getAllCategories() async {
    try {
      dynamic response =
          await DioHelper.getCategories(url: EndPoint.categories);
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
