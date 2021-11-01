import 'package:api_fetch/models/boxes_model.dart';
import 'package:api_fetch/utils/app_strings.dart';
import 'package:flutter/material.dart';

class BoxesCard extends StatelessWidget {
    final BoxesModel box;

    const BoxesCard({
        Key? key, 
        required this.box,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        final parentHeight  = MediaQuery.of(context).size.height * 0.4;
        final parentWidth   = MediaQuery.of(context).size.width;

        return SizedBox(
            child: Container(
                height: parentHeight,
                width: parentWidth,
                margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                ),
                child: LayoutBuilder(
                    builder: (context, constraints) => Column(
                        children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: FadeInImage.assetNetwork(
                                    placeholder: AppStrings.loadingImageString,
                                    image: box.email.toString(),
                                    fit: BoxFit.cover,
                                    height: constraints.maxHeight * 0.6,
                                    width: parentWidth,
                                ),
                            ),
                            Container(
                                height: constraints.maxHeight * 0.4,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                        Text(
                                            box.name.toString(),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                        Text(
                                            box.dateorder.toString(),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: Colors.blueGrey.shade700,
                                                fontSize: 14,
                                            ),
                                        ),
                                        Text(
                                            box.since.toString(),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: Colors.blueGrey.shade700,
                                                fontSize: 14,
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}