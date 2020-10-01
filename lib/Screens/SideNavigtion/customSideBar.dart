import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:ui/Screens/SideNavigtion/navigationTileModels.dart';

import 'navigationTile.dart';
import 'package:ui/colorConstants.dart';

int widths;

class CustomNavigationBar extends StatefulWidget {
  final int index;
  final Function changeIndex;
  final double width;
  final Function widthChange;

  CustomNavigationBar(
      {this.index, this.changeIndex, this.width, this.widthChange});

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar>
    with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  double minWidth = 68;
  bool isCollapsed = true;
  AnimationController _animationController;
  Animation<double> widthAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: minWidth, end: maxWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => dashBoard(),
    );
  }

  Widget dashBoard() {
    return Opacity(
      opacity: 0.89,
      child: Container(
        color: loginReminderColor,
        width: widthAnimation.value,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: navigationTiles.length,
                  itemBuilder: (context, index) {
                    return NavigationTile(
                      onTap: () => widget.changeIndex(index),
                      isSelected: widget.index == index,
                      icon: navigationTiles[index].icon,
                      title: navigationTiles[index].title,
                      animationController: _animationController,
                    );
                  }),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed
                      ? _animationController.reverse()
                      : _animationController.forward();
                });
              },
              child: Icon(
                isCollapsed ? Icons.menu : Icons.keyboard_backspace,
                size: 40,
                //  progress: _animationController,
                color: secondaryTheme,
              ),
            )
          ],
        ),
      ),
    );
  }
}
