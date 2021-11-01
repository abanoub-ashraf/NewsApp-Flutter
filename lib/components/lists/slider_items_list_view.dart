import '../cards/slider_item_card.dart';
import 'package:flutter/material.dart';

import '../../models/slider_items_model.dart';
import 'package:flutter/rendering.dart';

class SliderItemsList extends StatefulWidget {
    final List<SliderItemsModel>? sliderItemsData;

    const SliderItemsList({
        Key? key,
        this.sliderItemsData,
    }) : super(key: key);

    @override
    _SliderItemsListState createState() => _SliderItemsListState();
}

class _SliderItemsListState extends State<SliderItemsList> {
    int currentPage = 0;

    Widget buildIndicators() {
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                ...widget.sliderItemsData!.map((item) {
                    final index = widget.sliderItemsData!.indexOf(item);
                    return Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentPage == index 
                                ? Colors.blueGrey.shade700 
                                : Colors.grey,
                        ),
                    );
                }).toList()
            ],
        );
    }

    @override
    Widget build(BuildContext context) {
        return Column(
            children: [
                Expanded(
                    child: PageView.builder(
                        onPageChanged: (index) {
                            setState(() {
                                currentPage = index;
                            });
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.sliderItemsData?.length,
                        controller: PageController(
                            initialPage: 0,
                        ),
                        itemBuilder: (context, index) {
                            return SliderItemCard(
                                item: widget.sliderItemsData![index],
                            );
                        },
                    ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5,
                    ),
                    child: buildIndicators(),
                ),
            ],
        );
    }
}