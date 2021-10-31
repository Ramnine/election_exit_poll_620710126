class Exitpoll {
  final int id;
  final String title;
  final String firstname;
  final String lastname;


  Exitpoll({
    required this.id,
    required this.title,
    required this.firstname,
    required this.lastname,
  });

  factory Exitpoll.fromJson(Map<String, dynamic> json) {
    return Exitpoll(
      id: json['candidateNumber'],
      title: json['candidateTitle'],
      firstname: json['candidateFirstName'],
      lastname: json['candidateLastName'],
    );
  }

  Exitpoll.fromJson2(Map<String, dynamic> json)
      : id = json['candidateNumber'],
        title = json['candidateTitle'],
        firstname = json['candidateFirstName'],
        lastname = json['candidateLastName'];

  @override
  String toString() {
    return '$id: $title $firstname $lastname';
  }
}
