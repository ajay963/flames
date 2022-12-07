import 'package:flames/models/user_overview.dart';

const String image1Url1 =
    'https://i.pinimg.com/736x/50/12/ec/5012ecfdfb7814dcc772f004896cb06a.jpg';
const String image1Url2 =
    'https://i.pinimg.com/564x/03/f8/7e/03f87e39882d90c9b3155d93ff1e03db.jpg';
const String image1Url3 =
    'https://i.pinimg.com/564x/ff/6f/d4/ff6fd489f1531bb24b950c9c4a074d88.jpg';
const String image1Url4 =
    'https://i.pinimg.com/564x/26/ba/53/26ba535e958fc0a036c907f945cebd30.jpg';
const String image1Url5 =
    'https://i.pinimg.com/564x/1b/a4/61/1ba461fd2d88660103a23c32037cb249.jpg';

class UserChatData {
  List<UserChatOverview> userChatDataList = [
    UserChatOverview(
        profilePicUrl: image1Url1,
        userName: 'Tina',
        lastMssg: 'iS any plan ??',
        unReadMssg: 8,
        isVerified: true,
        isTyping: false,
        lastActive: DateTime.now()),
    UserChatOverview(
        profilePicUrl: image1Url2,
        userName: 'Same',
        lastMssg: 'we are coming today',
        unReadMssg: 0,
        isVerified: true,
        isTyping: false,
        lastActive: DateTime.now()),
    UserChatOverview(
        profilePicUrl: image1Url3,
        userName: 'jeNNy',
        lastMssg: 'congratulations ...',
        unReadMssg: 2,
        isVerified: false,
        isTyping: true,
        lastActive: DateTime.now()),
    UserChatOverview(
        profilePicUrl: image1Url4,
        userName: 'jimmy',
        lastMssg: 'thats great',
        unReadMssg: 0,
        isVerified: true,
        isTyping: true,
        lastActive: DateTime.now()),
  ];
  List<FriendsProfiles> friendsProfileList = [
    FriendsProfiles(
        userName: 'jeNNy',
        userPicUrl: image1Url3,
        isVerified: false,
        likes: 3,
        isLikeCard: false),
    FriendsProfiles(
        userName: 'jimmy',
        userPicUrl: image1Url4,
        isVerified: true,
        likes: 3,
        isLikeCard: false),
    FriendsProfiles(
        userName: 'Same',
        userPicUrl: image1Url2,
        isVerified: true,
        likes: 0,
        isLikeCard: true)
  ];
}
