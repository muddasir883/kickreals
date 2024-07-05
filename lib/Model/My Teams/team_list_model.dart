// models/team_model.dart
class Team {
  String title;
  String desc;
  bool status;

  Team({
    required this.title,
    required this.desc,
    required this.status,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      title: json['title'],
      desc: json['desc'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'desc': desc,
      'status': status,
    };
  }
}
