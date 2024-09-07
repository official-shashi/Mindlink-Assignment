import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';

class ImagePostView extends StatelessWidget {
  final PostController postController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imageCardPost(
            avatarUrl: 'assets/images/UserProfile.png',
            userName: 'Unique Wallpaper',
            userHandle: 'theuniquewallpaper',
            imageUrl: 'assets/images/Post-1.png',
            caption: "With precision and determination, Klay Thompson rises above the court, eyes locked on the hoop. His relentless focus and dedication have made him a key player on the Warriors' squad. Every shot he takes is a testament to hours of practice and a pursuit of greatness, as he continues to leave an unforgettable mark in the world of basketball.",
            onComment: () {},
            onRepost: () {},
            onLike: () {},
            onShare: () {},
          ),
          _imageCardPost(
          avatarUrl: 'assets/images/UserProfile.png',
            userName: 'Jujutsu Kaisen',
            userHandle: '@mobilewallpapernew',
            imageUrl: 'assets/images/Post-2.png',
            caption: "The evening sky lights up with colorful kites soaring high, a symbol of childhood freedom and joy. Laughter fills the air as children chase their dreams, running through the green fields of a peaceful village. It’s a nostalgic scene of simpler times, where adventure lived in the wind and the warmth of community brought everyone together.",
            onComment: () {},
            onRepost: () {},
            onLike: () {},
            onShare: () {},
          ),
          _imageCardPost(
           avatarUrl: 'assets/images/UserProfile.png',
            userName: 'Shashi Gupta',
            userHandle: '@official___Shashi',
            imageUrl: 'assets/images/Post-3.png',
            caption: "Just finished building a new feature in my #Flutter app! 🚀 #MobileDevelopment",
            onComment: () {},
            onRepost: () {},
            onLike: () {},
            onShare: () {},
          ),
          _imageCardPost(
           avatarUrl: 'assets/images/UserProfile.png',
            userName: 'Perfect Shots',
            userHandle: '@gifsavvy',
            imageUrl: 'assets/images/Post-4.png',
            caption: "With his signature red and black suit, Deadpool stands as a symbol of wit and unconventional heroism. His dark humor and unorthodox methods make him both feared and adored. He’s the mercenary with a mouth, ready to take on the world with a sarcastic quip and two katanas on his back, proving that not all heroes wear capes—some break the rules.",
            onComment: () {},
            onRepost: () {},
            onLike: () {},
            onShare: () {},
          ),
        ],
      ),
    );
  }

  Widget _imageCardPost({
    required String avatarUrl,
    required String userName,
    required String userHandle,
    required String imageUrl,
    required String caption,
    required VoidCallback onComment,
    required VoidCallback onRepost,
    required VoidCallback onLike,
    required VoidCallback onShare,
  }) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(avatarUrl),
                ),
                const Gap(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userName, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(userHandle, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _showFullScreenImage(imageUrl),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  caption,
                  style: const TextStyle(fontSize: 16),
                ),
                const Gap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: const Icon(Icons.comment_outlined), onPressed: onComment),
                    IconButton(icon: const Icon(Icons.repeat), onPressed: onRepost),
                    IconButton(icon: const Icon(Icons.favorite_border), onPressed: onLike),
                    IconButton(icon: const Icon(Icons.share), onPressed: onShare),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showFullScreenImage(String imageUrl) {
    Get.to(() => Scaffold(
      body: GestureDetector(
        onTap: () => Get.back(),
        child: Center(
          child: Hero(
            tag: imageUrl,
            child: Image.asset(imageUrl),
          ),
        ),
      ),
    ));
  }
}