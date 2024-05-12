part of 'components.dart';

Widget textFormField({
  final TextEditingController? controller,
  final String? paramCheck,
  final String? hint,
  final Widget? suffix,
  final Widget? prefix,
  final Function(String value)? onChanged,
  final Function(String value)? onFieldSubmitted,
  final Function(String? value)? onSaved,
  final TextAlign? textAlign,
  final TextInputType? inputType,
  final int? maxLength,
  final int? maxLines,
  final int? minLines,
  final int? customLaxLength,
  final EdgeInsets? contentPadding,
  final TextInputAction? textInputAction,
  final FormFieldValidator<String>? validator,
  final List<TextInputFormatter>? inputFormatters,
  final VoidCallback? onTap,
  final Color? fillColor,
  final Color? borderColor,
  final Color? errorBorderColor,
  final Color? hintTextColor,
  final TextDirection? hintTextDirection,
  final TextDirection? textDirection,
  final FocusNode? focusNode,
  final bool? enable,
  final String? title,
  final String? label,
  final String? initialValue,
  final TextStyle? hintStyle,
  final TextStyle? textStyle,
  final EdgeInsets? margin,
  final InputDecoration? decoration,
  final bool autoFocus = false,
  final double borderRadius = 10,
  final double? height,
  final TextAlignVertical? textAlignVertical,
  final ValueChanged<String>? onSubmitted,
  final double enabledBorderRadius = 10,
  final AutovalidateMode? autovalidateMode,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (title != null) Text(title).bodyMedium().marginOnly(bottom: 8),
        SizedBox(
          height: height,
          child: TextFormField(
            enabled: enable,
            autovalidateMode: autovalidateMode,
            controller:initialValue==null? controller:null,
            onChanged: onChanged,
            validator: validator,
            onFieldSubmitted: onSubmitted,

            textAlignVertical: textAlignVertical ?? TextAlignVertical.top,
            onTap: () {
              onTap?.call();
              if (controller!.selection == TextSelection.fromPosition(TextPosition(offset: controller.text.length - 1))) {
                controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
              }
            },
            textAlign: textAlign ?? TextAlign.start,
            keyboardType: inputType,
            maxLength: maxLength,
            maxLines: maxLines,
            minLines: minLines,
            autofocus: autoFocus,
            initialValue: initialValue,
            textDirection: textDirection ??TextDirection.rtl,
            focusNode: focusNode,
            inputFormatters: inputFormatters,

            textInputAction: textInputAction,
            style: textStyle ?? context.textTheme.bodyMedium!.copyWith(fontSize: 18, color: context.theme.primaryColorDark),
            decoration: decoration ??
                InputDecoration(
                  isDense: true,

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: borderColor??Colors.transparent ,width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: borderColor ?? context.theme.unselectedWidgetColor),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: borderColor ?? context.theme.unselectedWidgetColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: borderColor ?? context.theme.unselectedWidgetColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: borderColor ?? Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: errorBorderColor ?? Colors.red,width: 2),
                  ),
                  filled: true,
                  fillColor: fillColor ?? Colors.transparent,
                  counterText: "",
                  label: label!=null?Text(label).bodyLarge(color: context.theme.primaryColorDark.withOpacity(0.6)) : null,
                  hintText: hint,
                  labelStyle:hintStyle?? TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,//
                      color:focusNode!=null && focusNode.hasPrimaryFocus ? Colors.transparent : context.theme.unselectedWidgetColor
                  ),
                  // labelStyle: context.textTheme.bodyLarge!.copyWith(color: context.theme.primaryColorDark.withOpacity(0.5)),
                  hintStyle: hintStyle ?? textTheme.bodySmall!.copyWith(color: hintTextColor ?? context.theme.hintColor),
                  contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(12, 14, 12, 14),
                  suffixIcon: suffix,
                  prefixIcon: prefix,
                  hintTextDirection: hintTextDirection,
                  prefixIconConstraints: const BoxConstraints(
                    maxHeight: 64,
                    maxWidth: 64,
                  ),
                ),
          ),
        ),
      ],
    );

Widget textFormFieldUploadNumerical({
  final TextEditingController? controller,
  final String? paramCheck,
  final String? hint,
  final Widget? suffix,
  final Widget? prefix,
  final Function(String value)? onChanged,
  final Function(String value)? onFieldSubmitted,
  final Function(String? value)? onSaved,
  final TextAlign? textAlign,
  final TextInputType? inputType,
  final int? maxLength,
  final int? maxLines,
  final int? minLines,
  final int? customLaxLength,
  final EdgeInsets? contentPadding,
  final TextInputAction? textInputAction,
  final FormFieldValidator<String>? validator,
  final List<TextInputFormatter>? inputFormatters,
  final VoidCallback? onTap,
  final Color? fillColor,
  final Color? borderColor,
  final Color? hintTextColor,
  final TextDirection? hintTextDirection,
  final TextDirection? textDirection,
  final FocusNode? focusNode,
  final bool? enable,
  final String? title,
  final String? lable,
  final TextStyle? hintStyle,
  final TextStyle? textStyle,
  final EdgeInsets? margin,
  final InputDecoration? decoration,
  final bool autoFocus = false,
  final double borderRadius = 10,
  final double? height,
  final double enabledBorderRadius = 10,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (title != null) Text(title).bodyMedium().marginOnly(bottom: 8),
        SizedBox(
          height: height,
          child: TextFormField(
            enabled: enable,
            controller: controller,
            onChanged: onChanged,
            onTap: () {
              onTap?.call();
              if (controller!.selection == TextSelection.fromPosition(TextPosition(offset: controller.text.length - 1))) {
                controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
              }
            },
            textAlign: textAlign ?? TextAlign.start,
            keyboardType: inputType,
            maxLength: maxLength,
            validator: validator,
            maxLines: maxLines,
            minLines: minLines,
            autofocus: autoFocus,
            textDirection: textDirection ,
            focusNode: focusNode,
            textAlignVertical: TextAlignVertical.center,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            style: textStyle ?? context.textTheme.bodyMedium!.copyWith(fontSize: 13, color: context.theme.primaryColorDark),
            decoration: decoration ??
                InputDecoration(
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: borderColor ?? Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: borderColor ?? Colors.transparent),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: borderColor ?? Colors.transparent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: borderColor ?? Colors.transparent),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: borderColor ?? Colors.transparent),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: borderColor ?? Colors.transparent),
                  ),
                  filled: true,
                  fillColor: fillColor ?? context.theme.cardColor,
                  counterText: "",
                  labelText: hint ?? lable,
                  labelStyle: context.textTheme.bodyLarge!.copyWith(color: context.theme.primaryColorDark.withOpacity(0.5)),
                  hintStyle: hintStyle ?? textTheme.bodyLarge!.copyWith(color: hintTextColor ?? context.theme.hintColor),
                  contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(20, 16, 20, 16),
                  suffixIcon: suffix,
                  prefixIcon: prefix,
                  hintTextDirection: hintTextDirection,
                ),
          ),
        ),
      ],
    );

Widget searchField({
  final BuildContext? ctx,
  final TextEditingController? controller,
  final String? hint,
  final Widget? suffix,
  final Widget? prefix,
  final Function(String)? onChanged,
  final TextAlign? textAlign,
  final TextInputType? inputType,
  final ValueChanged<String>? onSubmitted,
  final int? maxLines,
  final int? minLines,
  final Color? fillColor,
  final Color? borderColor,
  final Function(String)? onFieldSubmitted,
  final Color? hintTextColor,
  final EdgeInsets? contentPadding,
  final FormFieldValidator<String>? validator,
  final VoidCallback? onTap,
  final TextDirection? textDirection,
  final FocusNode? focusNode,
  final bool autoFocus = false,
  final VoidCallback? onSuffixTap,
  final VoidCallback? onTapFilter,
  final bool withFilter = false,
}) {
  String param = '';
  // final Widget persianSearchPrefix = Container(
  //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8), //
  //   child: Icon(Icons.search, color: context.theme.primaryColorDark, size: 18).onTap(() {
  //     if (onSubmitted != null) {
  //       onSubmitted(param);
  //     }
  //   }),
  // );
  final Widget? persianSearchSuffix = withFilter ? Icon(Icons.filter, color: context.theme.primaryColorDark, size: 24).marginSymmetric(horizontal: 8).onTap(onTapFilter) : suffix;
  // final Widget? englishSearchSuffix = withFilter ? Icon(Icons.filter, color: context.theme.primaryColorDark, size: 24).marginSymmetric(horizontal: 8).onTap(onTapFilter) : suffix;
  final Widget englishSearchPrefix = Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8), //
    child: Icon(Icons.search, color: context.theme.primaryColorDark, size: 18).onTap(() {
      if (onSubmitted != null) {
        onSubmitted(param);
      }
    }),
  );
  return textFormField(
    controller: controller,
    hintTextColor: context.theme.primaryColorDark,
    onChanged: (final String value) {
      param = value;
      if (onChanged != null) {
        onChanged(value);
      }
    },
    textAlign: textAlign ?? TextAlign.start,
    textAlignVertical: TextAlignVertical.center,
    inputType: inputType,
    textInputAction: onSubmitted != null ? TextInputAction.go : null,
    maxLines: 1,
    textDirection: textDirection ,
    autoFocus: autoFocus,
    focusNode: focusNode,
    minLines: minLines,
    onSubmitted: onSubmitted,
    onFieldSubmitted: onFieldSubmitted,
    validator: validator,
    onTap: onTap,
    decoration: InputDecoration(
      isDense: true,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderColor ?? Colors.transparent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderColor ?? Colors.transparent),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderColor ?? Colors.transparent),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderColor ?? Colors.transparent),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderColor ?? Colors.transparent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderColor ?? Colors.transparent),
      ),
      hintText: hint ??'Search',
      fillColor: fillColor ?? ( Colors.blueGrey),
      prefixIconConstraints: const BoxConstraints(
        maxHeight: 64,
        maxWidth: 64,
      ),
      suffixIconConstraints: const BoxConstraints(
        maxHeight: 64,
        maxWidth: 64,
      ),
      hintStyle: textTheme.bodyLarge!.copyWith(color: hintTextColor ?? context.theme.hintColor),
      contentPadding: contentPadding ??  EdgeInsets.zero,
      suffixIcon:  persianSearchSuffix ,
      prefixIcon:  englishSearchPrefix,
    ),
  );
}
