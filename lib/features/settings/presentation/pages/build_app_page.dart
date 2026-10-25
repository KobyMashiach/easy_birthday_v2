import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BuildAppPage extends StatefulWidget {
  final int loadingTime;
  final String? description;

  /// Route name the stack is reset to once loading finishes.
  final String nextRoute;

  const BuildAppPage({
    super.key,
    required this.loadingTime,
    this.description,
    this.nextRoute = Routing.home,
  });

  @override
  State<BuildAppPage> createState() => _BuildAppPageState();
}

class _BuildAppPageState extends State<BuildAppPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(
        duration: Duration(seconds: widget.loadingTime),
        vsync: this,
      )..addStatusListener((status) {
        if (status == AnimationStatus.completed && mounted) {
          context.goNamed(widget.nextRoute);
        }
      });

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.build_app),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              t.build_app_description,
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            // Only the progress repaints on each tick, not the whole page.
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) => Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      strokeWidth: 15.0,
                      value: _controller.value,
                      backgroundColor: AppColors.disableColor,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primaryColor,
                      ),
                    ),
                  ),
                  Text(
                    '${(_controller.value * 100).toStringAsFixed(1)}%',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.description ?? "",
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
