import 'package:flutter/material.dart';

class TopSheet extends StatefulWidget {
  final Widget child;

  const TopSheet({super.key, required this.child});

  @override
  TopSheetState createState() => TopSheetState();
}

class TopSheetState extends State<TopSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        child: widget.child,
      ),
    );
  }
}
