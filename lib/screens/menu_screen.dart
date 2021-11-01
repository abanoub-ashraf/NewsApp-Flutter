import '../components/lists/menu_list_view.dart';
import '../models/menu_model.dart';
import '../services/web_services.dart';
import '../utils/app_strings.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
    const MenuScreen({ Key? key }) : super(key: key);

    @override
    _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
    late Future<List<MenuModel>> futureMenuData;

    final WebServices _webServices = WebServices();

    @override
    void initState() {
        super.initState();
        
        futureMenuData = _webServices.fetchMenu();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
                bottom: false,
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                        children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    InkWell(
                                        onTap: () {
                                            Navigator.of(context).pop();
                                        },
                                        child: Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.black45,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(2),
                                                ),
                                            ),
                                            child: const Icon(
                                                Icons.close, 
                                                size: 25,
                                            ),
                                        ),
                                    ),
                                    const Text(
                                        'القائمه الرئيسيه',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                                Shadow(
                                                    color: Colors.black54,
                                                    offset: Offset(0, 10),
                                                    blurRadius: 20,
                                                ),
                                            ],
                                        ),
                                    ),
                                ]
                            ),
                            Expanded(
                              child: FutureBuilder<List<MenuModel>>(
                                  future: futureMenuData,
                                  builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                          List<MenuModel> data = snapshot.data ?? [];
                                          return MenuList(
                                                  menuData: data,
                                              );
                                      } else if (snapshot.hasError) {
                                          return Text('${snapshot.error}');
                                      }
                                      return Center(
                                          child: Image.asset(
                                              AppStrings.loadingImageString,
                                          ),
                                      );
                                  },
                              ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}