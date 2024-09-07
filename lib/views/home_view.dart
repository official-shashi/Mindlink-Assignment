import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import 'text_post_view.dart';
import 'video_post_view.dart';
import 'image_post_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.secondaryColor,
      
      body: SafeArea(
        child: Obx(() {
          switch (controller.selectedIndex.value) {
            case 1:
              return VideoPostView();
            case 2:
              return ImagePostView();
            default:
              return TextPostView();
          }
        }),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          backgroundColor: ColorsValue.primaryColor,
          selectedItemColor: ColorsValue.textLightColor,
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTabIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.text_fields), label: 'Text'),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library), label: 'Video'),
            BottomNavigationBarItem(
                icon: Icon(Icons.image), label: 'Image'),
          ],
        );
      }),
    );
  }
}
