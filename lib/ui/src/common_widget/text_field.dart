
import 'package:everestcamp_task/ui/src/app_text_styles.dart';
import 'package:everestcamp_task/ui/ui.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.labelText,
    this.errorText,
    this.suffixIcon,
    this.keyBoardType,
    this.borderColor,
    this.obscureText= false,
    this.minLines= 1,
    this.labelTextStyle,
    this.focusNode,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.readOnly,
    this.onTap,
    this.fillColor,
    this.scrollController,
  });

  final TextEditingController? controller;
  final ScrollController? scrollController;
  final bool obscureText;
  final Function(String latestString)? onChanged;
  final String? labelText;
  final String? errorText;
  final Widget? suffixIcon;
  final TextInputType? keyBoardType;
  final TextStyle? labelTextStyle;
  final Color? borderColor;
  final int minLines;
  final FocusNode? focusNode;
  final Function(dynamic value)? onFieldSubmitted;
  final Function()? onTap;
  final bool? readOnly;
  final Widget? prefixIcon;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    final maxLines = minLines;
    return TextFormField(
      scrollController: scrollController,
      onTap: onTap,
      controller: controller,
      keyboardType: keyBoardType,
      obscureText: obscureText,
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      style: AppTextStyles.title,
      minLines: minLines,
      maxLines: maxLines,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: fillColor,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: borderColor ??  Color(0xff211F30),
            width: .5,
          ),
        ),
        labelText: labelText,
        labelStyle: labelTextStyle ?? AppTextStyles.title,
        errorText: errorText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: borderColor ??  const Color(0xff211F30),
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color:  Color(0xff211F30),
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color:  Colors.black12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        errorStyle: AppTextStyles.title.copyWith(
          color: Colors.red,
          letterSpacing: 0.1,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 16.w,
        ),
      ),
    );
  }
}