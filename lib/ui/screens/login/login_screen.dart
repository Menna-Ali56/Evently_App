import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/dialog.utils.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';



class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   var emailController=TextEditingController();

   var passwordController=TextEditingController();

   var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width=context.width;
    var height=context.height;
    var themeProvider=Provider.of<AppThemeProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Padding(

          padding:  EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.02
          ),
          child: SingleChildScrollView(
            child: Form(

              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: height * 0.02,
                children: [
                  Image.asset(
                      themeProvider.isDark?
                      AppAssets.logoDarkImage:
                      AppAssets.logoLightImage,
                    width: width * 0.3,
                  ),

                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                        AppLocalizations.of(context)!.login_to_your_account,
                    style: Theme.of(context).textTheme.headlineSmall),
                  ),
                  CustomTextField(
                      borderColor: Theme.of(context).dividerColor,
                     filled: true,
                    controller: emailController,
                    KeyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please Enter an email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(emailController.text)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    fillColor: themeProvider.isDark?AppColors.darkInputColor:AppColors.whiteColor,
                    hintText: AppLocalizations.of(context)!.email,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    prefixIcon: Icon(Icons.email_outlined,color: AppColors.lightGreyColor,),
                  ),
                  CustomTextField(
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
                    borderColor: Theme.of(context).dividerColor,
                    filled: true,
                    fillColor: themeProvider.isDark?AppColors.darkInputColor:AppColors.whiteColor,
                    hintText: AppLocalizations.of(context)!.password,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    prefixIcon: Icon(Icons.lock_outlined,color: AppColors.lightGreyColor,),
                    suffixIcon: Icon(Icons.visibility_off_outlined,color: AppColors.lightGreyColor,),

                  ),
                   TextButton(
                       onPressed: (){
                         //todo:Navigation to forget Password
                       },
                       child: Align(
                         alignment: AlignmentDirectional.centerEnd,
                         child: Text(
                           AppLocalizations.of(context)!.forgetpassword,
                           style: Theme.of(context).textTheme.labelLarge?.copyWith(
                             decoration: TextDecoration.underline,
                             decorationThickness: 1,
                             decorationColor: Theme.of(context).cardColor,
                           ) ,
                         ),
                       )
                     ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      onPressed:login,
                      verticalPadding: height*0.01,

                      backgroundColor: Theme.of(context).cardColor,
                      child: Text(
                        AppLocalizations.of(context)!.login,
                        style: AppStyles.medium20white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(

                        AppLocalizations.of(context)!.dont_have_an_account,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),

                      TextButton(
                          onPressed: (){
                            //todo:Navigation to register screen
                            Navigator.of(context).pushNamed(AppRoutes.registerRouteName);
                          },
                          child: Align(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              AppLocalizations.of(context)!.signup,
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                decoration: TextDecoration.underline,
                                decorationThickness: 1,
                                decorationColor: Theme.of(context).cardColor,
                              ) ,
                            ),
                          )
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Theme.of(context).dividerColor,
                          indent: width*0.01,
                          endIndent: width*0.04,
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
                          indent: width*0.01,
                          endIndent: width*0.04,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      onPressed: (){
                        //todo: Logon with google
                      },
                      verticalPadding: height*0.02,
                      borderColor: Theme.of(context).dividerColor,

                      backgroundColor: themeProvider.isDark?AppColors.darkInputColor :AppColors.whiteColor,
                      child: Row(
                        mainAxisAlignment: .center,
                        spacing: width*0.04,
                        children: [
                          Image.asset(AppAssets.googleLogoImage),
                          Text(
                            AppLocalizations.of(context)!.login_with_google,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  ),


              ],),
            ),
          ),
        ),
      ),
    );
  }

  Future<void>  login() async {
     if (formKey.currentState!.validate() == true) {

       try {
         //todo: show loadding
         DialogUtils.showLoading(context: context, loadingText: 'Loading....');
         final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
             email: emailController.text,
             password: passwordController.text,
         );

         //todo: hide loading
         DialogUtils.hideLoadong(context: context);

         // todo: show message
         DialogUtils.showMessage(context: context,
             message: 'Login Successfully.',
           title: 'Success',posActionName: 'OK',posAction: (){
           Navigator.of(context).pushNamed(AppRoutes.homeRouteName);
             });


       } on FirebaseAuthException catch (e) {

         if (e.code == 'invalid-credential') {
           //todo: hide loading
           DialogUtils.hideLoadong(context: context);
           // todo: show message>> error
           DialogUtils.showMessage(context: context,
               message: 'The Supplied auth Credential is in correct',
               title: 'Error',posActionName: 'OK');
         }
       }catch(e){
         //todo: hide loading
         DialogUtils.hideLoadong(context: context);
         // todo: show message>> error
         DialogUtils.showMessage(context: context,
             message: e.toString(),
             title: 'Error',posActionName: 'OK');
         print(e.toString());
       }
     }
   }
}
