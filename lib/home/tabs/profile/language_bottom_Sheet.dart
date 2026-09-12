import 'package:evently_app/providers/app_language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<String>(
            title: const Text('English'),
            value: 'en',
            groupValue: languageProvider.appLanguage,
            onChanged: (value) {
              languageProvider.changeLanguage(value!);
              Navigator.pop(context);
            },
          ),

          RadioListTile<String>(
            title: const Text('العربية'),
            value: 'ar',
            groupValue: languageProvider.appLanguage,
            onChanged: (value) {
              languageProvider.changeLanguage(value!);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}