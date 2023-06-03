import 'package:flutter/material.dart';

class ProjectImages {
  final String splashGirl = "assets/png/splash.png";
  final String podcaster1photo = "assets/png/purple.png";
  final String podcaster2photo = "assets/png/blue.png";
  final String podcaster3photo = "assets/png/orange.png";
  final String podcaster4photo = "assets/png/yellow.png";
  final String foooPhoto = "assets/png/fooo.png";
  final String fooo2Photo = "assets/png/fooo2.png";
  final String playPhoto = "assets/png/play.png";
}

class RoundedImage extends StatelessWidget {
  final String imagePath;

  const RoundedImage({Key? key, required this.imagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(95), topRight: Radius.circular(95)),
      child: Image.asset(
        imagePath,
      ),
    );
  }
}
