import 'package:flutter/material.dart';
import 'package:podkes/language/lang.dart';
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
        leading: Image.asset(
          ProjectIcons().menuIcon,
          width: 7,
          height: 7,
          alignment: const Alignment(0.4, 0),
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
                ProjectImages().podcaster1photo,
              ),
              SizedBox(width: 25),
              buildContainerColumn(
                ProjectColors().podcast2BGColor,
                PodcastNames.podcast2,
                Podcasters.podcaster2,
                ProjectImages().podcaster2photo,
              ),
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
              ),
              SizedBox(width: 25),
              buildContainerColumn(
                ProjectColors().podcast4BGColor,
                PodcastNames.podcast4,
                Podcasters.podcaster4,
                ProjectImages().podcaster4photo,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildContainerColumn(
      Color color, String title, String author, String logo) {
    return Column(
      children: [
        buildContainer(color, logo),
        SizedBox(
          height: 13,
        ),
        buildInfoContainer(title, author),
      ],
    );
  }

  Widget buildContainer(Color color, String logo) {
    return Column(
      children: [
        Container(
          width: 155, //kutu boyut
          height: 155,
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
                    width: 170,
                    height: 135,
                    child: Image.asset(
                      logo,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildInfoContainer(String title, String podcaster) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 158,
          height: 34,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: "Inter",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 4),
        SizedBox(
          width: 74,
          height: 17,
          child: Text(
            podcaster,
            style: TextStyle(
              color: Color(0xffcccccc),
              fontSize: 10,
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
