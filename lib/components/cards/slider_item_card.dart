import 'package:api_fetch/models/slider_items_model.dart';
import 'package:api_fetch/utils/app_strings.dart';
import 'package:flutter/material.dart';

class SliderItemCard extends StatelessWidget {
    final SliderItemsModel item;

    const SliderItemCard({
        Key? key, 
        required this.item,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        final parentHeight  = MediaQuery.of(context).size.height * 0.4;
        final parentWidth   = MediaQuery.of(context).size.width;

        return SizedBox(
            height: parentHeight, 
            width: parentWidth,
            child: Stack(
                children: [
                    Container(
                        alignment: Alignment.center,
                        child: FadeInImage.assetNetwork(
                            placeholder: AppStrings.loadingImageString,
                            image: item.mainphoto.toString(),
                            fit: BoxFit.cover,
                            height: parentHeight,
                            width: parentWidth,
                        ),
                    ),
                    Container(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            color: Colors.black54,
                            padding: EdgeInsets.symmetric(
                                horizontal: parentWidth * 0.08,
                                vertical: parentHeight * 0.010,
                            ),
                            child: Text(
                                item.title.toString(),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    shadows: [
                                        Shadow(
                                            color: Colors.black,
                                            offset: Offset(0, 5),
                                            blurRadius: 40,
                                        ),
                                    ],
                                ),
                            ),
                        ),
                    ),
                ],
            ),
        );
    }
}