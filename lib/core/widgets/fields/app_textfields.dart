import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/general/error_message_row.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboard;
  final bool checkIfPassword;
  final bool readOnly;
  final int? maxLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final EdgeInsets? padding;
  final TextInputAction? textInputAction;
  final String? counterText;
  final bool? showError;
  final String? error;
  final TextDirection? textDirection;
  final Widget? child;
  final bool isRequired;

  const AppTextField({
    super.key,
    this.controller,
    this.keyboard,
    this.textInputAction,
    this.checkIfPassword = false,
    required this.hintText,
    this.readOnly = false,
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
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final bool checkPassword = widget.checkIfPassword;
    return Column(
      children: [
        SizedBox(
          height: widget.maxLines != null ? null : 80,
          child: Padding(
            padding: widget.padding ?? const EdgeInsets.all(12.0),
            child: TextField(
              textDirection: widget.textDirection,
              onChanged: widget.onChanged,
              maxLength: widget.maxLength,
              maxLines: widget.maxLines ?? 1,
              textInputAction: widget.textInputAction,
              style: const TextStyle(color: Colors.black),
              controller: widget.controller,
              obscureText: checkPassword ? !_passwordVisible : false,
              keyboardType: widget.keyboard ?? TextInputType.text,
              readOnly: widget.readOnly,
              decoration: InputDecoration(
                counterText: widget.counterText,
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (checkPassword)
                      IconButton(
                        tooltip: _passwordVisible
                            ? t.hide_password
                            : t.show_password,
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
                    if (widget.child != null) widget.child!,
                  ],
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.showError == true
                        ? AppColors.error
                        : Colors.grey.shade400,
                  ),
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
          errorMessageRow(message: widget.error!),
      ],
    );
  }
}
