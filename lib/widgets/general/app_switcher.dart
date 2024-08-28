import 'package:flutter/material.dart';

class AppSwitcher extends StatefulWidget {
  final bool initialValue;

  final ValueChanged<bool> onChanged;

  const AppSwitcher({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<AppSwitcher> createState() => _AppSwitcherState();
}

class _AppSwitcherState extends State<AppSwitcher> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _value,
      activeColor: Colors.black87,
      inactiveThumbColor: Colors.grey,
      inactiveTrackColor: Colors.grey[100],
      onChanged: (value) {
        setState(() {
          _value = value;
        });
        widget.onChanged(value);
      },
    );
  }
}
