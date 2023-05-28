import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../res/app_text_styles.dart';

// ignore: must_be_immutable
class AppTextField extends StatefulWidget {
  AppTextField({
    super.key,
    this.hint,
    this.inputAction,
    this.error,
    this.onChanged,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textAlign,
    this.controller,
    this.isSuffix = false,
    this.changePassVisibility,
    this.inputFormatters,
    this.isVisible = true,
    this.maxLen,
    this.textCapitalization,
    this.icon,
    this.enabled,
    this.validator,
    this.textInputAction,
    this.keyboardType,
    this.style,
    this.isBorder = true,
    this.maxLines = 1,
    this.readOnly = false,
    this.model,
    this.onFiledSubmitted,
    this.focusNode,
    this.autoFocus,
    this.marginTop = 0,
    this.marginBottom = 0,
    this.enableShadow = false,
    this.label,
    this.labelText,
    this.borderRadiusTopLeft = 10,
    this.borderRadiusTopRight = 10,
    this.borderRadiusBottomLeft = 10,
    this.borderRadiusBottomRight = 10,
    this.showCounter = false,
    this.onPressed,
    this.prefixText,
    this.contentTopPadding,
    this.hideUnderline = false,
    this.width,
  });

  final bool showCounter;
  final String? labelText;
  final String? label;
  Function(String)? onChanged;
  String? hint;
  TextInputAction? inputAction;
  String? error;
  bool obscureText;
  IconData? prefixIcon;
  Widget? suffixIcon;
  String? prefixText;
  TextAlign? textAlign;
  TextEditingController? controller;
  bool isSuffix;
  void Function(bool)? changePassVisibility;
  var isVisible = false;
  bool? isBorder = true;
  bool readOnly;
  int? maxLines;
  dynamic model;
  bool enableShadow;
  final Function()? onPressed;
  int? maxLen;
  TextCapitalization? textCapitalization;
  Widget? icon;
  bool? enabled;
  String? Function(String? p1)? validator;
  TextInputAction? textInputAction;
  TextInputType? keyboardType;
  TextStyle? style;
  Function(String)? onFiledSubmitted;
  List<TextInputFormatter>? inputFormatters;
  FocusNode? focusNode;
  bool? autoFocus;
  double marginTop, marginBottom;
  double borderRadiusTopLeft, borderRadiusBottomRight;
  double borderRadiusTopRight, borderRadiusBottomLeft;
  double? contentTopPadding;
  bool hideUnderline;
  double? width;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isTextVisible = true;

  @override
  void initState() {
    super.initState();
    isTextVisible = widget.obscureText ? false : true;
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: widget.width,
      child: Padding(
        padding:
            EdgeInsets.only(top: widget.marginTop, bottom: widget.marginBottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.labelText != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  widget.labelText!,
                  style: AppTextStyles.regularSemiBoldText(
                      color: Colors.black87.withOpacity(0.8)),
                ),
              ),
            InkWell(
              onTap: widget.onPressed,
              child: Container(
                decoration: widget.enableShadow
                    ? BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(widget.borderRadiusTopLeft),
                          topRight:
                              Radius.circular(widget.borderRadiusTopRight),
                          bottomLeft:
                              Radius.circular(widget.borderRadiusBottomLeft),
                          bottomRight:
                              Radius.circular(widget.borderRadiusBottomRight),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1.2,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                        color: Colors.white,
                      )
                    : null,
                child: TextFormField(
                  textAlign: widget.textAlign ?? TextAlign.start,
                  // cursorColor: primaryColor,
                  focusNode: widget.focusNode,
                  autofocus: widget.autoFocus ?? false,
                  readOnly: widget.readOnly,
                  maxLines: widget.maxLines,
                  validator: widget.validator,
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  textInputAction: widget.inputAction,
                  onChanged: widget.onChanged,
                  maxLength: widget.maxLen,
                  inputFormatters: widget.inputFormatters,
                  obscureText: widget.obscureText ? !isTextVisible : false,
                  enabled: widget.enabled ?? true,
                  textCapitalization: widget.textCapitalization != null
                      ? widget.textCapitalization!
                      : TextCapitalization.sentences,
                  onFieldSubmitted: widget.onFiledSubmitted,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .error, // or any other color
                    ),
                    prefixText: widget.prefixText,
                    label: widget.label == null ? null : Text(widget.label!),
                    border: widget.hideUnderline
                        ? InputBorder.none
                        : widget.enableShadow
                            ? InputBorder.none
                            : null,
                    // enabledBorder: BorderStyles.inputBorder,
                    counterText: widget.showCounter ? null : '',
                    // isDense: true,
                    errorMaxLines: 3,
                    // errorBorder: BorderStyles.errorBorder,
                    // filled: true,

                    hintText: widget.hint,
                    // fillColor: readOnly ? grey200Color : whiteColor,
                    suffixIcon: widget.isSuffix
                        ? InkWell(
                            onTap: () {
                              if (mounted) {
                                setState(() {
                                  isTextVisible = !isTextVisible;
                                });
                              }
                            },
                            child: Icon(
                                !isTextVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey))
                        : widget.suffixIcon,
                    // focusedErrorBorder: BorderStyles.errorBorder,
                    // focusedBorder: BorderStyles.inputBorder,
                    contentPadding: widget.enableShadow
                        ? EdgeInsets.only(
                            left: 12, top: widget.suffixIcon != null ? 14 : 0)
                        : EdgeInsets.only(
                            top: widget.suffixIcon != null ? 13 : 0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
