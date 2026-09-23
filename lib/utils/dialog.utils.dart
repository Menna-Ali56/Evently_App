


import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';

class DialogUtils{
  static void showLoading({required BuildContext context,required String loadingText}){
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            content: Row(

              mainAxisAlignment: .center,
              spacing: context.width*0.04,
              children: [
                CircularProgressIndicator(
                  color: AppColors.mainLightColor,
                ),
                Text(loadingText,
                style: AppStyles.semi16MainLightColor,)

              ],
            ),
          );

        },
    );

  }
  static void hideLoadong({required BuildContext context}){
    Navigator.pop(context);
  }

  static void showMessage({required BuildContext context,
    required String message,String? title='',String ? posActionName,String ? negActionName
    ,VoidCallback? posAction,VoidCallback? negAction
  }){
   List<Widget> actions=[];
   if(posActionName !=null){
     actions.add(
       TextButton(onPressed: (){
         Navigator.pop(context);
         posAction?.call();
       },
           child: Text(posActionName,
           style: AppStyles.semi14MainLightColor,))

     );
   }
   if(negActionName !=null){
     actions.add(
         TextButton(onPressed: (){
           Navigator.pop(context);
           negAction?.call();
         },
             child: Text(negActionName,
               style: AppStyles.semi14MainLightColor,))

     );
   }

    showDialog(context: context,
       builder: (context)=>AlertDialog(
         content: Text(message,
           style: AppStyles.semi16MainLightColor,

         ),
         title:Text(title!,
         style: AppStyles.regular14MainLightColor,) ,
         actions: actions,
       )

   );
  }
}