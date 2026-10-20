import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/design_kit/app_toast.dart';
import 'package:easy_birthday/core/widgets/design_kit/dialogs.dart';
import 'package:easy_birthday/core/widgets/design_kit/dividers.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Color buttonBackground;
  final Color? dialogColor;
  const ContactUsScreen({
    super.key,
    required this.appBar,
    required this.buttonBackground,
    this.dialogColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: ContactUs(
        textColor: buttonBackground,
        dialogColor: dialogColor ?? Colors.white,
        logo: const AssetImage('assets/logo.png'),
        email: 'easynews@gifture.co.il',
        companyName: 'K&H Easy Dev',
        phoneNumber: '055-3180148',
        website: 'https://www.gifture.co.il',
        instagram: 'gifture_il',
        facebookHandle: 'GIFTUREIL',
        tiktokUrl: "gifture_il",
      ),
    );
  }
}

class ContactUs extends StatelessWidget {
  final ImageProvider? logo;
  final String? phoneNumber;
  final String? website;
  final String email;
  final String? facebookHandle;
  final String? tiktokUrl;
  final String companyName;
  final String? instagram;
  final Color textColor;
  final Color? dialogColor;

  const ContactUs({
    super.key,
    required this.companyName,
    required this.textColor,
    required this.email,
    this.logo,
    this.dialogColor,
    this.phoneNumber,
    this.website,
    this.facebookHandle,
    this.tiktokUrl,
    this.instagram,
  });

  @override
  Widget build(BuildContext context) {
    const EdgeInsets margin = EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 25.0,
    );
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 18),
            Visibility(
              visible: logo != null,
              child: CircleAvatar(radius: 50.0, backgroundImage: logo),
            ),

            Text(
              companyName,
              style: const TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            kheasydevDivider(height: 2),
            const SizedBox(height: 10.0),
            Visibility(
              visible: website != null,
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: margin,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: ListTile(
                  leading: const Icon(Icons.link),
                  title: Text(
                    t.contact_website,
                    style: TextStyle(color: textColor),
                  ),
                  onTap: () => _open(Uri.parse(website!)),
                ),
              ),
            ),
            Visibility(
              visible: phoneNumber != null,
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: margin,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: ListTile(
                  leading: const Icon(Icons.phone_outlined),
                  title: Text(
                    t.phone,
                    style: TextStyle(color: textColor),
                  ),
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => KheasydevDialog(
                      title: t.contact_method_title,
                      primaryColor: dialogColor,
                      description: phoneNumber,
                      isDismissable: true,
                      buttons: [
                        GenericButtonModel(
                          text: t.contact_call,
                          type: GenericButtonType.elevated,
                          onPressed: () {
                            _open(Uri.parse('tel:${phoneNumber!}'));
                            Navigator.of(context).pop();
                          },
                        ),
                        GenericButtonModel(
                          text: t.contact_message,
                          type: GenericButtonType.elevated,
                          onPressed: () {
                            _open(Uri.parse('sms:${phoneNumber!}'));
                            Navigator.of(context).pop();
                          },
                        ),
                        GenericButtonModel(
                          text: t.contact_whatsapp,
                          type: GenericButtonType.elevated,
                          onPressed: () {
                            _open(
                              Uri.parse(
                                'https://wa.me/${_internationalNumber(phoneNumber!)}',
                              ),
                              mode: LaunchMode.externalApplication,
                            );
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              margin: margin,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: ListTile(
                leading: const Icon(Icons.mail_outline),
                title: Text(
                  t.email,
                  style: TextStyle(color: textColor),
                ),
                onTap: () => _open(Uri.parse('mailto:$email')),
              ),
            ),
            Visibility(
              visible: facebookHandle != null,
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: margin,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: ListTile(
                  leading: const Icon(Icons.facebook),
                  title: Text(
                    t.contact_facebook,
                    style: TextStyle(color: textColor),
                  ),
                  onTap: () => _open(
                    Uri.parse('https://www.facebook.com/${facebookHandle!}'),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: instagram != null,
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: margin,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: ListTile(
                  leading: const Icon(Icons.camera_alt_outlined),
                  title: Text(
                    t.contact_instagram,
                    style: TextStyle(color: textColor),
                  ),
                  onTap: () => _open(
                    Uri.parse('https://instagram.com/${instagram!}'),
                  ),
                ),
              ),
            ),

            Visibility(
              visible: tiktokUrl != null,
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: margin,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: ListTile(
                  leading: const Icon(Icons.tiktok),
                  title: Text(
                    t.contact_tiktok,
                    style: TextStyle(color: textColor),
                  ),
                  onTap: () => _open(
                    Uri.parse("https://www.tiktok.com/@${tiktokUrl!}"),
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

/// Opens [uri]; tells the user when no app can handle it (e.g. no mail app)
/// instead of failing silently or throwing an unhandled error.
Future<void> _open(
  Uri uri, {
  LaunchMode mode = LaunchMode.platformDefault,
}) async {
  bool opened = false;
  try {
    opened = await launchUrl(uri, mode: mode);
  } catch (e) {
    debugPrint('Could not open $uri: $e');
  }
  if (!opened) kheasydevAppToast(t.something_went_wrong);
}

/// Converts a local Israeli number like 055-3180148 to 972553180148.
String _internationalNumber(String phone) {
  final digits = phone.replaceAll(RegExp(r'[^0-9]'), '');
  return digits.startsWith('0') ? '972${digits.substring(1)}' : digits;
}
