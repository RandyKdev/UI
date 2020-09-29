import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:ui/Screens/SideNavigtion/navigationTileModels.dart';
import 'package:ui/Screens/dashBoardHeader.dart';

import 'navigationTile.dart';
import 'package:ui/colorConstants.dart';

int pageIndex = 2;

class CustomNavigationBar extends StatefulWidget {
  final int index;
  CustomNavigationBar({this.index});
  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar>
    with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  double minWidth = 68;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
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
      opacity: 0.9,
      child: Container(
        color: secondaryTheme,
        width: widthAnimation.value,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: navigationTiles.length,
                  itemBuilder: (context, index) {
                    return NavigationTile(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                          pageIndex = index;
                        });
                        print(pageIndex);
                      },
                      isSelected: currentIndex == index,
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
                      ? _animationController.forward()
                      : _animationController.reverse();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                size: 40,
                progress: _animationController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
