import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabSliverDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final bool space;
  TabSliverDelegate(this.tabBar, {this.space = false});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
      padding: EdgeInsets.only(left: 15, right: space ? 120 : 15),
      child: tabBar,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => tabBar.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
