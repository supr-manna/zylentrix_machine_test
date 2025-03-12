import '../../core/utills/CustomSnackbar.dart';
import '../../core/utills/url_container.dart';
import '../model/post_response.dart';
import '../services/api_service.dart';

class PostRepository {
  APIClient mClient;

  PostRepository({ required this.mClient});

  Future<List<PostResponse>> getPosts(int uid) async {
    Map<String, dynamic> map = {"store_uid": uid};

    String url = '${UrlContainer.baseurl}${UrlContainer.getPost}';
    List<PostResponse> response = await mClient.request(url, 'get', map);

    if(response.isNotEmpty) {
      print('List: ${response.length}');
      CustomSnackbar.showCustomSnackbar(message: 'Data Successfully Fetched', isError: false);
      return response;
    } else {
      CustomSnackbar.showCustomSnackbar(message: 'An Unknown error occurred', isError: true);
      return response;
    }
  }
}