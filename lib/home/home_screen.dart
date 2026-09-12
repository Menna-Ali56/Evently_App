import 'package:evently_app/home/tabs/profile/profile_tab.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // appBar: AppBar(
       //   backgroundColor: Colors.teal,
       //   title: Text(AppLocalizations.of(context)!.language),
       // ),
      body: profileTab(),
      // Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(AppLocalizations.of(context)!.language),
      //       InkWell(
      //         onTap: () {
      //           showLanguageBottomSheet( );
      //           // Handle tap event
      //         },
      //         child: Container(
      //           decoration:BoxDecoration(
      //             borderRadius: BorderRadius.circular(16),
      //
      //             border: Border.all(
      //               color:Colors.teal
      //             )
      //           ),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text(AppLocalizations.of(context)!.english),
      //               Icon(Icons.arrow_back_ios_new_outlined)
      //             ],
      //           ),
      //
      //         ),
      //       )
      //
      //     ],
      //   ),
      // ),
    );
  }

  void showLanguageBottomSheet(){
    showModalBottomSheet(context: context, builder: (BuildContext context) {
      return Container(
        height: 200,
        child: Column(
          children: [
            ListTile(
              title: Text(AppLocalizations.of(context)!.english),
              onTap: () {
                // Handle tap event
              },
            ),
          ],
        ),
      );
    });
  }
  void showThemeBottomSheet(){}
}
