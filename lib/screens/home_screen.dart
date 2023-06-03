import 'package:flutter/material.dart';
import 'package:podkes/language/lang.dart';
import 'package:podkes/screens/play_screen.dart';
import 'package:podkes/widgets/icon_widgets.dart';
import 'package:podkes/widgets/image_widgets.dart';

import '../language/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void handleCategoryTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            ProjectIcons().menuIcon,
            width: 25,
            height: 25,
            alignment: const Alignment(0.4, 0),
          ),
        ),
        title: const Text(
          ProjectKeys.projectTitle,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              ProjectIcons().notificationIcon,
              width: 33,
              height: 33,
              alignment: Alignment.centerLeft,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Column(
          children: [
            searchBox(),
            SlidingCategoryBar(
              categories: const [
                ProjectKeys.category1,
                ProjectKeys.category2,
                ProjectKeys.category3,
                ProjectKeys.category4
              ],
              currentIndex: currentIndex,
              onTap: handleCategoryTap,
            ),
            if (currentIndex == 0) ...[
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ProjectKeys.homeScreenTitle,
                    style: TextStyle(
                      fontSize: 25,
                      color: ProjectColors().mainTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              CustomWidget(),
            ],
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        currentIndex: currentIndex,
        onItemTapped: handleCategoryTap,
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  final double containerWidth;
  final double containerHeight;

  CustomWidget({this.containerWidth = 155, this.containerHeight = 155});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildContainerColumn(
                  ProjectColors().podcast1BGColor,
                  PodcastNames.podcast1,
                  Podcasters.podcaster1,
                  ProjectImages().podcaster1photo, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlayScreen()),
                );
              }),
              SizedBox(width: 25),
              buildContainerColumn(
                  ProjectColors().podcast2BGColor,
                  PodcastNames.podcast2,
                  Podcasters.podcaster2,
                  ProjectImages().podcaster2photo,
                  () {}),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildContainerColumn(
                  ProjectColors().podcast3BGColor,
                  PodcastNames.podcast3,
                  Podcasters.podcaster3,
                  ProjectImages().podcaster3photo,
                  () {}),
              SizedBox(width: 25),
              buildContainerColumn(
                  ProjectColors().podcast4BGColor,
                  PodcastNames.podcast4,
                  Podcasters.podcaster4,
                  ProjectImages().podcaster4photo,
                  () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildContainerColumn(Color color, String title, String author,
      String logo, VoidCallback? onPressed) {
    return Column(
      children: [
        buildContainer(color, logo, onPressed),
        SizedBox(
          height: 13,
        ),
        buildInfoContainer(title, author),
      ],
    );
  }

  Widget buildContainer(Color color, String logo, VoidCallback? onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: color,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: containerWidth + 15, // Adjust width as needed
                  height: containerHeight - 30, // Adjust height as needed
                  child: Image.asset(
                    logo,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoContainer(String title, String podcaster) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: containerWidth - 2,
          height: containerWidth / 5,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: containerWidth / 13,
              fontFamily: "Inter",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: containerWidth / 29),
        SizedBox(
          width: containerWidth / 2, // Adjust width as needed
          height: 17,
          child: Text(
            podcaster,
            style: TextStyle(
              color: Color(0xffcccccc),
              fontSize: containerWidth / 16,
              fontFamily: "Inter",
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class NavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const NavigationBar({
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: ProjectColors().selectedIconColor,
      unselectedItemColor: ProjectColors().unselectedIconColor,
      backgroundColor: ProjectColors().bottomnavbarBGColor,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Image.asset(
              ProjectIcons().discoverIcon,
              color: _getIconColor(0),
            ),
            onPressed: () {
              onItemTapped(0);
            },
          ),
          label: IconLables.discover,
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Image.asset(
              ProjectIcons().libraryIcon,
              color: _getIconColor(1),
            ),
            onPressed: () {
              onItemTapped(1);
            },
          ),
          label: IconLables.lib,
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Image.asset(
              ProjectIcons().userIcon,
              color: _getIconColor(2),
            ),
            onPressed: () {
              onItemTapped(2);
            },
          ),
          label: IconLables.profile,
        ),
      ],
      selectedLabelStyle: TextStyle(
        color: ProjectColors().selectedIconColor,
      ),
      unselectedLabelStyle: TextStyle(
        color: ProjectColors().unselectedIconColor,
      ),
    );
  }

  Color _getIconColor(int index) {
    return currentIndex == index
        ? ProjectColors().selectedIconColor
        : ProjectColors().unselectedIconColor;
  }
}

class SlidingCategoryBar extends StatelessWidget {
  final List<String> categories;
  final int currentIndex;
  final Function(int) onTap;

  const SlidingCategoryBar({
    required this.categories,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15) + EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: ProjectColors().categoriesColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ClipOval(
                  child: Center(
                    child: Text(
                      '        ${categories[index]}       ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: index == currentIndex
                            ? ProjectColors().selectedCategoryColor
                            : ProjectColors().unselectedCategoriesColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget searchBox() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      width: 700,
      height: 50,
      decoration: BoxDecoration(
        color: ProjectColors().searchBGColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8) +
            const EdgeInsets.only(left: 13),
        child: TextField(
          decoration: InputDecoration(
            hintText: ProjectKeys.search,
            hintStyle: TextStyle(
                fontSize: 15, color: ProjectColors().searchItemsColor),
            suffixIcon: Image.asset(
              ProjectIcons().searchIcon,
              width: 35,
              height: 35,
            ),
            prefixIconConstraints: const BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    ),
  );
}
