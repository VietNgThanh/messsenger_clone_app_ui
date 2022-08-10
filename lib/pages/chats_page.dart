import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:messsenger_clone_app_ui/dummy/chats_list.dart';
import 'package:messsenger_clone_app_ui/dummy/friends_list.dart';
import 'package:messsenger_clone_app_ui/widgets/circle_img.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: _getAppBar(),
        ),
        body: _getBody(),
      ),
    );
  }

  Widget _getAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1513002749550-c59d786b8e6c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
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
                          '5',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15),
              const Text(
                'Chats',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(.2),
                ),
                child: const Center(
                  child: Icon(
                    Icons.camera_alt,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(.1),
                ),
                child: const Center(
                  child: Icon(
                    Ionicons.pencil,
                    size: 20,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _getBody() {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(seconds: 1));
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _getSearchBar(),
            _getFriendList(),
            _getChatsList(),
          ],
        ),
      ),
    );
  }

  Widget _getSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Ionicons.search,
                size: 20,
                color: Colors.grey,
              ),
              SizedBox(width: 15),
              Text(
                'Search',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getFriendList() {
    const circleAvatarSize = 75.0;
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: circleAvatarSize,
              child: Column(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Ionicons.videocam,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Create video call',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            ...List.generate(
              friendsList.length,
              (index) {
                return SizedBox(
                  width: circleAvatarSize,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleImg(
                        url: friendsList[index]['img']!,
                        lastSeen: 0,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        friendsList[index]['name']!,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _getChatsList() {
    return Column(
      children: List.generate(
        chatsList.length,
        (index) => _getChatTile(
          chatsList[index],
        ),
      ),
    );
  }

  Widget _getChatTile(Map<String, dynamic> chat) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Row(
        children: [
          CircleImg(
            url: chat['img'],
            lastSeen: chat['last_seen'],
          ),
          const SizedBox(width: 15),
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chat['name'],
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              chat['is_you']
                                  ? 'You: ${chat['last_message']}'
                                  : chat['last_message'],
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(' • ${chat['time']}'),
                        ],
                      ),
                    ],
                  ),
                ),
                chat['seen']
                    ? Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(chat['img']),
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
