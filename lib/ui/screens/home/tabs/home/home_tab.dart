
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/ui/screens/home/tabs/home/tab_item_widget.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/app_theme_provider.dart';
import '../../../../../utils/app_colors.dart' show AppColors;
import 'event_item_widget.dart';



class HomeTab extends StatefulWidget {
 HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    List<String> eventsNameList=[
AppLocalizations.of(context)!.all,
AppLocalizations.of(context)!.sport,
AppLocalizations.of(context)!.birthday,
AppLocalizations.of(context)!.bookclub,
AppLocalizations.of(context)!.meeting,
AppLocalizations.of(context)!.exhibition
    ];
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.04,
        ),
        child: DefaultTabController(
          length: eventsNameList.length,
          child: Column(
            spacing: height * 0.02,
            children: [
              Row(
                spacing: width * 0.04,
                children: [
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.welcome_back,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'Route Academy',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    themeProvider.isDark
                        ? Icons.brightness_2_outlined
                        : Icons.light_mode_outlined,
                    color: Theme.of(context).cardColor,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.01,
                      horizontal: width * 0.02,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      languageProvider.appLanguage.toUpperCase(),
                      style: AppStyles.semi14white,
                    ),
                  ),
                ],
              ),
              TabBar(
                isScrollable: true,
                  onTap: (index) {

                      selectedIndex = index;
                      setState(() {

                      });

                  },
                  dividerColor: AppColors.transparentColor,
                  indicatorColor:AppColors.transparentColor ,
                  labelPadding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  tabAlignment: .start,
                  tabs: [

                for (var eventName in eventsNameList)
                  TabItemWidget(

                    isSelected: selectedIndex == eventsNameList.indexOf(eventName),
                    eventName: eventName,
                  )
              ]),
              Expanded(child: ListView.separated(
                  itemBuilder: (context, index) {
                    return EventItemWidget();
                  },
                  separatorBuilder: (context,index){
                    return SizedBox(height: height*0.02,);
                  },
                  itemCount: 20
              ))
            ],
          ),
        ),
      ),
    );
  }
}
