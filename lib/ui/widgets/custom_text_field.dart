import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
typedef OnChanged = void Function(String)?;
typedef onValidator=String? Function(String?)?;
class CustomTextField extends StatelessWidget {
  final double? radius;
  final Color borderColor;
  final bool ? filled;
  final Color ?fillColor;
  final String ?hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final TextEditingController? controller;
  final OnChanged onChanged;
  final onValidator validator;
  const CustomTextField({super.key, this.radius, required this.borderColor, this.filled, this.fillColor,  this.hintText,  this.labelText, this.hintStyle, this.labelStyle, this.prefixIcon, this.maxLines=1, this.suffixIcon, this.controller, this.onChanged, this.validator});

  @override
  Widget build(BuildContext context) {

    return TextFormField(

      decoration: InputDecoration(
        enabledBorder: _builtDecorationBorder(radius: radius ?? 16, borderColor: borderColor),
        focusedBorder: _builtDecorationBorder(radius: radius ?? 16, borderColor: borderColor),
        errorBorder: _builtDecorationBorder(radius: radius ?? 16, borderColor: AppColors.redColor),
        focusedErrorBorder: _builtDecorationBorder(radius: radius ?? 16, borderColor: AppColors.redColor),
        filled: filled,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      maxLines: maxLines,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
    );
  }
  OutlineInputBorder _builtDecorationBorder({required double radius,required Color borderColor}){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(
        color: borderColor,
        width: 2.0,
      ),
    );
  }

}
