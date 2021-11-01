import 'dart:convert';

import 'package:api_fetch/models/boxes_model.dart';
import 'package:http/http.dart' as http;

import '../models/menu_model.dart';
import '../models/slider_items_model.dart';
import '../utils/app_strings.dart';

class WebServices {
    Future<List<MenuModel>> fetchMenu() async {
        final response = await http.get(AppStrings.getMenuEndpoint);

        if (response.statusCode == 200) {
            List jsonResponse = json.decode(response.body);

            return jsonResponse
                .map(
                    (data) => MenuModel.fromJson(data)
                )
                .toList();
        } else {
            throw Exception('some error occurred!');
        }
    }

    Future<List<SliderItemsModel>> fetchSliderItems() async {
        final response = await http.get(AppStrings.getSliderItemsEndpoint);

        if (response.statusCode == 200) {
            List jsonResponse = json.decode(response.body);

            return jsonResponse
                .map(
                    (data) => SliderItemsModel.fromJson(data)
                )
                .toList();
        } else {
            throw Exception('some error occurred!');
        }
    }

    Future<List<BoxesModel>> fetchBoxes() async {
        final response = await http.get(AppStrings.getBoxesEndpoint);

        if (response.statusCode == 200) {
            List jsonResponse = json.decode(response.body);

            return jsonResponse
                .map(
                    (data) => BoxesModel.fromJson(data)
                )
                .toList();
        } else {
            throw Exception('some error occurred!');
        }
    }
}