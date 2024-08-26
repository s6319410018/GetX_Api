import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import '../models/user_model.dart';
import '../services/service.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  RxList users = <User>[].obs;
  final Services _services = Services();

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  Future<void> fetchUsers() async {
    isLoading.value = true;
    try {
      users.value = await _services.fetchUsers();
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
