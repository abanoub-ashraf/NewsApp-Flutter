class MenuModel {
    String? id;
    String? name;

    MenuModel({
        this.id, 
        this.name
    });

    factory MenuModel.fromJson(Map<String, dynamic> json) {
        return MenuModel(
            id: json['id'],
            name: json['name']
        );
    }
}