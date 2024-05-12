part of 'components.dart';

Widget button({
  required final VoidCallback onTap,
  final String title = "",
  final EdgeInsets margin = EdgeInsets.zero,
  final EdgeInsets padding = const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
  final Widget trailing = const SizedBox(),
  final Widget leading = const SizedBox(),
  final double width = 150,
  final double height = 40,
  final Widget? titleWidget,
  final Color? backgroundColor,
  final double? borderRadius = 12,
  final TextStyle? textStyle,
  final bool maxWidth = false,
  final Color? borderColor,
  final Color? titleColor,
}) =>
    Container(
      width: maxWidth ? Get.width : width,
      height: height,
      padding: margin,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(padding),
          shadowColor: MaterialStateProperty.all(backgroundColor??context.theme.primaryColorDark),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: borderRadius == null
              ? null
              : MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius), side: BorderSide(color: borderColor ?? Colors.transparent)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            leading,
            titleWidget ?? Text(title, style: textStyle?.copyWith(color: titleColor ?? Colors.white) ?? textTheme.bodyLarge!.copyWith(color: titleColor ?? Colors.white,fontWeight: FontWeight.bold,fontSize: 14)),
            trailing,
          ],
        ),
      ),
    );


Widget borderButton({
  final Function()? onTap,
  final String title = "",
  final double? borderWidth,
  final Color? borderColor,
  final Color? backgroundColor,
  final TextStyle? textStyle,
}) =>
    OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        splashFactory: NoSplash.splashFactory,
        backgroundColor: backgroundColor?? context.theme.scaffoldBackgroundColor,
        side: BorderSide(
          width: borderWidth ?? 1,
          color: borderColor ?? Colors.red,
        ),
      ),
      child: Text(title, style: textStyle ?? context.textTheme.bodyLarge),
    );
