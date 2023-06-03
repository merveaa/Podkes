import 'package:flutter/material.dart';
import 'package:podkes/language/colors.dart';
import 'package:podkes/language/lang.dart';
import 'package:podkes/screens/home_screen.dart';

import '../widgets/image_widgets.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final double customWidgetContainerWidth = 300; // Set the desired width
  final double customWidgetContainerHeight = 300; // Set the desired height

  @override
  Widget build(BuildContext context) {
    CustomWidget customWidget = CustomWidget(
      containerWidth: customWidgetContainerWidth,
      containerHeight: customWidgetContainerHeight,
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          ProjectKeys.playScreenTitle,
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 45, right: 45),
        child: Column(children: [
          customWidget.buildContainerColumn(
              ProjectColors().podcast1BGColor,
              PodcastNames.podcast1,
              Podcasters.podcaster1,
              ProjectImages().podcaster1photo,
              () {}),
          const SizedBox(
            height: 40,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Image.asset(ProjectImages().foooPhoto)),
          const SizedBox(height: 20),
          Image.asset(ProjectImages().fooo2Photo),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(ProjectImages().skipbackPhoto),
                iconSize: 45,
              ),
              IconButton(
                onPressed: () {},
                iconSize: 65,
                icon: Image.asset(ProjectImages().playiconPhoto),
              ),
              IconButton(
                onPressed: () {},
                iconSize: 45,
                icon: Image.asset(ProjectImages().skipfwdPhoto),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
