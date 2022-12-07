import 'package:flames/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserChatOverviewWidget extends StatelessWidget {
  final String profilePicUrl;
  final String userName;
  final String lastMssg;
  final int unReadMssg;
  final bool isVerified;
  final bool isTyping;
  final bool isUnread;
  final DateTime lastActive;
  const UserChatOverviewWidget(
      {super.key,
      required this.profilePicUrl,
      required this.userName,
      required this.lastMssg,
      required this.unReadMssg,
      required this.isVerified,
      required this.isUnread,
      required this.isTyping,
      required this.lastActive});

  @override
  Widget build(BuildContext context) {
    final TextTheme _txtTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(profilePicUrl,
                      alignment: Alignment.topCenter,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      userName,
                      style: (isUnread)
                          ? _txtTheme.bodyMedium!.copyWith(color: Colors.black)
                          : _txtTheme.bodyMedium,
                    ),
                    const SizedBox(width: 10),
                    if (isVerified)
                      const Icon(Icons.verified,
                          size: 16, color: Color(0xff4D72F4)),
                  ],
                ),
                (isTyping)
                    ? Text(
                        'Typing...',
                        style: _txtTheme.bodySmall!.copyWith(
                            color: kThemeColor, fontStyle: FontStyle.italic),
                      )
                    : Text(
                        lastMssg,
                        style: (isUnread)
                            ? _txtTheme.bodySmall!
                                .copyWith(color: const Color(0xff050505))
                            : _txtTheme.bodySmall,
                      ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                DateFormat.Hm().format(DateTime.now()).toString(),
                style: (isUnread)
                    ? _txtTheme.labelSmall
                    : _txtTheme.labelSmall!
                        .copyWith(color: const Color(0xff818181)),
              ),
              (isUnread)
                  ? CircleAvatar(
                      radius: 8,
                      backgroundColor: const Color(0xffFF5F8F),
                      child: (unReadMssg > 9)
                          ? Text(
                              '9+',
                              style: _txtTheme.labelSmall!
                                  .copyWith(color: Colors.white),
                            )
                          : Text(
                              unReadMssg.toString(),
                              style: _txtTheme.labelSmall!
                                  .copyWith(color: Colors.white),
                            ),
                    )
                  : const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}

class RecentUserCards extends StatelessWidget {
  final String userName;
  final String userPicUrl;
  final bool isVerified;
  final int likes;
  final bool isLikeCard;
  const RecentUserCards({
    Key? key,
    required this.userName,
    required this.userPicUrl,
    required this.isVerified,
    required this.likes,
    this.isLikeCard = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _txtTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SizedBox(
            height: 110,
            width: 85,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    userPicUrl,
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 85,
                  ),
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    userName,
                    style: _txtTheme.labelSmall,
                  ),
                  const SizedBox(width: 5),
                  if (isVerified)
                    const Icon(Icons.verified,
                        size: 10, color: Color(0xff4D72F4))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  final String userPicUrl;
  const ChatPage({super.key, required this.userPicUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 30,
              child: Image.network(
                userPicUrl,
                fit: BoxFit.fill,
                height: 50,
                width: 50,
              ),
            ),
            const Text('Puzzels'),
            const Icon(Icons.menu)
          ],
        )
      ],
    );
  }
}
