import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/theme/app_colors.dart';

class AppTextField extends StatelessWidget {
  final bool isNumber;
  final String? initialValue;
  final TextAlign? textAlign;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final bool? enabled;
  final bool? autofocus;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function(PointerDownEvent)? onTapOutside;
  final int? length;
  final InputBorder? border;
  final String? labelText; // Changed labeltext to labelText
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextEditingController? textController;
  final TextInputType? keyboardType; // Changed keyboard to keyboardType
  final VoidCallback? onPressed;
  final Color? fillColor;
  final String? Function(String?)? validator;
  final int lines; // max lines
  final int minLines;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final InputBorder? focusedBorder;
  final EdgeInsetsGeometry? contentPadding;
  final Color? cursorColor; // Added hintText parameter
  final bool readOnly;
  final BoxConstraints? prefixConstraints;
  final String? lengthCountText;

  const AppTextField({
    super.key,
    this.focusedBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.textfieldBgColor, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    this.initialValue,
    this.textAlign,
    this.cursorColor,
    this.isNumber = false,
    this.onFieldSubmitted,
    this.onChanged,
    this.onEditingComplete,
    this.inputFormatters,
    this.obscureText = false,
    this.enabled = true,
    this.autofocus = false,
    this.readOnly = false,
    this.textInputAction,
    this.focusNode,
    this.onTapOutside,
    this.length,
    this.prefixConstraints,
    this.lengthCountText,
    this.border = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 0),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    this.labelText,
    this.labelStyle,
    this.hintStyle,
    this.textStyle,
    this.textController,
    this.keyboardType,
    this.onPressed,
    this.fillColor = AppColors.textfieldBgColor,
    this.validator,
    this.lines = 1,
    this.minLines = 1,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.contentPadding,
  });
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final isFocused = focusNode?.hasFocus ?? false;
    return TextFormField(
      onChanged: onChanged,
      textAlign: textAlign ?? TextAlign.start,
      initialValue: initialValue,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      enabled: enabled,
      minLines: minLines,
      autofocus: autofocus!,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      textInputAction: textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: focusNode,
      obscureText: obscureText,
      cursorColor: cursorColor ?? AppColors.primaryColor,
      maxLines: lines,
      readOnly: readOnly,
      controller: textController,
      maxLength: length,
      validator: validator,
      inputFormatters: inputFormatters,
      style:
          textStyle ??
          theme.textTheme.bodySmall?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
      keyboardType: keyboardType,
      onTap: onPressed,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIconConstraints:
            prefixConstraints ??
            const BoxConstraints(
              maxWidth: 42,
              maxHeight: 42,
              minHeight: 26,
              minWidth: 26,
            ),

        hintStyle:
            hintStyle ??
            theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
        suffixIcon: suffixIcon,
        labelStyle: labelStyle,
        focusedBorder: focusedBorder,
        enabledBorder: border,
        disabledBorder: border,
        errorBorder: border,
        counterText: lengthCountText,
        filled: true,
        fillColor: isFocused
            ? AppColors.lightModeScreenBgColor
            : fillColor ?? AppColors.lightModeScreenBgColor,
        border: border ?? border,
        labelText: labelText,
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      ),
    );
  }
}
