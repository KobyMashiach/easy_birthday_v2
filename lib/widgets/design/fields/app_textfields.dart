import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/widgets/general/error_message_row.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final controller;
  final bool? enable;
  final String hintText;
  final TextInputType? keyboard;
  final bool? checkIfPassword;
  final bool? readOnly;
  final bool? maxLinesIsNull;
  final int? maxLines;
  final int? maxLength;
  final Function(String)? onChanged;
  final VoidCallback? onClear;
  final bool? clearXIcon;
  final EdgeInsets? padding;
  final TextInputAction? textInputAction;
  final String? counterText;
  final bool? hintTextCenter;
  final bool? xIconHalf;
  final bool? showError;
  final String? error;
  final TextDirection? textDirection;
  final Widget? child;
  final bool isRequired;

  AppTextField({
    super.key,
    this.controller,
    this.enable,
    this.keyboard,
    this.xIconHalf,
    this.textInputAction,
    this.checkIfPassword = false,
    this.hintTextCenter,
    this.onClear,
    this.clearXIcon = false,
    this.maxLinesIsNull,
    required this.hintText,
    this.readOnly,
    this.maxLines,
    this.maxLength,
    this.onChanged,
    this.padding,
    this.counterText,
    this.showError,
    this.error,
    this.textDirection,
    this.child,
    this.isRequired = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _passwordVisible;
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    bool checkPassword = widget.checkIfPassword ?? false;
    return Column(
      children: [
        SizedBox(
          height: widget.maxLines != null ? null : 80,
          child: Padding(
            padding: widget.padding ?? const EdgeInsets.all(12.0),
            child: TextField(
              textDirection: widget.textDirection,
              textAlign: widget.hintTextCenter == true
                  ? TextAlign.center
                  : TextAlign.start,
              onChanged: widget.onChanged,
              maxLength: widget.maxLength,
              maxLines:
                  widget.maxLinesIsNull == true ? null : widget.maxLines ?? 1,
              textInputAction: widget.textInputAction,
              style: const TextStyle(color: Colors.black),
              enabled: widget.enable ?? true,
              controller: widget.controller,
              obscureText: checkPassword ? !_passwordVisible : false,
              keyboardType: widget.keyboard ?? TextInputType.text,
              readOnly: widget.readOnly ?? false,
              decoration: InputDecoration(
                counterText: widget.counterText,
                // suffixIcon: widget.checkIfPassword!
                //     ? IconButton(
                //         icon: Icon(
                //           _passwordVisible
                //               ? Icons.visibility
                //               : Icons.visibility_off,
                //           color: _passwordVisible
                //               ? AppColors.disableColor
                //               : AppColors.greyDisableColor,
                //         ),
                //         onPressed: () {
                //           setState(() {
                //             _passwordVisible = !_passwordVisible;
                //           });
                //         },
                //       )
                //     : widget.clearXIcon!
                //         ? GestureDetector(
                //             onTap: () {
                //               widget.onClear?.call();
                //             },
                //             child: FractionallySizedBox(
                //               heightFactor:
                //                   widget.xIconHalf == true ? 0.1 : 0.2,
                //               child: CircleAvatar(
                //                 backgroundColor: Colors.grey,
                //                 child: FittedBox(
                //                   child: Padding(
                //                     padding: EdgeInsets.all(4.0),
                //                     child: Icon(
                //                       Icons.close,
                //                       color: Colors.white,
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           )
                //         : null,
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (checkPassword)
                      IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: _passwordVisible
                              ? AppColors.disableColor
                              : AppColors.greyDisableColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    if (widget.clearXIcon == true)
                      GestureDetector(
                        onTap: () {
                          widget.onClear?.call();
                        },
                        child: FractionallySizedBox(
                          heightFactor: widget.xIconHalf == true ? 0.1 : 0.2,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: FittedBox(
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (widget.child != null) widget.child!,
                  ],
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: widget.showError == true
                          ? AppColors.error
                          : Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: widget.isRequired
                    ? "${widget.hintText} *"
                    : widget.hintText,
                hintStyle: TextStyle(color: Colors.grey[500], fontSize: 24),
              ),
            ),
          ),
        ),
        if (widget.showError == true && widget.error != null)
          errorMessageRow(message: "message"),
      ],
    );
  }
}
