import 'package:flutter/material.dart';
import 'package:podkes/language/lang.dart';
import 'package:podkes/widgets/icon_widgets.dart';

import '../language/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
              fontFamily: 'Roboto', fontSize: 20, fontWeight: FontWeight.bold),
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
        padding: const EdgeInsets.only(top: 11.0),
        child: Column(
          children: [
            searchBox(),
            SlidingCategoryBar(
              categories: ['All', 'Life', 'Comedy', 'Tech'],
              currentIndex: currentIndex,
              onTap: handleCategoryTap,
            ),
            //if (currentIndex == 0) Text('Content for Category 1'),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color _getIconColor(int index) {
    return _selectedIndex == index
        ? ProjectColors().selectedIconColor
        : ProjectColors().unselectedIconColor;
  }

  Color _getLabelColor(int index) {
    return _selectedIndex == index
        ? ProjectColors().selectedIconColor
        : ProjectColors().unselectedIconColor;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: ProjectColors().selectedIconColor,
      unselectedItemColor: ProjectColors().unselectedIconColor,
      backgroundColor: ProjectColors().bottomnavbarBGColor,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Image.asset(
              ProjectIcons().discoverIcon,
              color: _getIconColor(0),
            ),
            onPressed: () {
              setState(() {
                _selectedIndex = 0;
              });
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
              setState(() {
                _selectedIndex = 1;
              });
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
              setState(() {
                _selectedIndex = 2;
              });
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
}

class SlidingCategoryBar extends StatelessWidget {
  final List<String> categories;
  final int currentIndex;
  final Function(int) onTap;

  SlidingCategoryBar({
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
      height: 60,
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
