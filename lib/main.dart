import 'package:flames/models/user_data.dart';
import 'package:flames/themes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'widgets/chats_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flames',
      theme: Themeing.lightTheme,
      home: const SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffFFF6FA),
          body: Home(),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme _txtTheme = Theme.of(context).textTheme;
    final _userData = UserChatData().userChatDataList;
    final _recentUsers = UserChatData().friendsProfileList;
    return Column(
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
          height: 150,
          width: double.infinity,
          child: ListView.builder(
            itemCount: _recentUsers.length,
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
            hintText: 'search your friends'),
      ),
    );
  }
}
