import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Dark Mode',
            style: Theme.of(context).textTheme.headlineMedium,
          ),

          Switch(
            value: themeProvider.isDark,
            onChanged: (value) {
              themeProvider.changeTheme(
                value ? ThemeMode.dark : ThemeMode.light,
              );
            },
            activeThumbColor: AppColors.whiteColor,
            inactiveThumbColor: AppColors.whiteColor,
            activeTrackColor: AppColors.mainDarkColor,
            inactiveTrackColor: AppColors.lightGreyColor,
          ),
        ],
      ),
    );
  }
}