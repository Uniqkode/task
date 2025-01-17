import '../constant/constant.dart';

class NavBarItem {
  final String icon;
  final String text;
  final String iconActive;
  NavBarItem({
    required this.text,
    required this.icon,
    required this.iconActive,
  });
}

List<NavBarItem> narBarItems = [
  NavBarItem(text: 'poker', icon: AppIcon.poker, iconActive: AppIcon.poker),
  NavBarItem(
      text: 'bonfire', icon: AppIcon.bonfire, iconActive: AppIcon.bonfire),
  NavBarItem(text: 'chat', icon: AppIcon.chat, iconActive: AppIcon.chat),
  NavBarItem(text: 'user', icon: AppIcon.user, iconActive: AppIcon.user),
];
