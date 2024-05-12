import 'dart:developer' as developer;
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as intl;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utilities/utilities.dart';

part 'constants.dart';
part 'enums.dart';
part 'extensions/align_extension.dart';
part 'extensions/color_extension.dart';
part 'extensions/date_extension.dart';
part 'extensions/enums_extension.dart';
part 'extensions/file_extension.dart';
part 'extensions/iterable_extension.dart';
part 'extensions/number_extension.dart';
part 'extensions/shimmer_extension.dart';
part 'extensions/string_extension.dart';
part 'extensions/text_extension.dart';
part 'extensions/widget_extension.dart';
part 'file.dart';
part 'fonts.dart';
part 'get.dart';
part 'http_interceptor.dart';
part 'internet_connection_checker.dart';
part 'launch.dart';
part 'local_storage.dart';

void delay(final int milliseconds, final VoidCallback action) async => Future<dynamic>.delayed(
      Duration(milliseconds: milliseconds),
      () async => action(),
    );

Color hexStringToColor(final String hexString) {
  if (hexString.isEmpty) return Colors.transparent;
  final StringBuffer buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

String colorToHexColor(final Color color) => color.value.toRadixString(16);

void copyToClipboard(final String text) async => await Clipboard.setData(ClipboardData(text: text));

void validateForm({required final GlobalKey<FormState> key, required final VoidCallback action}) {
  if (key.currentState!.validate()) action();
}

String getPrice(final int i) => intl.NumberFormat('###,###,###,###,000').format(i);

bool hasMatch(final String? value, final String pattern) => (value == null) ? false : RegExp(pattern).hasMatch(value);

void logout({required final VoidCallback onLoggedOut}) => showYesCancelDialog(
      title: "خروج از سیستم",
      description: "آیا از خروج از سیستم اطمینان دارید؟",
      onYesButtonTap: () => onLoggedOut(),
    );

FormFieldValidator<String> validateMinLength(final int minLength) => (final String? value) {
      if (value!.length < minLength) return "مقدار وارد شده صحیح نیست";
      return null;
    };

FormFieldValidator<String> validateNotEmpty() => (final String? value) {
      if (value!.isEmpty) return "فیلد الزامی است";
      return null;
    };

FormFieldValidator<String> validateEmail() => (final String? value) {
      if (value!.isEmpty) return "فیلد الزامی است";
      if (!value.isEmail) return "ایمیل وارد شده صحیح نیست";
      return null;
    };

FormFieldValidator<String> validatePhone() => (final String? value) {
      if (value!.isEmpty) return "فیلد الزامی است";
      if (!isPhoneNumber(value)) return "شماره موبایل وارد شده صحیح نیست";
      return null;
    };

FormFieldValidator<String> validateNumber() => (final String? value) {
      if (value!.isEmpty) return "فیلد الزامی است";
      if (!GetUtils.isNumericOnly(value)) return "شماره وارد شده صحیح نیست";
      return null;
    };

void showYesCancelDialog({
  required final String title,
  required final String description,
  required final VoidCallback onYesButtonTap,
  final VoidCallback? onCancelButtonTap,
  final String? yesButtonTitle,
}) =>
    showDialog(
      context: context,
      builder: (final BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(title).headlineLarge(),
        content: Text(description).bodyLarge(),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          SizedBox(
              child: button(
            width: screenWidth / 4,
            backgroundColor: context.theme.primaryColorDark,
            onTap: onCancelButtonTap ?? back,
            title: 'انصراف',
            textStyle: context.textTheme.bodyMedium,
          )),
          SizedBox(
              child: button(
            width: screenWidth / 4,
            onTap: onYesButtonTap,
            title: yesButtonTitle ?? "بله",
            textStyle: context.textTheme.bodyMedium,
          )),
        ],
      ),
    );

bool isLoggedIn() => getString(UtilitiesConstants.token) == null ? false : true;

bool isPhoneNumber(final String s) {
  if (s.length > 16 || s.length < 9) return false;
  return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
}

bool isNumeric(final String? s) {
  if (s == null) {
    return false;
  }
  final int res = int.tryParse(s) ?? 10000;
  return res != 10000;
}

void shareText(final String text, {final String? subject}) => Share.share(text, subject: subject);

void shareFile(final List<String> file, final String text) => Share.shareXFiles(file.map(XFile.new).toList());



Future<String> appName() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.appName;
}

Future<String> appPackageName() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.packageName;
}

Future<String> appVersion() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}

Future<String> appBuildNumber() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.buildNumber;
}

Future<void> showEasyLoading() => EasyLoading.show();

Future<void> dismissEasyLoading() => EasyLoading.dismiss();

Future<void> showEasyError() => EasyLoading.showError("");

bool isEasyLoadingShow() => EasyLoading.isShow;

class MaskedTextInputFormatter extends TextInputFormatter {
  MaskedTextInputFormatter({required this.mask, required this.separator});

  final String? mask;
  final String? separator;

  @override
  TextEditingValue formatEditUpdate(final TextEditingValue oldValue, final TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask!.length) return oldValue;
        if (newValue.text.length < mask!.length && mask![newValue.text.length - 1] == separator)
          return TextEditingValue(
            text: '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(offset: newValue.selection.end + 1),
          );
      }
    }
    return newValue;
  }
}

Future<bool> backToHomeWhenIndexIsNot0({required final int currentBottomNavigationIndex, required final VoidCallback action}) {
  final RxInt currentIndex = currentBottomNavigationIndex.obs;
  if (currentIndex.value == 0) {
    return Future<bool>.value(true);
  } else {
    currentIndex(0);
    action();
    return Future<bool>.value(false);
  }
}
