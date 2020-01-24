library ep_signalbar;

import 'dart:ui';
import 'package:flutter/material.dart';

class EPSignalBar extends StatefulWidget {
  Color  barOnlineColor;
  Color  barOfflineColor;
  Color  barBackgroundColor;
  Color  barBorderColor;
  int barCount = 0;
  int initBarValue = 0;
  double barHeight = 0;
  double barWidth = 0;
  Duration animationDuration;
  Curve animationCurve;

  _EPSignalBarState state;

  EPSignalBar({Key key,
    this.barOnlineColor, this.barOfflineColor,
    this.barBackgroundColor, this.barBorderColor,
    this.barCount, this.barHeight,
    this.barWidth, this.animationDuration,
    this.animationCurve, this.initBarValue


  }) : super(key: key);

  @override
  _EPSignalBarState createState(){
    return state = _EPSignalBarState();
  }
}
class _EPSignalBarState extends State<EPSignalBar> {

  int _curBar = 0;

  double _getBarHeight(int barIndex){
    return _getHPercent(15 * (5 / widget.barCount)) + (barIndex * _getHPercent(10 * (5 / widget.barCount)));
  }

  double _getBarWidth(){
    return ((widget.barWidth - 20) / widget.barCount) - _getWPercent(6 * (5 / widget.barCount));
  }

  double _getBarCircular(){
    return  _getBarWidth() * (22/100);
  }

  Widget buildBarWidget(){
    List<AnimatedContainer> lstBar = [];
    for (int i = 0; i < widget.barCount; i++){
      AnimatedContainer _a = AnimatedContainer(
          duration: widget.animationDuration,
          curve: widget.animationCurve,
          margin: (widget.barCount - i ) > 1 ? EdgeInsets.only(right: _getWPercent(4 * (5 / widget.barCount))) : EdgeInsets.only(right:0),
          height: _getBarHeight(i),
          width: _getBarWidth(),
          decoration: BoxDecoration(
            color:  (_curBar - 1)  < i ? widget.barOfflineColor : widget.barOnlineColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_getBarCircular()),
                topRight: Radius.circular(_getBarCircular())
            ),
          )
      );
      lstBar.add(_a);
    }
    return Container(
      //alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      height: widget.barHeight,
      width: widget.barWidth,
      decoration: BoxDecoration(
          color: widget.barBackgroundColor,
          border: Border.all(width: 2, color: widget.barBorderColor),
          borderRadius: BorderRadius.only(

          )
      ),
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

  void setBarNumber(int no){
    setState(() {
      if (no < 0) no = 0;
      if (no > widget.barCount) no = widget.barCount;
      _curBar = no;
    });
  }

  int getBarNumber(){
    return _curBar;
  }

  void setWidgetHeight(double v){
    if (v < 40) v = 40; //. min height
    setState(() {
      widget.barHeight = v;
    });
  }

  void setWidgetWidth(double v){
    if (v < 40) v = 40; //. min width
    setState(() {
      widget.barWidth = v;
    });
  }

  double _getHPercent(double p){
    return (p / 100) * widget.barHeight;
  }

  double _getWPercent(double p){
    return (p / 100) * widget.barWidth;
  }

  @override
  void initState() {
    //. set default value if null
    if (widget.barCount == null) widget.barCount = 0;
    if (widget.barHeight == null) widget.barHeight = 0;
    if (widget.barWidth == null) widget.barWidth = 0;
    if (widget.initBarValue == null) widget.initBarValue = 0;
    if (widget.animationCurve == null) widget.animationCurve = Curves.easeIn;
    widget.barOnlineColor = widget.barOnlineColor ?? Color.fromRGBO(0, 140, 0, 1.0);
    widget.barOfflineColor = widget.barOfflineColor ?? Color.fromRGBO(125, 125, 125, 1.0);
    widget.barBackgroundColor = widget.barBackgroundColor ?? Colors.transparent;
    widget.barBorderColor = widget.barBorderColor ?? Colors.transparent;
    widget.barCount = widget.barCount > 0 ? widget.barCount : 5 ;
    widget.animationDuration = widget.animationDuration ?? Duration(milliseconds: 300);
    widget.barHeight = widget.barHeight >= 40 ? widget.barHeight : 100 ;
    widget.barWidth = widget.barWidth >= 40 ? widget.barWidth : 130;
    widget.animationCurve = widget.animationCurve  ;
    if (widget.initBarValue >= 0 && widget.initBarValue <= widget.barCount){
      _curBar = widget.initBarValue;
    }else{
      _curBar = widget.barCount;
    }


    super.initState();
  }
}
