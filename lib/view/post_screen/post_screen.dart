import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zylentrix_machine_test/data/controller/post_controller.dart';
import 'package:zylentrix_machine_test/data/repository/post_repository.dart';
import 'package:zylentrix_machine_test/data/services/api_service.dart';

import '../../data/model/post_response.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  @override
  void initState() {
    Get.put(APIClient());
    Get.put(PostRepository(mClient: Get.find()));
    Get.put(PostController(postRepo: Get.find()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("Posts"), centerTitle: true, backgroundColor: Colors.white),
        body: RefreshIndicator(
            onRefresh: () async {
              controller.getPost();
            },
            child: Obx(() {
          if(controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.posts.isEmpty) {
            return const Center(
              child: Text(
                "No posts available",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54),
              ),
            );
          }
          return Obx(() => ListView.builder(
            itemCount: controller.posts.length,
            itemBuilder: (context, index) {
              PostResponse item = PostResponse();
              if(controller.posts.isNotEmpty) {
                item = controller.posts[index];
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        spreadRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title ?? 'Title',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      Text(item.body ?? 'Description',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
          );
        }))
      );
    });
  }
}
