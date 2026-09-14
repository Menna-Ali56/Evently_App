import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/size_utils.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_routes.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var themeProvider = Provider.of<AppThemeProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: height * 0.02,
            children: [
              Image.asset(
                themeProvider.isDark
                    ? AppAssets.logoDarkImage
                    : AppAssets.logoLightImage,
                width: width * 0.3,
              ),

              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  AppLocalizations.of(context)!.create_your_account,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              CustomTextField(
                borderColor: Theme.of(context).dividerColor,
                filled: true,
                fillColor: themeProvider.isDark
                    ? AppColors.darkInputColor
                    : AppColors.whiteColor,
                hintText: AppLocalizations.of(context)!.name,
                hintStyle: Theme.of(context).textTheme.bodyLarge,
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                  color: AppColors.lightGreyColor,
                ),
              ),
              CustomTextField(
                borderColor: Theme.of(context).dividerColor,
                filled: true,
                fillColor: themeProvider.isDark
                    ? AppColors.darkInputColor
                    : AppColors.whiteColor,
                hintText: AppLocalizations.of(context)!.email,
                hintStyle: Theme.of(context).textTheme.bodyLarge,
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: AppColors.lightGreyColor,
                ),
              ),
              CustomTextField(
                borderColor: Theme.of(context).dividerColor,
                filled: true,
                fillColor: themeProvider.isDark
                    ? AppColors.darkInputColor
                    : AppColors.whiteColor,
                hintText: AppLocalizations.of(context)!.password,
                hintStyle: Theme.of(context).textTheme.bodyLarge,
                prefixIcon: Icon(
                  Icons.lock_outlined,
                  color: AppColors.lightGreyColor,
                ),
                suffixIcon: Icon(
                  Icons.visibility_off_outlined,
                  color: AppColors.lightGreyColor,
                ),
              ),
              CustomTextField(
                borderColor: Theme.of(context).dividerColor,
                filled: true,
                fillColor: themeProvider.isDark
                    ? AppColors.darkInputColor
                    : AppColors.whiteColor,
                hintText: AppLocalizations.of(context)!.confirm_password,
                hintStyle: Theme.of(context).textTheme.bodyLarge,
                prefixIcon: Icon(
                  Icons.lock_outlined,
                  color: AppColors.lightGreyColor,
                ),
                suffixIcon: Icon(
                  Icons.visibility_off_outlined,
                  color: AppColors.lightGreyColor,
                ),
              ),
              SizedBox(height: height * 0.02,),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onPressed: signUp,
                  verticalPadding: height * 0.01,

                  backgroundColor: Theme.of(context).cardColor,
                  child: Text(
                    AppLocalizations.of(context)!.signup,
                    style: AppStyles.medium20white,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.already_have_an_account,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  TextButton(
                    onPressed: () {
                      //todo:Navigation to Login screen
                      Navigator.of(context).pushNamed(AppRoutes.loginRouteName);
                    },
                    child: Align(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        AppLocalizations.of(context)!.login,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          decoration: TextDecoration.underline,
                          decorationThickness: 1,
                          decorationColor: Theme.of(context).cardColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: Theme.of(context).dividerColor,
                      indent: width * 0.01,
                      endIndent: width * 0.04,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.or,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: Theme.of(context).dividerColor,
                      indent: width * 0.01,
                      endIndent: width * 0.04,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onPressed: () {
                    //todo: Sign Up With google
                  },
                  verticalPadding: height * 0.02,
                  borderColor: Theme.of(context).dividerColor,

                  backgroundColor: themeProvider.isDark
                      ? AppColors.darkInputColor
                      : AppColors.whiteColor,
                  child: Row(
                    mainAxisAlignment: .center,
                    spacing: width * 0.04,
                    children: [
                      Image.asset(AppAssets.googleLogoImage),
                      Text(
                        AppLocalizations.of(context)!.sign_up_with_google,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUp() {}
}
