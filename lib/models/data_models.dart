class HomeData {
  String appDevString;
  String homeImageUrl;
  String nameString;
  int numOfExperience;
  int numOfProjects;

  HomeData(
      {this.appDevString,
      this.homeImageUrl,
      this.nameString,
      this.numOfExperience,
      this.numOfProjects});

  HomeData.fromJson(Map<String, dynamic> json) {
    appDevString = json['appDevString'];
    homeImageUrl = json['homeImageUrl'];
    nameString = json['nameString'];
    numOfExperience = json['numOfExperience'];
    numOfProjects = json['numOfProjects'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appDevString'] = this.appDevString;
    data['homeImageUrl'] = this.homeImageUrl;
    data['nameString'] = this.nameString;
    data['numOfExperience'] = this.numOfExperience;
    data['numOfProjects'] = this.numOfProjects;
    return data;
  }
}
