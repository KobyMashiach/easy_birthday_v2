import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/design_kit/dividers.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';

class DrawerButtonModel {
  final String text;
  final Icon icon;

  /// Route name opened by the button (replaces the whole stack).
  final String? routeName;

  /// Receives the button's own context (e.g. to anchor a popover to it).
  final void Function(BuildContext buttonContext)? onTap;
  final bool enableColor;

  const DrawerButtonModel({
    required this.text,
    required this.icon,
    this.routeName,
    this.onTap,
    required this.enableColor,
  });
}

class DrawerDesign extends CustomPainter {
  final bool isLTR;
  final Color color;

  DrawerDesign({required this.isLTR, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    double startPoint = size.height * 0.75;

    if (isLTR) {
      // LTR wave
      _drawWave(canvas, size, paint, path, color, startPoint, size.width, 0);
    } else {
      // RTL wave
      _drawWave(canvas, size, paint, path, color, startPoint, 0, size.width);
    }
  }

  void _drawWave(
    Canvas canvas,
    Size size,
    Paint paint,
    Path path,
    Color color,
    double startPoint,
    double moveX,
    double lineX,
  ) {
    double firstWaveSize = 0.9;
    double waveAngle = size.width * 0.5;
    // First wave
    paint.color = color;
    path.moveTo(moveX, 0);
    path.lineTo(moveX, startPoint);
    path.quadraticBezierTo(
      waveAngle,
      size.height * firstWaveSize,
      lineX,
      size.height * firstWaveSize,
    );
    path.lineTo(lineX, 0);
    path.close();
    canvas.drawPath(path, paint);

    // Second wave with 0.7 opacity
    paint.color = color.withValues(alpha: 0.7);
    path.moveTo(moveX, 0);
    path.lineTo(moveX, startPoint);
    path.quadraticBezierTo(
      waveAngle,
      size.height * (firstWaveSize + 0.04),
      lineX,
      size.height * (firstWaveSize + 0.04),
    );
    path.lineTo(lineX, 0);
    path.close();
    canvas.drawPath(path, paint);

    // Third wave with 0.5 opacity
    paint.color = color.withValues(alpha: 0.5);
    path.moveTo(moveX, 0);
    path.lineTo(moveX, startPoint);
    path.quadraticBezierTo(
      waveAngle,
      size.height * (firstWaveSize + 0.06),
      lineX,
      size.height * (firstWaveSize + 0.06),
    );
    path.lineTo(lineX, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(DrawerDesign oldDelegate) =>
      oldDelegate.color != color || oldDelegate.isLTR != isLTR;
}

Widget kheasydevAppDrawerV2({
  required String name,
  String? profileImage,
  required Color color,
  List<DrawerButtonModel>? buttons,
  (String, String)? appDetails,
  double? buttonsTextSize,
  required BuildContext context,
}) {
  final bool isRtl = Directionality.of(context) == TextDirection.rtl;
  final Size screenSize = MediaQuery.sizeOf(context);
  final double screenWidth = screenSize.width * 0.8;
  final double screenHeight = screenSize.height;
  return Container(
    width: screenWidth,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: isRtl
          ? const BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            )
          : const BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
    ),
    child: ClipRRect(
      borderRadius: isRtl
          ? const BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            )
          : const BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
      child: Stack(
        children: [
          CustomPaint(
            painter: DrawerDesign(isLTR: !isRtl, color: color),
            child: Container(),
          ),
          _closeButton(context, isRtl),
          _inColorMenu(
            context,
            screenWidth,
            screenHeight,
            buttonsTextSize,
            name,
            profileImage,
            isRtl,
            buttons,
          ),
          if (appDetails != null)
            _outColorInfo(context, isRtl, screenHeight, appDetails),
        ],
      ),
    ),
  );
}

Widget _inColorMenu(
  BuildContext context,
  double screenWidth,
  double screenHeight,
  double? buttonsTextSize,
  String name,
  String? profileImage,
  bool isRtl,
  List<DrawerButtonModel>? buttons,
) {
  final buttonsList = _buildDrawerButtons(
    context,
    screenWidth,
    buttonsTextSize,
    isRtl,
    buttons,
  );
  final bottomButtonsList = _buildBottomButtons(
    context,
    screenWidth,
    isRtl,
    buttonsTextSize,
  );

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: SizedBox(
      height: screenHeight * 0.8,
      width: screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 60),
              _title(context, screenWidth, name, profileImage),
              ListView.separated(
                shrinkWrap: true,
                itemCount: buttonsList.length,
                itemBuilder: (context, index) => buttonsList[index],
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 30),
              ),
            ],
          ),
          Column(
            children: [
              kheasydevDivider(),
              ListView.separated(
                shrinkWrap: true,
                itemCount: bottomButtonsList.length,
                itemBuilder: (context, index) => bottomButtonsList[index],
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

List<Widget> _buildDrawerButtons(
  BuildContext context,
  double screenWidth,
  double? buttonsTextSize,
  bool isRtl,
  List<DrawerButtonModel>? buttons,
) {
  return buttons?.map((button) {
        return _buttons(
          context,
          screenWidth,
          buttonsTextSize,
          icon: button.icon.icon!,
          text: button.text,
          enableColor: button.enableColor,
          isRtl: isRtl,
          onTap:
              button.onTap ??
              switch (button.routeName) {
                null => null,
                // Close the drawer first: going to the current location again
                // wouldn't close it.
                final String routeName => (_) {
                  Navigator.of(context).pop();
                  context.goNamed(routeName);
                },
              },
        );
      }).toList() ??
      [];
}

List<Widget> _buildBottomButtons(
  BuildContext context,
  double screenWidth,
  bool isRtl,
  double? buttonsTextSize,
) {
  return _getBottomList().map((button) {
    return _buttons(
      context,
      screenWidth,
      buttonsTextSize,
      icon: button.icon.icon!,
      text: button.text,
      enableColor: button.enableColor,
      isRtl: isRtl,
      // The original returned the callback instead of calling it, so Share
      // and Rate did nothing.
      onTap:
          button.onTap ??
          switch (button.routeName) {
            null => null,
            final String routeName => (_) => context.pushNamed(routeName),
          },
    );
  }).toList();
}

Positioned _closeButton(BuildContext context, bool isRtl) {
  return Positioned(
    left: isRtl ? 10 : null,
    right: !isRtl ? 10 : null,
    top: 30,
    child: IconButton(
      tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
      constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
      onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(Icons.cancel_outlined, color: Colors.white, size: 24),
    ),
  );
}

Widget _buttons(
  BuildContext context,
  double screenWidth,
  double? buttonsTextSize, {
  required IconData icon,
  required String text,
  required bool isRtl,
  required bool enableColor,
  void Function(BuildContext buttonContext)? onTap,
}) {
  final iconTextColor = enableColor ? Colors.white : Colors.grey[300];
  return Padding(
    padding: EdgeInsets.only(
      right: isRtl ? screenWidth * 0.05 : 0,
      left: !isRtl ? screenWidth * 0.05 : 0,
    ),
    child: Builder(
      builder: (buttonContext) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap == null ? null : () => onTap(buttonContext),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 44),
          child: Row(
            children: [
              Icon(icon, color: iconTextColor, size: 24),
              const SizedBox(width: 12),
              // Large system text must not overflow the drawer's width.
              Flexible(
                child: Text(
                  text,
                  style: TextStyle(
                    color: iconTextColor,
                    fontSize: buttonsTextSize ?? 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _title(
  BuildContext context,
  double screenWidth,
  String name,
  String? profileImage,
) {
  return Column(
    children: [
      Row(
        children: [
          if (profileImage != null)
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: profileImage,
                  fit: BoxFit.cover,
                  memCacheWidth: 192,
                  errorWidget: (_, _, _) =>
                      const Icon(Icons.person, color: Colors.white),
                ),
              ),
            ),
          const SizedBox(width: 24),
          Flexible(
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 12),
      kheasydevDivider(),
    ],
  );
}

Widget _outColorInfo(
  BuildContext context,
  bool isRtl,
  double screenHeight,
  (String, String) appDetails,
) {
  return Positioned(
    left: isRtl ? 10 : null,
    right: !isRtl ? 10 : null,
    bottom: screenHeight * 0.05,
    child: Text(
      "${appDetails.$1}\nv${appDetails.$2}",
      textAlign: TextAlign.left,
    ),
  );
}

List<DrawerButtonModel> _getBottomList() => [
  DrawerButtonModel(
    text: t.contact_us,
    icon: const Icon(Icons.contact_page),
    enableColor: true,
    routeName: Routing.contactUs,
  ),
  DrawerButtonModel(
    text: t.share_app,
    icon: const Icon(Icons.share),
    enableColor: true,
    onTap: _shareApp,
  ),
  DrawerButtonModel(
    text: t.rate_app,
    icon: const Icon(Icons.rate_review),
    enableColor: true,
    onTap: (_) => _rateApp(),
  ),
];

/// Store page to share: the App Store once [appStoreUrl] is set,
/// otherwise the Play Store page (also on iOS).
String get _storeUrl => defaultTargetPlatform == TargetPlatform.iOS
    ? appStoreUrl ?? playStoreUrl
    : playStoreUrl;

Future<void> _shareApp(BuildContext buttonContext) async {
  // Sharing isn't available on web.
  if (kIsWeb) return;
  // iPad shows the share sheet as a popover, which needs an anchor rect.
  final RenderObject? box = buttonContext.findRenderObject();
  final Rect? origin = box is RenderBox && box.hasSize
      ? box.localToGlobal(Offset.zero) & box.size
      : null;
  try {
    await SharePlus.instance.share(
      ShareParams(
        text: t.share_app_message(url: _storeUrl),
        sharePositionOrigin: origin,
      ),
    );
  } catch (e) {
    debugPrint('Share app failed: $e');
  }
}

Future<void> _rateApp() async {
  try {
    final InAppReview inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) await inAppReview.requestReview();
  } catch (e) {
    debugPrint('Rate app failed: $e');
  }
}
