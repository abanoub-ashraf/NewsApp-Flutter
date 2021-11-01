class BoxesModel {
    String? id;
    String? name;
    String? email;
    String? username;
    String? dateorder;
    String? since;

    BoxesModel({
        this.id, 
        this.name, 
        this.email, 
        this.username, 
        this.dateorder, 
        this.since,
    });

    factory BoxesModel.fromJson(Map<String, dynamic> json) {
        return BoxesModel(
            id: json['id'],
            name: json['name'],
            email: json['email'],
            username: json['username'],
            dateorder: json['dateorder'],
            since: json['since']
        );
    }
}