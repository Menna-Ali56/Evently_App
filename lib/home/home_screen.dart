import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.teal,
         title: Text(AppLocalizations.of(context)!.language),
       ),
      body: Column(
        crossAxisAlignment: .start,
        children: [
          Text(AppLocalizations.of(context)!.language),
          Container(
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(16),

              border: Border.all(
                color:Colors.teal
              )
            ),
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.english),
               Icon(Icons.arrow_back_ios_new_outlined)
              ],
            ),

          )
          
        ],
      ),
    );
  }
}
