import 'package:get/get.dart';
import 'package:zylentrix_machine_test/data/model/post_response.dart';
import 'package:zylentrix_machine_test/data/repository/post_repository.dart';

class PostController extends GetxController {
  PostRepository postRepo;

  PostController({required this.postRepo});

  var isLoading = false.obs;
  var posts = <PostResponse>[].obs;

  @override
  void onInit() {
    getPost();
    super.onInit();
  }

  void getPost() async {
    try {
      isLoading.value = true;
      List<PostResponse> response = await postRepo.getPosts(120);
      if (response.isNotEmpty) {
        posts.addAll(response);
      }
    } catch (ex) {
      print('Exception: $ex');
    } finally {
      isLoading.value = false;
    }
  }
}
