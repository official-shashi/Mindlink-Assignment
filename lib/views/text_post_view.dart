import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';

class TextPostView extends StatelessWidget {
  final PostController postController = Get.find();

   TextPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textCardPost(
            avatarUrl: 'assets/images/UserProfile.png',
            userName: 'Shashi Gupta',
            userHandle: 'official___shashi',
            postContent: "Exploring the future of artificial intelligence and machine learning! These cutting-edge technologies are reshaping industries, driving innovation, and opening up new possibilities for businesses worldwide. 🚀 #AI #MachineLearning #TechInnovatio",
            onComment: () {},
            onRepost: () {},
            onLike: () {},
            onShare: () {
              
            },
          ),
           _textCardPost(
            avatarUrl: 'assets/images/UserProfile.png',
            userName: 'Shani Yadav',
            userHandle: '@its_shani',
            postContent: "Success doesn't come overnight, but with persistence, passion, and hard work, anything is possible. Stay focused on your goals and keep pushing forward. Your dreams are worth the effort! 💪✨ #Motivation #StayFocused #DreamBig",
            onComment: () {},
            onRepost: () {},
            onLike: () {},
            onShare: () {},
          ),
           _textCardPost(
             avatarUrl: 'assets/images/UserProfile.png',
            userName: 'Priyanka Bukam',
            userHandle: '@pari_21',
            postContent: "Adventure awaits! 🌍 Just returned from an unforgettable trip to the mountains, where every moment was filled with breathtaking views and serene landscapes. Ready for the next journey! 🏔️ #TravelDiaries #NatureLovers #Wanderlust",
            onComment: () {},
            onRepost: () {},
            onLike: () {},
            onShare: () {},
          ),
        ],
      ),
    );
  }

  Widget _textCardPost({
    required String avatarUrl,
    required String userName,
    required String userHandle,
    required String postContent,
    required VoidCallback onComment,
    required VoidCallback onRepost,
    required VoidCallback onLike,
    required VoidCallback onShare,
  }) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(10.0),
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
          Row(
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
          const Gap(10),
          Text(
            postContent,
            style: const TextStyle(fontSize: 16),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: const Icon(Icons.comment_outlined), onPressed: onComment),
              IconButton(icon: const Icon(Icons.repeat), onPressed: onRepost),
              IconButton(icon: const Icon(Icons.favorite_border), onPressed: onLike),
              IconButton(icon: const Icon(Icons.share), onPressed: onShare),
            ],
          )
        ],
      ),
    );
  }
}