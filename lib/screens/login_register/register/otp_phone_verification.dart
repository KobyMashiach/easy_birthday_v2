import 'dart:async';
import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPhoneVerificationScreen extends StatefulWidget {
  final Function(String otpCode) onVerification;
  final VoidCallback onTapSendAgain;
  final String verificationId;
  const OtpPhoneVerificationScreen(
      {super.key,
      required this.onVerification,
      required this.onTapSendAgain,
      required this.verificationId});

  @override
  State<OtpPhoneVerificationScreen> createState() =>
      _OtpPhoneVerificationScreenState();
}

class _OtpPhoneVerificationScreenState
    extends State<OtpPhoneVerificationScreen> {
  late TextEditingController pinCodeController;
  late Timer _timer;
  int timeCount = 10;
  late int _remainingTime;

  @override
  void initState() {
    pinCodeController = TextEditingController();
    _remainingTime = timeCount;

    _startTimer();
    super.initState();
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
          _timer.cancel();
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
              if (MediaQuery.of(context).viewInsets.bottom == 0)
                Expanded(
                    child: SvgPicture.asset(enterOtpIllustration, height: 300)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
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
                          child: Text(
                            t.send_again,
                            style: AppTextStyle()
                                .description
                                .copyWith(color: Colors.black),
                          ),
                          onPressed: widget.onTapSendAgain,
                        ),
                      const Spacer(),
                      AppButton(
                        text: t.ok,
                        onTap: () =>
                            widget.onVerification.call(pinCodeController.text),
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
        Text(
          '$_remainingTime',
          style: AppTextStyle().description,
        ),
      ],
    );
  }

  Directionality pincodeField(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        appContext: context,
        autoFocus: false,
        animationType: AnimationType.fade,
        animationDuration: const Duration(milliseconds: 300),
        controller: pinCodeController,
        keyboardType: TextInputType.number,
        autoDisposeControllers: false,
        length: 6,
        pinTheme: PinTheme(
          selectedBorderWidth: 2,
          inactiveBorderWidth: 1,
          activeBorderWidth: 1,
          fieldHeight: 64,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(12),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
