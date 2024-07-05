class Player {
  String name;
  String number;

  Player({required this.name, required this.number});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json['name'],
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'number': number,
    };
  }
}
