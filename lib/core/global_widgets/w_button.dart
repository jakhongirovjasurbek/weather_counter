import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/assets/constants/colors.dart';
import 'package:test_project/assets/theme/theme.dart';
import 'package:test_project/core/global_widgets/w_scale_animation.dart';

class WButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Color color;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final GestureTapCallback onTap;
  final Widget? child;
  final BoxBorder? border;
  final bool loading;
  final bool disabled;
  final double? borderRadius;
  final Color disabledColor;

  const WButton({
    required this.onTap,
    this.width,
    this.borderRadius,
    this.height,
    this.text = '',
    this.color = Colors.transparent,
    this.textStyle,
    this.margin,
    this.padding,
    this.border,
    this.loading = false,
    this.disabled = false,
    this.disabledColor = dark,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: (value) {
          if (!(loading || disabled)) {
            onTap();
          }
        },
        isDisabled: disabled,
        child: Container(
          width: width,
          height: height,
          margin: margin,
          padding: padding ?? const EdgeInsets.all(14),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: disabled ? disabledColor : color,
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            border: border,
          ),
          child: loading
              ? const Center(
                  child: CupertinoActivityIndicator(),
                )
              : child ??
                  Text(
                    text,
                    style: textStyle ??
                        Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(fontSize: 16),
                  ),
        ),
      );
}
