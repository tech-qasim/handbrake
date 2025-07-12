import 'package:flutter/material.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/theme/app_colors.dart';

class AppCustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final Size buttonSize;
  final double radius;
  final Color buttonColor;
  final TextStyle? textStyle;
  final EdgeInsets buttonPadding;
  final Widget? buttonWidget;
  final bool isSelected;
  final BorderSide? borderSide;
  final WidgetStateProperty<Color?> overlayColor;
  final MainAxisAlignment mainAxisAlignment;
  final bool isFullWidth;

  final WidgetStateProperty<double?> elevation;
  const AppCustomButton({
    super.key,
    this.overlayColor = const WidgetStatePropertyAll(Colors.transparent),
    this.elevation = const WidgetStatePropertyAll(0),
    this.isSelected = false,
    required this.onPressed,
    required this.buttonText,
    this.buttonSize = const Size(120, 50),
    this.radius = 100,
    this.buttonColor = AppColors.primaryColor,
    this.textStyle,
    this.buttonPadding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 5,
    ),
    this.borderSide = BorderSide.none,
    this.buttonWidget,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return isFullWidth == true
        ? ElevatedButton(
            style: context.theme.elevatedButtonTheme.style?.copyWith(
              elevation: elevation,
              overlayColor: overlayColor,
              backgroundColor: WidgetStatePropertyAll(buttonColor),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: borderSide ?? BorderSide.none,
                ),
              ),
              minimumSize: WidgetStatePropertyAll(buttonSize),
              // maximumSize: MaterialStatePropertyAll(
              //   buttonSize,
              // ),
              padding: WidgetStatePropertyAll(buttonPadding),
            ),
            onPressed: onPressed,
            child: Center(
              child:
                  buttonWidget ??
                  Text(
                    buttonText,
                    style:
                        textStyle ??
                        context.textTheme.titleMedium?.copyWith(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
            ),
          )
        : Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              ElevatedButton(
                style: context.theme.elevatedButtonTheme.style?.copyWith(
                  elevation: elevation,
                  overlayColor: overlayColor,
                  backgroundColor: WidgetStatePropertyAll(buttonColor),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius),
                      side: borderSide ?? BorderSide.none,
                    ),
                  ),
                  minimumSize: WidgetStatePropertyAll(buttonSize),
                  // maximumSize: MaterialStatePropertyAll(
                  //   buttonSize,
                  // ),
                  padding: WidgetStatePropertyAll(buttonPadding),
                ),
                onPressed: onPressed,
                child: Center(
                  child:
                      buttonWidget ??
                      Text(
                        buttonText,
                        style:
                            textStyle ??
                            context.textTheme.titleMedium?.copyWith(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                ),
              ),
            ],
          );
  }
}
