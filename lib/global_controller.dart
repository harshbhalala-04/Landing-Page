import 'package:get/get.dart';
import 'package:gmlandingpage/model/usermodel.dart';

class GlobalController extends GetxController {
  final currentUser = UserModel().obs;
  void fetchUser(Map<String, dynamic> userMap) {
    currentUser.value = UserModel.fromJson(userMap);
  }
}