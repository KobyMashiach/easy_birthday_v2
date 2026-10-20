import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppDropDown<T> extends StatefulWidget {
  final void Function(T) onChanged;
  final List<T> listValues;
  final String? hintText;
  final T? value;
  final bool? showError;
  final bool isRequired;

  const AppDropDown({
    super.key,
    required this.onChanged,
    required this.listValues,
    this.hintText,
    this.value,
    this.showError,
    this.isRequired = false,
  });

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
            padding: const EdgeInsets.all(12.0),
            child: DropdownButtonFormField<T>(
              initialValue: value,
              items: widget.listValues.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(
                    value.toString(),
                    textAlign: TextAlign.center,
                    style: AppTextStyle().smallDescription,
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  value = newValue;
                });
                widget.onChanged(newValue as T);
              },
              decoration: InputDecoration(
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
              dropdownColor: Colors.grey[100],
              icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
