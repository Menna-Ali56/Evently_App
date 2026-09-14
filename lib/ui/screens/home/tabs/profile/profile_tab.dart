
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/ui/screens/home/tabs/profile/widgets/profile_item.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'language_bottom_Sheet.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.04,
      ),
      child: SafeArea(
        child: Column(
          spacing: height * 0.02,

          crossAxisAlignment: .center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(AppAssets.logoRouteImage),
            ),
            Text("Menna Ali", style: Theme.of(context).textTheme.headlineLarge),
            Text(
              "Route@gmail.com",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            ProfileItemWidget(
              text: AppLocalizations.of(context)!.dark,
              item: Switch(
                activeThumbColor: AppColors.whiteColor,
                inactiveThumbColor: AppColors.whiteColor,
                activeTrackColor: AppColors.mainDarkColor,
                inactiveTrackColor: AppColors.lightGreyColor,
                trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((
                  Set<WidgetState> states,
                ) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.transparentColor;
                  }
                  return AppColors.whiteColor;
                }),
                value: themeProvider.isDark,
                onChanged: (value) {
                  themeProvider.changeTheme(
                    value ? ThemeMode.dark : ThemeMode.light,
                  );
                },
              ),
            ),
            ProfileItemWidget(
              text: AppLocalizations.of(context)!.language,
              item: IconButton(
                onPressed: () {
                  showLanguageBottomSheet();
                },
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 25,
                  color: AppColors.mainLightColor,
                ),
              ),
            ),
            ProfileItemWidget(
              text: AppLocalizations.of(context)!.logout,
              item: IconButton(
                onPressed: () {},
                icon: Icon(Icons.logout, size: 25, color: AppColors.redColor),
              ),
            ),
          ],
        ),
      ),
    );

  }

  void showLanguageBottomSheet(){
    showModalBottomSheet(context: context,
        builder: (context)=>LanguageBottomSheet(),);
  }
}
