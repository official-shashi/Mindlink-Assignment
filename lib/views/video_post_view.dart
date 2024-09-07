import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../controllers/post_controller.dart';

class VideoPostView extends StatelessWidget {
  final PostController postController = Get.find();

  VideoPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _videoCardPost(
            avatarUrl: 'assets/images/UserProfile.png',
            userName: 'Monu Gupta',
            userHandle: '@Monu_1290',
            videoUrl: 'assets/videos/video-2.mp4',
            caption:
                "Just finished building a new feature in my #Flutter app! 🚀 #MobileDevelopment",
            onComment: () {},
            onRepost: () {},
            onLike: () {},
            onShare: () {},
          ),
          _videoCardPost(
            avatarUrl: 'assets/images/UserProfile.png',
            userName: 'Prashant Basnet',
            userHandle: '@prashant_basnet',
            videoUrl: 'assets/videos/video-4.mp4',
            caption:
                "Moon >>>",
            onComment: () {},
            onRepost: () {},
            onLike: () {},
            onShare: () {},
          ),
          _videoCardPost(
            avatarUrl: 'assets/images/UserProfile.png',
            userName: 'Akansha Singh',
            userHandle: '@ankasha_12',
            videoUrl: 'assets/videos/video-5.mp4',
            caption:
                "Late night drive >>>",
            onComment: () {},
            onRepost: () {},
            onLike: () {},
            onShare: () {},
          ),
        ],
      ),
    );
  }

  Widget _videoCardPost({
    required String avatarUrl,
    required String userName,
    required String userHandle,
    required String videoUrl,
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
                    Text(userName,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(userHandle,
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          AutoPlayVideoPlayerWidget(videoAssetPath: videoUrl),
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
                    IconButton(
                        icon: const Icon(Icons.comment_outlined),
                        onPressed: onComment),
                    IconButton(
                        icon: const Icon(Icons.repeat), onPressed: onRepost),
                    IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: onLike),
                    IconButton(
                        icon: const Icon(Icons.share), onPressed: onShare),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AutoPlayVideoPlayerWidget extends StatefulWidget {
  final String videoAssetPath;

  const AutoPlayVideoPlayerWidget({super.key, required this.videoAssetPath});

  @override
  _AutoPlayVideoPlayerWidgetState createState() =>
      _AutoPlayVideoPlayerWidgetState();
}

class _AutoPlayVideoPlayerWidgetState extends State<AutoPlayVideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isMuted = true; 

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  void _initializePlayer() {
    _controller = VideoPlayerController.asset(widget.videoAssetPath);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {});
      _controller.setLooping(true);
      _controller.play();
      _controller.setVolume(_isMuted ? 0.0 : 1.0); 
    }).catchError((error) {
      debugPrint("Error initializing video: $error");
      if (error is PlatformException) {
        debugPrint("PlatformException details: ${error.message}");
      }
    });
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0.0 : 1.0);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.videoAssetPath),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction == 0) {
          _controller.pause(); // Pause when not visible
        } else {
          _controller.play(); // Play when visible
        }
      },
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              alignment: Alignment.bottomRight,
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                IconButton(
                  icon: Icon(
                    _isMuted ? Icons.volume_off : Icons.volume_up,
                    color: Colors.white,
                  ),
                  onPressed: _toggleMute,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
                child: Text("Error loading video: ${snapshot.error}"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
