import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/ui/screens/home/tabs/home/add_event/date_or_time_widget.dart';
import 'package:evently_app/ui/screens/home/tabs/home/tab_item_widget.dart';
import 'package:evently_app/ui/widgets/custom_elevated_button.dart';
import 'package:evently_app/ui/widgets/custom_text_field.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEventScreen extends StatefulWidget {
  AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  List<String> eventLightImageList=[
    AppAssets.sportLightImage,
    AppAssets.birthdayLightImage,
    AppAssets.meetingLightImage,
    AppAssets.bookClubLightImage,
    AppAssets.exhibtionLightImage
  ];

  List<String> eventDarkImageList=[
    AppAssets.sportDarkImage,
    AppAssets.birthdayDarkImage,
    AppAssets.meetingDarkImage,
    AppAssets.bookClubDarkImage,
    AppAssets.exhibtionDarkImage
  ];

int selectedIndex=0;
DateTime? selectedDate;
TimeOfDay? selectedTime;
var formKey=GlobalKey<FormState>();
var title='';
var description='';


  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;

    List<String> eventsNameList=[

      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.bookclub,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.exhibition
    ];
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        centerTitle: true,
        leading: Container(
          margin: EdgeInsetsDirectional.only(
            start: width*0.02,
            top: height*0.01
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            borderRadius: BorderRadius.circular(8),
            border:Border.all(
              width: 2,
              color: Theme.of(context).dividerColor
            )

          ),
         child: IconButton(
             onPressed: (){
               Navigator.pop(context);
             },
             icon: Icon(Icons.arrow_back_ios_new_outlined,
           color: Theme.of(context).cardColor,)),
        ),
        title: Text(AppLocalizations.of(context)!.add_event,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: width*0.04,
          vertical: height*0.02
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: height*0.02,
              children: [
                Container(
                  width: width*0.9,
                  height: height*0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).dividerColor
                    ),
                    image: DecorationImage(
                        fit:BoxFit.fill,
                        image: AssetImage(
                            themeProvider.isDark ?
                                eventDarkImageList[selectedIndex] :
                                eventLightImageList[selectedIndex]
                            ))


                  ),

                ),
                SizedBox(
                  height: height*0.05,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,

                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                          selectedIndex=index;
                          setState(() {

                          });

                          },
                          child: TabItemWidget(
                            isSelected:selectedIndex == index,
                            eventName: eventsNameList[index],
                          ),
                        );
                      },
                      separatorBuilder: (context,index){
                        return SizedBox(
                          width: width*0.02,
                        );
                      },
                      itemCount: eventsNameList.length),
                ),
                Text(AppLocalizations.of(context)!.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                CustomTextField(
                  filled: true,
                  fillColor: Theme.of(context).highlightColor,
                  borderColor: Theme.of(context).dividerColor,
                  hintText: AppLocalizations.of(context)!.event_title,
                  onChanged: (text) {
                    title = text;
                  },
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please Enter event Title.';
                    }
                    return null;
                  },
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                ),
                Text(AppLocalizations.of(context)!.description,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                CustomTextField(
                  maxLines: 5,
                  onChanged: (text){
                    description=text;
                  },
                  validator: (text){
                    if( text==null || text.trim().isEmpty){
                      return 'Please Enter event Description.';
                    }
                    return null;
                  },
                  filled: true,

                  fillColor: Theme.of(context).highlightColor,
                  borderColor: Theme.of(context).dividerColor,
                  hintText: AppLocalizations.of(context)!.event_description,
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                ),
                DateOrTimeWidget(
                    icon: Icon(Icons.date_range_outlined,color: Theme.of(context).cardColor,),
                    eventDateOrTime: AppLocalizations.of(context)!.event_date,
                    chooseDateOrTime:selectedDate==null?
                    AppLocalizations.of(context)!.choose_date:
                        '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                  ,
                    onChooseDateOrTime: onChooseDate,
                    ),
                DateOrTimeWidget(
                  icon: Icon(Icons.timer,color: Theme.of(context).cardColor,),
                  eventDateOrTime: AppLocalizations.of(context)!.event_time,
                  chooseDateOrTime:selectedTime==null?
                  AppLocalizations.of(context)!.choose_time:
                  '${selectedTime!.hour}:${selectedTime!.minute} ${selectedTime!.period.name}'
                  ,
                  onChooseDateOrTime: onChooseTime,
                ),
                CustomElevatedButton(
                  verticalPadding: height * 0.01,
                  backgroundColor: Theme.of(context).cardColor,
                    onPressed:addEvent,
                    child: Text(AppLocalizations.of(context)!.add_event,
                      style: AppStyles.medium20white
                      ),
                    ),
                SizedBox(height: height*0.04,)


              ],
            ),
          ),
        ),
      ),

    );
  }
  void addEvent(){
    if(formKey.currentState!.validate()==true){
      //todo:add event
    }
  }
  void onChooseDate()async{
    var chooseDate=await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))

    );
    if(chooseDate!=null){
      selectedDate=chooseDate;
      //formatDate=DateFormat('dd/MM/yyyy').format(selectedDate!);
      setState(() {

      });
    }
  }
  void onChooseTime()async{
    var chooseTime=await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now());
    if(chooseTime!=null){
      selectedTime=chooseTime;
      setState(() {

      });
    }
  }

}
