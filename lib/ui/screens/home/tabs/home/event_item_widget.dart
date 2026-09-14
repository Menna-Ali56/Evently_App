import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/app_assets.dart';



class EventItemWidget extends StatelessWidget {
  const EventItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Container(
      height: height * 0.25,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.01
      ),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color: Theme.of(context).dividerColor
        ),
          image: DecorationImage(
            fit: BoxFit.fill,
              image: AssetImage(
                  AppAssets.birthdayLightImage))
      ),
      child:Column(
        mainAxisAlignment: .spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:EdgeInsets.symmetric(
              horizontal: width * 0.02,
              vertical: height*0.01
            ) ,
            decoration: BoxDecoration(
              color: Theme.of(context).highlightColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 2,
                color: Theme.of(context).dividerColor
              )
            ),
            child: Text("21 Jan",style: Theme.of(context).textTheme.bodyMedium,),
          ),
          Container(
            padding:EdgeInsets.symmetric(
                horizontal: width * 0.02,

            ) ,
            decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    width: 2,
                    color: Theme.of(context).dividerColor
                )
            ),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("This is a Birthday Party ",style: Theme.of(context).textTheme.bodySmall,),
                Spacer(),
               IconButton(onPressed: (){
                 // todo:Add favorite event
               }, icon: Icon(Icons.favorite_border_outlined),
               color: Theme.of(context).cardColor,)
              ],
            ),
          ),
        ],
      ) ,

    );
  }
}
