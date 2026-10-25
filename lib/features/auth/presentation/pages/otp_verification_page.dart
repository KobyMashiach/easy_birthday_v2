import 'dart:async';
import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPhoneVerificationScreen extends StatefulWidget {
  final void Function(String otpCode) onVerification;
  final VoidCallback onTapSendAgain;
  final String verificationId;
  const OtpPhoneVerificationScreen({
    super.key,
    required this.onVerification,
    required this.onTapSendAgain,
    required this.verificationId,
  });

  @override
  State<OtpPhoneVerificationScreen> createState() =>
      _OtpPhoneVerificationScreenState();
}

class _OtpPhoneVerificationScreenState
    extends State<OtpPhoneVerificationScreen> {
  final PinInputController pinCodeController = PinInputController();

  /// Blocks double taps from verifying (and registering) twice. Re-enabled
  /// after a short delay so the user can retry if verification failed.
  bool _submitting = false;

  void _submit() {
    setState(() => _submitting = true);
    widget.onVerification.call(pinCodeController.text);
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) setState(() => _submitting = false);
    });
  }

  static const int timeCount = 30;
  late final Timer _timer;
  int _remainingTime = timeCount;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    pinCodeController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.otp_code),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Column(
            children: [
              if (MediaQuery.viewInsetsOf(context).bottom == 0)
                Expanded(
                  child: SvgPicture.asset(enterOtpIllustration, height: 300),
                ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Text(
                        t.otp_code,
                        style: AppTextStyle().title,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        t.otp_code_description,
                        style: AppTextStyle().description,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      pincodeField(context),
                      const SizedBox(height: 24),
                      if (_remainingTime > 0) circularNumber(),
                      if (_remainingTime == 0)
                        TextButton(
                          onPressed: widget.onTapSendAgain,
                          child: Text(
                            t.send_again,
                            style: AppTextStyle().description.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      const Spacer(),
                      appButton(
                        text: t.ok,
                        disableColors:
                            pinCodeController.text.length < 6 || _submitting,
                        onTap: pinCodeController.text.length < 6 || _submitting
                            ? null
                            : _submit,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack circularNumber() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularProgressIndicator(
          value: _remainingTime / timeCount,
          strokeWidth: 6,
          color: AppColors.primaryColor,
        ),
        Text('$_remainingTime', style: AppTextStyle().description),
      ],
    );
  }

  Directionality pincodeField(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialPinField(
        length: 6,
        autoFocus: true,
        pinController: pinCodeController,
        keyboardType: TextInputType.number,
        enableAutofill: true,
        autofillHints: const [AutofillHints.oneTimeCode],
        // Cells spread across the width, like the original pin field.
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        theme: MaterialPinTheme(
          shape: MaterialPinShape.outlined,
          cellSize: const Size(40, 64),
          spacing: 0,
          borderWidth: 1,
          focusedBorderWidth: 2,
          borderRadius: BorderRadius.circular(12),
          borderColor: Colors.red,
          followingBorderColor: Colors.red,
          focusedBorderColor: Colors.blue,
          filledBorderColor: Colors.green,
          entryAnimation: MaterialPinAnimation.fade,
          animationDuration: const Duration(milliseconds: 300),
        ),
        onChanged: (_) => setState(() {}),
      ),
    );
  }
}
