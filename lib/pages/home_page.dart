import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:messsenger_clone_app_ui/pages/chats_page.dart';
import 'package:messsenger_clone_app_ui/pages/people_page.dart';
import 'package:messsenger_clone_app_ui/pages/stories_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: pageIndex,
          children: const [
            ChatsPage(),
            PeoplePage(),
            StoriesPage(),
          ],
        ),
        bottomNavigationBar: _myBottomBar(),
      ),
    );
  }

  Widget _myBottomBar() {
    final bottomBarItems = [
      _bottomBarButton(
        icon: Ionicons.chatbubble,
        text: 'Chats',
        isSelected: pageIndex == 0,
        onTap: () {
          setState(() {
            pageIndex = 0;
          });
        },
      ),
      _bottomBarButton(
        icon: Ionicons.people,
        text: 'People',
        isSelected: pageIndex == 1,
        onTap: () {
          setState(() {
            pageIndex = 1;
          });
        },
      ),
      _bottomBarButton(
        icon: MaterialIcons.amp_stories,
        text: 'Stories',
        isSelected: pageIndex == 2,
        onTap: () {
          setState(() {
            pageIndex = 2;
          });
        },
      ),
    ];
    return SizedBox(
      height: 65,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: bottomBarItems,
      ),
    );
  }

  Widget _bottomBarButton({
    required IconData icon,
    required String text,
    bool isSelected = false,
    Function()? onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        radius: 100,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  children: [
                    Icon(
                      icon,
                      size: 26,
                      color: isSelected ? Colors.blue : Colors.grey[400],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 14,
                        color: isSelected ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              text == 'Chats'
                  ? Positioned(
                      right: 45,
                      top: 0,
                      child: Container(
                        height: 16,
                        width: 16,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 0,
                              spreadRadius: 3,
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
