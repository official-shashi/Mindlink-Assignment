import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  Future<void> createDynamicLink({
    required String postId,
    required String postType,
  }) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      link: Uri.parse('https://example.com/posts/$postId?type=$postType'),
      uriPrefix: 'https://yourapp.page.link',
      androidParameters: AndroidParameters(
        packageName: 'com.example.yourapp',
        minimumVersion: 1,
      ),
      iosParameters: IOSParameters(
        bundleId: 'com.example.yourapp',
        minimumVersion: '1.0.1',
      ),
    );

    final Uri dynamicUrl = await FirebaseDynamicLinks.instance.buildLink(parameters);
    _shareLink(dynamicUrl.toString());
  }

  Future<void> shareText(String textContent) async {
    final String link = 'https://example.com/share?text=${Uri.encodeComponent(textContent)}';
    await Share.share(link);
  }

  Future<void> shareImage(String imageUrl) async {
    final String link = 'https://example.com/share?image=${Uri.encodeComponent(imageUrl)}';
    await Share.share(link);
  }

  Future<void> shareVideo(String videoUrl) async {
    final String link = 'https://example.com/share?video=${Uri.encodeComponent(videoUrl)}';
    await Share.share(link);
  }

  void _shareLink(String link) async {
    await Share.share(link);
  }
}
