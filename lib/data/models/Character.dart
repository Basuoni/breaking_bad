class Character {
  int? charId;
  String? name;
  String? birthday;
  String? img;
  String? status;
  String? nickname;
  String? portrayed;
  String? category;
  List<String>? occupation;
  List<int>? appearance;
  List<int>? betterCallSaulAppearance;

  Character(
      {this.charId,
        this.name,
        this.birthday,
        this.occupation,
        this.img,
        this.status,
        this.nickname,
        this.appearance,
        this.portrayed,
        this.category,
        this.betterCallSaulAppearance});

  Character.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    occupation = json['occupation'].cast<String>();
    img = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    appearance = json['appearance'].cast<int>();
    portrayed = json['portrayed'];
    category = json['category'];
    betterCallSaulAppearance = json['better_call_saul_appearance'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['char_id'] = charId;
    data['name'] = name;
    data['birthday'] = birthday;
    data['occupation'] = occupation;
    data['img'] = img;
    data['status'] = status;
    data['nickname'] = nickname;
    data['appearance'] = appearance;
    data['portrayed'] = portrayed;
    data['category'] = category;
    data['better_call_saul_appearance'] = betterCallSaulAppearance;
    return data;
  }
}