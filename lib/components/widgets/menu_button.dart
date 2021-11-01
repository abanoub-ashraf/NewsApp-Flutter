import '../../screens/menu_screen.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
    const MenuButton({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return SafeArea(
            child: Container(
                height: 40,
                width: 40,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.03, 
                    top: MediaQuery.of(context).size.height * 0.03, 
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 3,
                    ),
                ),
                child: InkWell(
                    onTap: () {
                        Navigator.push(
                            context, 
                            MaterialPageRoute(
                                builder: (_) => const MenuScreen(),
                                fullscreenDialog: true,
                            ),
                        );
                    },
                    child: const CircleAvatar(
                        child: Icon(
                            Icons.menu, 
                            color: Colors.white,
                            size: 30,
                        ),
                        backgroundColor: Colors.transparent,
                    ),
                ),
            ),
        );
    }
}