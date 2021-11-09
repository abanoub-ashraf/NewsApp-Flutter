import '../../models/menu_model.dart';
import 'package:flutter/material.dart';

class MenuListCard extends StatelessWidget {
    final MenuModel menuItem;

    const MenuListCard({ 
        Key? key, 
        required this.menuItem,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
                elevation: 3,
                margin: const EdgeInsets.all(8),
                color: Colors.grey.shade200,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Container(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                                menuItem.name.toString(),
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 17,
                                ),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}