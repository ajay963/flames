class UserChatOverview {
  final String profilePicUrl;
  final String userName;
  final String lastMssg;
  final int unReadMssg;
  final bool isVerified;
  final bool isTyping;

  final DateTime lastActive;
  UserChatOverview({
    required this.profilePicUrl,
    required this.userName,
    required this.lastMssg,
    required this.unReadMssg,
    required this.isVerified,
    required this.isTyping,
    required this.lastActive,
  });
}

class FriendsProfiles {
  final String userName;
  final String userPicUrl;
  final bool isVerified;
  final int likes;
  final bool isLikeCard;
  FriendsProfiles({
    required this.userName,
    required this.userPicUrl,
    required this.isVerified,
    required this.likes,
    required this.isLikeCard,
  });
}
