class reExitpoll {
  final int id;
  final String title;
  final String firstname;
  final String lastname;
  final int socre;

  reExitpoll({
    required this.id,
    required this.title,
    required this.firstname,
    required this.lastname,
    required this.socre,
  });

  factory reExitpoll.fromJson(Map<String, dynamic> json) {
    return reExitpoll(
      id: json['candidateNumber'],
      title: json['candidateTitle'],
      firstname: json['candidateFirstName'],
      lastname: json['candidateLastName'],
      socre: json['score']
    );
  }

  reExitpoll.fromJson2(Map<String, dynamic> json)
      : id = json['candidateNumber'],
        title = json['candidateTitle'],
        firstname = json['candidateFirstName'],
        lastname = json['candidateLastName'],
        socre = json['score'];

  @override
  String toString() {
    return '$id: $title $firstname $lastname';
  }
}
