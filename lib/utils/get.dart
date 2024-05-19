part of 'utils.dart';

bool isAndroid = GetPlatform.isAndroid && !kIsWeb;
bool isIos = GetPlatform.isIOS && !kIsWeb;
bool isMacOs = GetPlatform.isMacOS && !kIsWeb;
bool isWindows = GetPlatform.isWindows && !kIsWeb;
bool isLinux = GetPlatform.isLinux && !kIsWeb;
bool isFuchsia = GetPlatform.isFuchsia && !kIsWeb;
bool isMobile = GetPlatform.isMobile && !kIsWeb;
bool isWeb = GetPlatform.isWeb && kIsWeb;
bool isDesktop = GetPlatform.isDesktop && !kIsWeb;
bool isLandScape = context.isLandscape;
bool isPortrait = context.isPortrait;
bool isTablet = context.isTablet && !kIsWeb;
bool isPhone = context.isPhone && !kIsWeb;
BuildContext context = Get.context!;
double screenHeight = context.height;
double screenWidth = context.width;
ThemeData theme = context.theme;
TextTheme textTheme = context.textTheme;
ColorScheme colorScheme = context.theme.colorScheme;
Locale? currentLocale = Get.locale;
bool isDebugMode = kDebugMode;

bool isMobileSize() => context.width < 850;

bool isTabletSize() => context.width < 1100 && context.width >= 850;

bool isDesktopSize() => context.width >= 1100;

void updateLocale(final Locale locale) => Get.updateLocale(locale);

Future<dynamic> push(
    final Widget page, {
      final bool dialog = false,
      final Transition transition = Transition.cupertino,
      final bool backFirst = false,
      final bool preventDuplicates = true,
      final int milliSecondDelay = 1,
    }) async {
  if (backFirst) back();
  final Widget _page = await Future<Widget>.microtask(() => page);
  delay(
    milliSecondDelay,
        () async => await Get.to(
      _page,
      fullscreenDialog: dialog,
      popGesture: true,
      opaque: dialog ? false : true,
      transition: transition,
      preventDuplicates: preventDuplicates,
    ),
  );
}

Future<dynamic> pushReturn(
    final Widget page, {
      final bool dialog = false,
      final Transition transition = Transition.cupertino,
      final bool preventDuplicates = true,
    }) async {
  final Widget _page = await Future<Widget>.microtask(() => page);
  return await Get.to(
    _page,
    fullscreenDialog: dialog,
    popGesture: true,
    opaque: dialog ? false : true,
    transition: transition,
    preventDuplicates: preventDuplicates,
  );
}

Future<void> dialog(
    final Widget page, {
      final bool barrierDismissible = true,
      final bool useSafeArea = false,
      final VoidCallback? onDismiss,
    }) async {
  final Widget _page = await Future<Widget>.microtask(() => page);
  await Get.dialog(_page, useSafeArea: useSafeArea, barrierDismissible: barrierDismissible).then((final _) => onDismiss != null ? onDismiss() : null);
}

Future<void> dialogAlert(
    final Widget page, {
  final bool barrierDismissible = true,
  final bool useSafeArea = false,
  final Clip clipBehavior = Clip.hardEdge,
  final bool scrollable = false,
  final EdgeInsets insetPadding = const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
  final EdgeInsetsGeometry? contentPadding = EdgeInsets.zero,
  final bool defaultCloseButton = false,
  final VoidCallback? onDismiss,
  final Widget? icon,
  final EdgeInsetsGeometry? iconPadding,
  final Color? iconColor,
  final Widget? title,
  final EdgeInsetsGeometry? titlePadding,
  final TextStyle? titleTextStyle,
  final TextStyle? contentTextStyle,
  final List<Widget>? actions,
  final EdgeInsetsGeometry? actionsPadding,
  final MainAxisAlignment? actionsAlignment,
  final OverflowBarAlignment? actionsOverflowAlignment,
  final VerticalDirection? actionsOverflowDirection,
  final double? actionsOverflowButtonSpacing,
  final EdgeInsetsGeometry? buttonPadding,
  final Color? backgroundColor,
  final double? elevation,
  final Color? shadowColor,
  final Color? surfaceTintColor,
  final String? semanticLabel,
      final ShapeBorder? shape,
      final AlignmentGeometry? alignment,
      final ScrollController? scrollController,
      final ScrollController? actionScrollController,
      final Duration? insetAnimationDuration,
      final Curve? insetAnimationCurve,
    }) async {
  final Widget _page = await Future<Widget>.microtask(() => page);
  await Get.dialog(
    AlertDialog(
      content: _page,
      title: title,
      contentPadding: contentPadding,
      alignment: alignment,
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,
      elevation: elevation,
      actions: actions,
      actionsAlignment: actionsAlignment,
      actionsOverflowAlignment: actionsOverflowAlignment,
      actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
      actionsOverflowDirection: actionsOverflowDirection,
      actionsPadding: actionsPadding,
      buttonPadding: buttonPadding,
      clipBehavior: clipBehavior,
      contentTextStyle: contentTextStyle,
      icon: defaultCloseButton
          ? IconButton(
        onPressed: back,
        icon: Icon(Icons.close, color: context.theme.colorScheme.error),
      ).alignAtCenterRight()
          : icon,
      iconColor: iconColor,
      iconPadding: iconPadding,
      insetPadding: insetPadding,
      scrollable: scrollable,
      semanticLabel: semanticLabel,
      shape: shape,
      surfaceTintColor: surfaceTintColor,
      titlePadding: titlePadding,
      titleTextStyle: titleTextStyle,
    ),
    useSafeArea: useSafeArea,
    barrierDismissible: barrierDismissible,
  ).then(
        (final _) => onDismiss != null ? onDismiss() : null,
  );
}

Future<void> offAll(
    final Widget page, {
      final bool dialog = false,
      final Transition transition = Transition.cupertino,
      final int milliSecondDelay = 1,
    }) async {
  final Widget _page = await Future<Widget>.microtask(() => page);
  delay(
    milliSecondDelay,
        () => Get.offAll(
          () => _page,
      fullscreenDialog: dialog,
      popGesture: true,
      opaque: dialog ? false : true,
      transition: transition,
    ),
  );
}

void off(final Widget page) => Get.off(() => page);

void back({final bool closeOverlays = false}) => Get.back(closeOverlays: closeOverlays);

void snackBarDone({final String title = "انجام شد", final String subtitle = ""}) => snackBarGreen(
      title: title,
      subtitle: subtitle,
      duration: 2,
    );

void snackBarGreen({
  required final String title,
  required final String subtitle,
  final SnackPosition? snackPosition,
  final Widget? titleText,
  final Widget? messageText,
  final Widget? icon,
  final bool? shouldIconPulse,
  final double? maxWidth,
  final EdgeInsets? margin,
  final EdgeInsets? padding,
  final double? borderRadius,
  final Color? borderColor,
  final double? borderWidth,
  final Color? backgroundColor,
  final Color? leftBarIndicatorColor,
  final List<BoxShadow>? boxShadows,
  final Gradient? backgroundGradient,
  final TextButton? mainButton,
  final OnTap? onTap,
  final bool? isDismissible,
  final bool? showProgressIndicator,
  final DismissDirection? dismissDirection,
  final AnimationController? progressIndicatorController,
  final Color? progressIndicatorBackgroundColor,
  final Animation<Color>? progressIndicatorValueColor,
  final SnackStyle? snackStyle,
  final Curve? forwardAnimationCurve,
  final Curve? reverseAnimationCurve,
  final Duration? animationDuration,
  final double? barBlur,
  final double? overlayBlur,
  final SnackbarStatusCallback? snackBarStatus,
  final Color? overlayColor,
  final Form? userInputForm,
  final Color? colorText,
  final int duration = 5,
  final bool instantInit = true,
}) {
  if (!Get.isSnackbarOpen)
    Get.snackbar(
      title,
      subtitle,
      backgroundColor: backgroundColor ?? Colors.green,
      colorText: colorText ?? Colors.white,
      maxWidth: maxWidth,
      onTap: onTap,
      margin: margin,
      borderRadius: borderRadius,
      snackPosition: snackPosition,
      padding: padding,
      animationDuration: animationDuration,
      backgroundGradient: backgroundGradient,
      barBlur: barBlur,
      borderColor: borderColor,
      borderWidth: borderWidth,
      boxShadows: boxShadows,
      dismissDirection: dismissDirection,
      duration: Duration(seconds: duration),
      forwardAnimationCurve: forwardAnimationCurve,
      icon: icon,
      instantInit: instantInit,
      isDismissible: isDismissible,
      leftBarIndicatorColor: leftBarIndicatorColor,
      mainButton: mainButton,
      messageText: messageText,
      overlayBlur: overlayBlur,
      overlayColor: overlayColor,
      progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
      progressIndicatorController: progressIndicatorController,
      progressIndicatorValueColor: progressIndicatorValueColor,
      reverseAnimationCurve: reverseAnimationCurve,
      shouldIconPulse: shouldIconPulse,
      showProgressIndicator: showProgressIndicator,
      snackbarStatus: snackBarStatus,
      snackStyle: snackStyle,
      titleText: titleText,
      userInputForm: userInputForm,
    );
}

void snackBarRed({
  required final String title,
  required final String subtitle,
  final SnackPosition? snackPosition,
  final Widget? titleText,
  final Widget? messageText,
  final Widget? icon,
  final bool? shouldIconPulse,
  final double? maxWidth,
  final EdgeInsets? margin,
  final EdgeInsets? padding,
  final double? borderRadius,
  final Color? borderColor,
  final double? borderWidth,
  final Color? backgroundColor,
  final Color? leftBarIndicatorColor,
  final List<BoxShadow>? boxShadows,
  final Gradient? backgroundGradient,
  final TextButton? mainButton,
  final OnTap? onTap,
  final bool? isDismissible,
  final bool? showProgressIndicator,
  final DismissDirection? dismissDirection,
  final AnimationController? progressIndicatorController,
  final Color? progressIndicatorBackgroundColor,
  final Animation<Color>? progressIndicatorValueColor,
  final SnackStyle? snackStyle,
  final Curve? forwardAnimationCurve,
  final Curve? reverseAnimationCurve,
  final Duration? animationDuration,
  final double? barBlur,
  final double? overlayBlur,
  final SnackbarStatusCallback? snackBarStatus,
  final Color? overlayColor,
  final Form? userInputForm,
  final Color? colorText,
  final int duration = 5,
  final bool instantInit = true,
}) {
  if (!Get.isSnackbarOpen)
    Get.snackbar(
      title,
      subtitle,
      backgroundColor: backgroundColor ?? Colors.red,
      colorText: colorText ?? Colors.white,
      maxWidth: maxWidth,
      onTap: onTap,
      margin: margin,
      borderRadius: borderRadius,
      snackPosition: snackPosition,
      padding: padding,
      animationDuration: animationDuration,
      backgroundGradient: backgroundGradient,
      barBlur: barBlur,
      borderColor: borderColor,
      borderWidth: borderWidth,
      boxShadows: boxShadows,
      dismissDirection: dismissDirection,
      duration: Duration(seconds: duration),
      forwardAnimationCurve: forwardAnimationCurve,
      icon: icon,
      instantInit: instantInit,
      isDismissible: isDismissible,
      leftBarIndicatorColor: leftBarIndicatorColor,
      mainButton: mainButton,
      messageText: messageText,
      overlayBlur: overlayBlur,
      overlayColor: overlayColor,
      progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
      progressIndicatorController: progressIndicatorController,
      progressIndicatorValueColor: progressIndicatorValueColor,
      reverseAnimationCurve: reverseAnimationCurve,
      shouldIconPulse: shouldIconPulse,
      showProgressIndicator: showProgressIndicator,
      snackbarStatus: snackBarStatus,
      snackStyle: snackStyle,
      titleText: titleText,
      userInputForm: userInputForm,
    );
}
