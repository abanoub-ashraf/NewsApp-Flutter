import '../cards/boxes_card.dart';
import '../../models/boxes_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BoxesList extends StatefulWidget {
    final List<BoxesModel>? boxesData;

  const BoxesList({
      Key? key,
      this.boxesData,
  }) : super(key: key);

    @override
    _BoxesListState createState() => _BoxesListState();
}

class _BoxesListState extends State<BoxesList> {
    @override
    Widget build(BuildContext context) {
        return PageView.builder(
            controller: PageController(
                initialPage: 0,
                viewportFraction: 0.8,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: widget.boxesData?.length,
            itemBuilder: (context, index) {
                return BoxesCard(
                    box: widget.boxesData![index],
                );
            },
        );
    }
}