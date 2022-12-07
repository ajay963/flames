import 'package:flames/controller/nav_controller.dart';
import 'package:flames/models/user_data.dart';
import 'package:flames/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'widgets/chats_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.put(NavController());
    final List<Widget> appList = [
      const Center(
        child: Text('Home'),
      ),
      const Center(
        child: Text('Community'),
      ),
      const Center(
        child: Text('calender'),
      ),
      const ChatScreen(),
    ];

    return GetMaterialApp(
        title: 'Flames',
        theme: Themeing.lightTheme,
        home: SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xffFFF6FA),
            bottomNavigationBar: Obx(
              (() {
                return BottomNavigationBar(
                    onTap: (value) => navController.changeIndex(idx: value),
                    currentIndex: navController.getCurrIndex,
                    elevation: 12,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(
                          Iconsax.home,
                          size: 28,
                          color: (navController.getCurrIndex == 0)
                              ? kThemeColor
                              : Colors.black,
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Iconsax.global_search,
                          size: 28,
                          color: (navController.getCurrIndex == 1)
                              ? kThemeColor
                              : Colors.black,
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Iconsax.calendar_edit,
                          size: 28,
                          color: (navController.getCurrIndex == 2)
                              ? kThemeColor
                              : Colors.black,
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Iconsax.messages_3,
                          size: 28,
                          color: (navController.getCurrIndex == 3)
                              ? kThemeColor
                              : Colors.black,
                        ),
                        label: '',
                      ),
                    ]);
              }),
            ),
            body: Obx((() {
              return appList[navController.getCurrIndex];
            })),
          ),
        ));
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme _txtTheme = Theme.of(context).textTheme;
    final _userData = UserChatData().userChatDataList;
    final _recentUsers = UserChatData().friendsProfileList;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            const SizedBox(height: 250),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      image1Url5,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                      child: Text(
                    'Puzzels',
                    style: _txtTheme.bodyMedium!.copyWith(color: kThemeColor),
                  )),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      Iconsax.setting_4,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 110,
              width: double.infinity,
              child: ListView.builder(
                itemCount: _recentUsers.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return RecentUserCards(
                    isVerified: _recentUsers[index].isVerified,
                    likes: _recentUsers[index].likes,
                    userPicUrl: _recentUsers[index].userPicUrl,
                    userName: _recentUsers[index].userName,
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: SearchBox(),
            ),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: _userData.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return UserChatOverviewWidget(
                        profilePicUrl: _userData[index].profilePicUrl,
                        userName: _userData[index].userName,
                        lastMssg: _userData[index].lastMssg,
                        unReadMssg: _userData[index].unReadMssg,
                        isVerified: _userData[index].isVerified,
                        isUnread: (_userData[index].unReadMssg != 0),
                        isTyping: _userData[index].isTyping,
                        lastActive: _userData[index].lastActive);
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      height: 45,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(50, 0, 0, 0),
              offset: Offset(0, 1),
              blurRadius: 4,
            )
          ]),
      child: const TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search_rounded,
              size: 20,
            ),
            border: InputBorder.none,
            labelText: 'Search',
            hintText: ''),
      ),
    );
  }
}
