import 'package:get/get.dart';
import '../../view/post_screen/post_screen.dart';

class RouteHelper {
  static const String postScreen ='/post_screen';


 static List<GetPage> route = [
   GetPage(name: postScreen, page:()=> const PostScreen())
  ];
}