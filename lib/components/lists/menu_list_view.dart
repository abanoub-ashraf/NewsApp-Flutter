import '../cards/menu_list_card.dart';
import 'package:flutter/material.dart';
import '../../models/menu_model.dart';

class MenuList extends StatefulWidget {
    final List<MenuModel>? menuData;

  const MenuList({
      Key? key,
      this.menuData,
  }) : super(key: key);

    @override
    _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
    @override
    Widget build(BuildContext context) {
        return ListView.builder(
            itemCount: widget.menuData?.length,
            itemBuilder: (context, index) {
                return MenuListCard(
                    menuItem: widget.menuData![index],
                );
            },
        );
    }
}