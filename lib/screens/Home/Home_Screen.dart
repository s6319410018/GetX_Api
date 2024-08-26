import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../controllers/GetX_controller.dart';
import '../Detail/Detail_Screen.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  Future<void> _refreshData() async {
    final UserController controller = Get.find<UserController>();
    await controller.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(title: const Text('GetX User List')),
      body: Obx(() {
        return RefreshIndicator(
          onRefresh: _refreshData,
          child: controller.isLoading.value
              ? ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          radius: 20,
                        ),
                        title: Container(
                          color: Colors.grey.shade300,
                          height: 16.0,
                          width: double.infinity,
                        ),
                        subtitle: Container(
                          color: Colors.grey.shade300,
                          height: 14.0,
                          width: 150.0,
                        ),
                      ),
                    );
                  },
                )
              : controller.users.isEmpty
                  ? const Center(child: Text('No users found'))
                  : ListView.builder(
                      itemCount: controller.users.length,
                      itemBuilder: (context, index) {
                        final user = controller.users[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => DetailPage(user: user));
                          },
                          child: ListTile(
                            title: Text(user.name),
                            subtitle: Text(user.email),
                          ),
                        );
                      },
                    ),
        );
      }),
    );
  }
}
