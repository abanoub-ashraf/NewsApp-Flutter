class SliderItemsModel {
    String? id;
    String? title;
    String? mainphoto;

    SliderItemsModel({
        this.id, 
        this.title, 
        this.mainphoto
    });

    factory SliderItemsModel.fromJson(Map<String, dynamic> json) {
        return SliderItemsModel(
            id: json['id'],
            title: json['title'],
            mainphoto: json['mainphoto'],
        );
    }
}