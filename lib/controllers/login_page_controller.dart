import 'package:get/get.dart';

import '../api_service.dart';

import '../screens/home_screen.dart';


class LoginController {


  void login(String email, String password) async {
    await ApiService()
        .login(
        email: email,
        password: password)
        .then((result) {
      result.fold((left) {
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text(left.message)));
        Get.snackbar('Failure', left.message);
      }, (right) {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => HomeScreen(right)));
        Get.off(() => HomeScreen(right));
      });
    });
  }

  void register(String email, String password) async {
    await ApiService()
        .register(
        email: email,
        password: password)
        .then((result) {
      result.fold((left) {
        // ScaffoldMessenger.of(context)
        // .showSnackBar(SnackBar(content: Text(left.message)));
        Get.snackbar('Failure', left.message);
      }, (right) {
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        // content: Center(child: Text('Registration Successful! \n id: ${right[0]}, token: ${right[1]}'))));
        Get.snackbar(
            'Registration Successful', 'id: ${right[0]}, token: ${right[1]}');
      });
    });
  }
}