import 'dio_helper.dart';
import 'end_point.dart';

class Autharization {
  Future<bool> login(String emailAddress, String password) async {
    try {
      dynamic response = await DioHelper.login(
        url: EndPoint.login,
        data: {
          'email': emailAddress,
          'password': password,
        },
      );
      print(response);
      if (response.data['data']['Token'] != null) {
        print('\nResponse : ${response.data}');

        return true;
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
