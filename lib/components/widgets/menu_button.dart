import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
    final GlobalKey<SideMenuState> sideMenuKey;

    const MenuButton({ 
        Key? key,
        required this.sideMenuKey
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return SafeArea(
            child: Container(
                height: 40,
                width: 40,
                // alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.85, 
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
                        // Navigator.push(
                        //     context, 
                        //     MaterialPageRoute(
                        //         builder: (_) => const MenuScreen(),
                        //         fullscreenDialog: true,
                        //     ),
                        // );
                        final _state = sideMenuKey.currentState;
                        
                        if (_state!.isOpened) {
                            _state.closeSideMenu(); // close side menu
                        } else {
                            _state.openSideMenu();// open side menu
                        }
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