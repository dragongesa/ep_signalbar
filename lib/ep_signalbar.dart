library ep_signalbar;

import 'package:flutter/material.dart';

class EPSignalBar extends StatefulWidget {
  final Color? barOnlineColor;
  final Color? barOfflineColor;
  final Color? barBackgroundColor;
  final Color? barBorderColor;
  final int barCount;
  final int initBarValue;
  final double barHeight;
  final double barWidth;
  final Duration animationDuration;
  final Curve? animationCurve;

  late final _EPSignalBarState state = _EPSignalBarState();

  EPSignalBar(
      {Key? key,
      this.barOnlineColor,
      this.barOfflineColor,
      this.barBackgroundColor,
      this.barBorderColor,
      this.barCount = 0,
      this.barHeight = 0,
      this.barWidth = 0,
      this.animationDuration = kThemeAnimationDuration,
      this.animationCurve,
      this.initBarValue = 0})
      : super(key: key);

  @override
  _EPSignalBarState createState() {
    return state;
  }
}

class _EPSignalBarState extends State<EPSignalBar> {
  late double barHeight = widget.barHeight;
  late double barWidth = widget.barWidth;
  late Color barOnlineColor =
      widget.barOnlineColor ?? Color.fromRGBO(0, 140, 0, 1.0);
  late Color barOfflineColor =
      widget.barOfflineColor ?? Color.fromRGBO(125, 125, 125, 1.0);
  late Color barBackgroundColor =
      widget.barBackgroundColor ?? Colors.transparent;
  late Color barBorderColor = widget.barBorderColor ?? Colors.transparent;
  late int barCount = widget.barCount > 0 ? widget.barCount : 5;
  late Duration animationDuration = widget.animationDuration;
  int _curBar = 0;

  double _getBarHeight(int barIndex) {
    return _getHPercent(15 * (5 / widget.barCount)) +
        (barIndex * _getHPercent(10 * (5 / widget.barCount)));
  }

  double _getBarWidth() {
    return ((barWidth - 20) / widget.barCount) -
        _getWPercent(6 * (5 / widget.barCount));
  }

  double _getBarCircular() {
    return _getBarWidth() * (22 / 100);
  }

  Widget buildBarWidget() {
    List<AnimatedContainer> lstBar = [];
    for (int i = 0; i < widget.barCount; i++) {
      AnimatedContainer _a = AnimatedContainer(
          duration: widget.animationDuration,
          curve: widget.animationCurve ?? Curves.easeOut,
          margin: (widget.barCount - i) > 1
              ? EdgeInsets.only(right: _getWPercent(4 * (5 / widget.barCount)))
              : EdgeInsets.only(right: 0),
          height: _getBarHeight(i),
          width: _getBarWidth(),
          decoration: BoxDecoration(
            color: (_curBar - 1) < i
                ? widget.barOfflineColor
                : widget.barOnlineColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_getBarCircular()),
                topRight: Radius.circular(_getBarCircular())),
          ));
      lstBar.add(_a);
    }
    return Container(
      //alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      height: barHeight,
      width: barWidth,
      decoration: BoxDecoration(
          color: widget.barBackgroundColor,
          border: Border.all(
              width: 2,
              color: widget.barBorderColor ?? Theme.of(context).dividerColor),
          borderRadius: BorderRadius.only()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: lstBar,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildBarWidget();
  }

  void setBarNumber(int no) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        if (no < 0) no = 0;
        if (no > widget.barCount) no = widget.barCount;
        _curBar = no;
      });
    });
  }

  int getBarNumber() {
    return _curBar;
  }

  void setWidgetHeight(double v) {
    if (v < 40) v = 40; //. min height
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        barHeight = v;
      });
    });
  }

  void setWidgetWidth(double v) {
    if (v < 40) v = 40; //. min width
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        barWidth = v;
      });
    });
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  double _getHPercent(double p) {
    return (p / 100) * barHeight;
  }

  double _getWPercent(double p) {
    return (p / 100) * barWidth;
  }

  @override
  void initState() {
    barHeight = barHeight >= 40 ? barHeight : 100;
    barWidth = barWidth >= 40 ? barWidth : 130;
    if (widget.initBarValue >= 0 && widget.initBarValue <= widget.barCount) {
      _curBar = widget.initBarValue;
    } else {
      _curBar = widget.barCount;
    }

    super.initState();
  }
}
