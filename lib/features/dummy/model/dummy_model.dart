class SampleModel {
  String? name;
  String? image;
  String? desc;
  String? nameStadium;
  String? warna;

  SampleModel({this.name, this.image, this.desc, this.nameStadium, this.warna});

  SampleModel.fromJson(Map<String, dynamic> json) {
    name = json['strTeam'];
    image = json['strTeamBadge'];
    desc = json['strStadiumDescription'];
    nameStadium = json['strStadium'];
    warna = json['strKitColour1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strTeam'] = name;
    data['strTeamBadge'] = image;
    data['strStadiumDescription'] = desc;
    data['strStadium'] = nameStadium;
    data['strKitColour1'] = warna;
    return data;
  }
}
