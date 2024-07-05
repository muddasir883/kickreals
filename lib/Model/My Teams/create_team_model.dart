class Team {
  String name;
  String game;

  Team({required this.name, required this.game});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      name: json['name'],
      game: json['game'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'game': game,
    };
  }
}
