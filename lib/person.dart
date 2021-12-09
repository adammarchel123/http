class Person {
  final String id;
  final String name;
  final String image;
  final String message;

  Person(
      {required this.id,
      required this.name,
      required this.image,
      required this.message});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      name: '${json['first_name']} ${json['last_name']}',
      image: json['image'],
      message: json['message'],
    );
  }
}
