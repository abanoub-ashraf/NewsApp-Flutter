import 'package:api_fetch/screens/menu_screen.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../components/lists/boxes_list_view.dart';
import '../components/lists/slider_items_list_view.dart';
import '../components/widgets/menu_button.dart';
import '../models/boxes_model.dart';
import '../models/slider_items_model.dart';
import '../services/web_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
    const HomeScreen({ Key? key }) : super(key: key);

    @override
    _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    final WebServices _webServices = WebServices();

    late Future<List<SliderItemsModel>> futureSliderItemsData;
    late Future<List<BoxesModel>> futureBoxesData;

    Widget buildTextWidget(String text) {
        return Text(
            text,
            style: const TextStyle(
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
        );
    }

    @override
    void initState() {
        super.initState();

        futureSliderItemsData   = _webServices.fetchSliderItems();
        futureBoxesData         = _webServices.fetchBoxes();
    }
    
    @override
    Widget build(BuildContext context) {
        final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

        return SideMenu(
            key: _sideMenuKey,
            maxMenuWidth: MediaQuery.of(context).size.width * 0.7,
            closeIcon: const Icon(
                Icons.close, 
                size: 25,
            ),
            menu: const MenuScreen(),
            inverse: true,
            type: SideMenuType.shrikNRotate,
            background: Colors.white,
            radius: const BorderRadius.all(
                Radius.circular(40),
            ),
            child: Scaffold(
                backgroundColor: Colors.grey.shade300,
                body: SingleChildScrollView(
                    child: Column(
                        children: [
                            FutureBuilder<List<SliderItemsModel>>(
                                future: futureSliderItemsData,
                                builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                        List<SliderItemsModel> data = snapshot.data!;
                                        return Stack(
                                            children: [
                                                SizedBox(
                                                    height: MediaQuery.of(context).size.height * 0.4,
                                                    width: MediaQuery.of(context).size.width,
                                                    child: SliderItemsList(
                                                        sliderItemsData: data,
                                                    ),
                                                ),
                                                MenuButton(sideMenuKey: _sideMenuKey,),
                                            ],
                                        );
                                    } else if (snapshot.hasError) {
                                        return Text('${snapshot.error}');
                                    }
                                    return Container();
                                },
                            ),
                            const SizedBox(
                                height: 10,
                            ),
                            FutureBuilder<List<BoxesModel>>(
                                future: futureBoxesData,
                                builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                        List<BoxesModel> data = snapshot.data!;
                                        return Column(
                                            children: [
                                                Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 12,
                                                        left: 20,
                                                        right: 25,
                                                        bottom: 12,
                                                    ),
                                                    child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                            buildTextWidget('مشاهده الكل'),
                                                            buildTextWidget('آحدث الآخبار'),
                                                        ],
                                                    ),
                                                ),
                                                const SizedBox(
                                                    height: 10,
                                                ),
                                                SizedBox(
                                                    height: MediaQuery.of(context).size.height * 0.4,
                                                    width: MediaQuery.of(context).size.width, 
                                                    child: BoxesList(boxesData: data,),
                                                ),
                                            ],
                                        );
                                    } else if (snapshot.hasError) {
                                        return Text('${snapshot.error}');
                                    }
                                    return Container();
                                },
                            ),
                            const SizedBox(
                                height: 30,
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}