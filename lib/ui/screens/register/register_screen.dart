import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/dialog.utils.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var rePasswordController = TextEditingController();

  var nameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

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
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                    controller: nameController,

                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please Enter Name';
                      }

                      return null;
                    },
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
                    controller: emailController,
                    KeyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please Enter an email';
                      }
                      if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(emailController.text)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
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
                    controller: passwordController,
                    obscureText: true,
                    validator: (password) {
                      if (password == null || password.trim().isEmpty) {
                        return 'Please Enter a Password';
                      }
                      if (password.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
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
                    controller: rePasswordController,
                    obscureText: true,
                    validator: (rePassword) {
                      if (rePassword == null || rePassword.trim().isEmpty) {
                        return 'Please Enter a Password';
                      }
                      if (rePassword != passwordController.text ) {
                        return "Re-Password doesn't match password.";
                      }
                      return null;
                    },
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
                  SizedBox(height: height * 0.02),
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      onPressed: register,
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
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.loginRouteName);
                        },
                        child: Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            AppLocalizations.of(context)!.login,
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
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
        ),
      ),
    );
  }

  void register() async{
    if (formKey.currentState?.validate()==true){
      try {
        //todo: show loadding
        DialogUtils.showLoading(context: context, loadingText: 'Loading....');
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        //todo: hide loading
        DialogUtils.hideLoadong(context: context);


        // todo: show message
        DialogUtils.showMessage(context: context,
            message: 'Register Successfully.',
            title: 'Success',posActionName: 'OK',posAction: (){
              Navigator.of(context).pushNamed(AppRoutes.homeRouteName);
            });

      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          //todo: hide loading
          DialogUtils.hideLoadong(context: context);
          // todo: show message>> error
          DialogUtils.showMessage(context: context,
              message: 'The Password provoded is too weak',
              title: 'Error',posActionName: 'OK');


        } else if (e.code == 'email-already-in-use') {

          //todo: hide loading
          DialogUtils.hideLoadong(context: context);
          // todo: show message>> error
          DialogUtils.showMessage(context: context,
              message:'The account already exists for that email.' ,
              title: 'Error',posActionName: 'OK');


        }
      } catch (e) {
        //todo: hide loading
        DialogUtils.hideLoadong(context: context);
        // todo: show message>> error
        DialogUtils.showMessage(context: context,
            message: e.toString(),
            title: 'Error',posActionName: 'OK');

      }
    }
  }
}
