import 'dart:ui';
import 'package:flutter/material.dart';

class AppLifecycleOverlay extends StatefulWidget {
  const AppLifecycleOverlay({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<AppLifecycleOverlay> createState() => _AppLifecycleOverlayState();
}

class _AppLifecycleOverlayState extends State<AppLifecycleOverlay>
    with WidgetsBindingObserver {
  bool shouldBlur = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      shouldBlur = state == AppLifecycleState.inactive ||
          state == AppLifecycleState.paused;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (shouldBlur) {
      return Stack(
        children: [
          widget.child,
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade200.withOpacity(0.5),
            ),
          ),
        ],
      );
    }

    return widget.child;
  }
}
