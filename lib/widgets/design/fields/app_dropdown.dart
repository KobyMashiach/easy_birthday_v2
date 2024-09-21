import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/widgets/general/error_message_row.dart';
import 'package:flutter/material.dart';

class AppDropDown<T> extends StatefulWidget {
  final void Function(T) onChanged;
  final List<T> listValues;
  final String Function(T objectType)? valueFormatter;
  final String? hintText;
  final T? value;
  final GlobalKey<FormFieldState>? keyToReset;
  final EdgeInsets? padding;
  final bool? showError;
  final String? error;
  final bool isRequired;

  const AppDropDown({
    Key? key,
    required this.onChanged,
    required this.listValues,
    this.valueFormatter,
    this.hintText,
    this.value,
    this.keyToReset,
    this.padding,
    this.showError,
    this.error,
    this.isRequired = false,
  }) : super(key: key);

  @override
  State<AppDropDown<T>> createState() => _AppDropDownState<T>();
}

class _AppDropDownState<T> extends State<AppDropDown<T>> {
  late T? value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: Padding(
            padding: widget.padding ?? const EdgeInsets.all(12.0),
            child: DropdownButtonFormField<T>(
              key: widget.keyToReset,
              value: value,
              items: widget.listValues.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(
                    widget.valueFormatter != null
                        ? widget.valueFormatter!(value)
                        : value.toString(),
                    textAlign: TextAlign.center,
                    style: AppTextStyle().smallDescription,
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  value = newValue;
                });
                widget.onChanged(newValue!);
              },
              decoration: InputDecoration(
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
              dropdownColor: Colors.grey[100],
              icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
            ),
          ),
        ),
        if (widget.showError == true && widget.error != null)
          errorMessageRow(message: widget.error!),
      ],
    );
  }
}
