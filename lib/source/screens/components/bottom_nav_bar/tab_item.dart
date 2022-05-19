// tab_item.dart
import 'package:flutter/material.dart';

enum TabItem {
  home,
  more,
}

const Map<TabItem, String> tabName = {
  TabItem.home: 'Home',
  TabItem.more: 'More',
};

const Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.home: Colors.blue,
  TabItem.more: Colors.blue,
};
