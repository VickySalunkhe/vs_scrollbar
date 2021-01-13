library vs_scrollbar;

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const Duration _kScrollbarFadeDuration = Duration(milliseconds: 300);
const Duration _kScrollbarTimeToFade = Duration(milliseconds: 600);

/// A material design scrollbar.
///
/// A scrollbar indicates which portion of a [Scrollable] widget is actually
/// visible.
///
/// Dynamically changes to an iOS style scrollbar that looks like
/// [CupertinoScrollbar] on the iOS platform.
///
/// To add a scrollbar to a [ScrollView], simply wrap the scroll view widget in
/// a [VsScrollbar] widget.
///
/// See also:
///
///  * [ListView], which display a linear, scrollable list of children.
///  * [GridView], which display a 2 dimensional, scrollable array of children.
class VsScrollbar extends StatefulWidget {
  /// Creates a material design scrollbar that wraps the given [child].
  ///
  /// The [child] should be a source of [ScrollNotification] notifications,
  /// typically a [Scrollable] widget.
  const VsScrollbar({
    Key key,
    @required this.child,
    this.color,
    this.thickness,
    this.radius,
    this.controller,
    this.allowDrag = true,
    this.isAlwaysShown = false,
    this.scrollbarFadeDuration = _kScrollbarFadeDuration,
    this.scrollbarTimeToFade = _kScrollbarTimeToFade,
  })  : assert(!isAlwaysShown || controller != null,
            'When isAlwaysShown is true, must pass a controller that is attached to a scroll view'),
        super(key: key);

  /// The widget below this widget in the tree.
  ///
  /// The scrollbar will be stacked on top of this child. This child (and its
  /// subtree) should include a source of [ScrollNotification] notifications.
  ///
  /// Typically a [ListView] or [CustomScrollView].
  final Widget child;

  /// {@macro flutter.cupertino.cupertinoScrollbar.controller}
  final ScrollController controller;

  /// {@macro flutter.cupertino.cupertinoScrollbar.isAlwaysShown}
  final bool isAlwaysShown;

  /// Allow drag scroll bar
  final bool allowDrag;

  final Color color;

  // sets thickness of CustomScrollBar
  final double thickness;

  // sets radius to the CustomScrollBar
  final double radius;

  final Duration scrollbarFadeDuration;
  final Duration scrollbarTimeToFade;

  @override
  _ScrollbarState createState() => _ScrollbarState();
}

class _ScrollbarState extends State<VsScrollbar> with TickerProviderStateMixin {
  ScrollbarPainter _materialPainter;
  TextDirection _textDirection;
  Color _themeColor;
  bool _useCupertinoScrollbar;
  AnimationController _fadeoutAnimationController;
  Animation<double> _fadeoutOpacityAnimation;
  Timer _fadeoutTimer;

  @override
  void initState() {
    super.initState();
    _fadeoutAnimationController = AnimationController(
      vsync: this,
      duration: widget.scrollbarFadeDuration,
    );
    _fadeoutOpacityAnimation = CurvedAnimation(
      parent: _fadeoutAnimationController,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    assert((() {
      _useCupertinoScrollbar = null;
      return true;
    })());
    _themeColor = widget.color ?? Colors.grey;
    _textDirection = Directionality.of(context);
    _materialPainter = _buildMaterialScrollbarPainter();
    _useCupertinoScrollbar = false;
    _triggerScrollbar();

    assert(_useCupertinoScrollbar != null);
  }

  @override
  void didUpdateWidget(VsScrollbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAlwaysShown != oldWidget.isAlwaysShown) {
      if (widget.isAlwaysShown == false) {
        _fadeoutAnimationController.reverse();
      } else {
        _triggerScrollbar();
        _fadeoutAnimationController.animateTo(1.0);
      }
    }
  }

  // Wait one frame and cause an empty scroll event.  This allows the thumb to
  // show immediately when isAlwaysShown is true.  A scroll event is required in
  // order to paint the thumb.
  void _triggerScrollbar() {
    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      if (widget.isAlwaysShown) {
        _fadeoutTimer?.cancel();
        widget.controller.position.didUpdateScrollPositionBy(0);
      }
    });
  }

  ScrollbarPainter _buildMaterialScrollbarPainter() {
    return ScrollbarPainter(
      radius: Radius.circular(widget.radius ?? 0),
      color: _themeColor,
      textDirection: _textDirection,
      thickness: widget.thickness ?? 8,
      fadeoutOpacityAnimation: _fadeoutOpacityAnimation,
      padding: MediaQuery.of(context).padding,
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    final ScrollMetrics metrics = notification.metrics;
    if (metrics.maxScrollExtent <= metrics.minScrollExtent) {
      return false;
    }

    // iOS sub-delegates to the CupertinoScrollbar instead and doesn't handle
    // scroll notifications here.
    if (!_useCupertinoScrollbar &&
        (notification is ScrollUpdateNotification ||
            notification is OverscrollNotification)) {
      if (_fadeoutAnimationController.status != AnimationStatus.forward) {
        _fadeoutAnimationController.forward();
      }

      _materialPainter.update(
        notification.metrics,
        notification.metrics.axisDirection,
      );
      if (!widget.isAlwaysShown) {
        _fadeoutTimer?.cancel();
        _fadeoutTimer = Timer(widget.scrollbarTimeToFade, () {
          _fadeoutAnimationController.reverse();
          _fadeoutTimer = null;
        });
      }
    }
    return false;
  }

  @override
  void dispose() {
    _fadeoutAnimationController.dispose();
    _fadeoutTimer?.cancel();
    _materialPainter?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_useCupertinoScrollbar)
      return CupertinoScrollbar(
          child: widget.child,
          isAlwaysShown: widget.isAlwaysShown,
          controller: widget.controller);

    return NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: GestureDetector(
          onHorizontalDragUpdate:
              widget.allowDrag ? _onHorizontalDragUpdate : null,
          onVerticalDragUpdate: widget.allowDrag ? _onVerticalDragUpdate : null,
          child: RepaintBoundary(
              child: CustomPaint(
                  foregroundPainter: _materialPainter,
                  child: RepaintBoundary(child: widget.child))),
        ));
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final total = widget.controller.position.maxScrollExtent;

    if (widget.controller.position.extentBefore > 0 ||
        widget.controller.position.extentAfter > 0) {
      if (details.localPosition.dx < 0) return widget.controller.jumpTo(0);

      final offSet = total /
          widget.controller.position.extentInside *
          details.localPosition.dx;

      if (offSet > total) return widget.controller.jumpTo(total);

      widget.controller.jumpTo(offSet);
    }
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    final total = widget.controller.position.maxScrollExtent;

    if (widget.controller.position.extentBefore > 0 ||
        widget.controller.position.extentAfter > 0) {
      if (details.localPosition.dy < 0) return widget.controller.jumpTo(0);

      final offSet = total /
          widget.controller.position.extentInside *
          details.localPosition.dy;

      if (offSet > total) return widget.controller.jumpTo(total);

      widget.controller.jumpTo(offSet);
    }
  }
}
