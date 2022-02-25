class CharactersModel {
  String? id;

  String? name;

  String? date;

  List occupation = [];

  String? img;

  String? status;

  String? nickname;

  String? portrayed;
  String ? category ;
  List appearance = [];

  CharactersModel.fromJson(json) {
    id = json['id'];
    name = json['name'];
    date = json['date'];
    img = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    portrayed = json['portrayed'];
    category = json['category'];
    json['occupation'].forEach((element) {
      occupation.add(element);
    });

    json['appearance'].forEach((element) {
      appearance.add(element);
    });
  }
}
