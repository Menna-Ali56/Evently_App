
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/ui/screens/home/tabs/favorite/favorite_tab.dart';
import 'package:evently_app/ui/screens/home/tabs/home/home_tab.dart';
import 'package:evently_app/ui/screens/home/tabs/profile/profile_tab.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabList = [HomeTab(), FavoriteTab(), ProfileTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          _builtBottomNavigationBarItem(
            selectedIcon: Icon(Icons.home),
            unSelectedIcon: Icon(Icons.home_outlined),
            label: AppLocalizations.of(context)!.home,
            isSelected: selectedIndex == 0,
          ),
          _builtBottomNavigationBarItem(
            selectedIcon: Icon(Icons.favorite),
            unSelectedIcon: Icon(Icons.favorite_border),
            label: AppLocalizations.of(context)!.favorite,
            isSelected: selectedIndex == 1,
          ),
          _builtBottomNavigationBarItem(
            selectedIcon: Icon(Icons.person),
            unSelectedIcon: Icon(Icons.person_outline),
            label: AppLocalizations.of(context)!.profile,
            isSelected: selectedIndex == 2,
          ),
        ],
      ),
      body: tabList[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //todo:navigation to events
          Navigator.of(context).pushNamed(AppRoutes.addEventRouteName);
        },
        child: Icon(Icons.add,color:AppColors.whiteColor,size: 25,),
      ),
    );
  }

  BottomNavigationBarItem _builtBottomNavigationBarItem({
    required Widget selectedIcon,
    required Widget unSelectedIcon,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: isSelected ? selectedIcon : unSelectedIcon,
      label: label,
    );
  }
}
