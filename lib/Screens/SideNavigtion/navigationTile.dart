import 'package:flutter/material.dart';
import 'package:ui/colorConstants.dart';

class NavigationTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;
  final Function onTap;
  final bool isSelected;
  NavigationTile(
      {this.icon,
      this.title,
      this.animationController,
      this.isSelected: false,
      this.onTap});

  @override
  _NavigationTileState createState() => _NavigationTileState();
}

class _NavigationTileState extends State<NavigationTile>
    with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  double minWidth = 68;
  Animation<double> widthAnimation;
  @override
  void initState() {
    super.initState();

    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        width: widthAnimation.value,
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: [
            Icon(widget.icon,
                size: widget.isSelected ? 35 : 32,
                color: widget.isSelected ? purple : Colors.white),
            SizedBox(
              width: 10,
            ),
            (widthAnimation.value >= 230)
                ? Text(widget.title,
                    style: widget.isSelected
                        ? TextStyle(fontSize: 20, color: Colors.white)
                        : TextStyle(fontSize: 15, color: Colors.grey[300]))
                : Container(),
          ],
        ),
      ),
    );
  }
}
