class Information {

  final String title;
  final String imageLink;
  final String text;

  Information({
    required this.title,
    required this.imageLink,
    required this.text
  });

  factory Information.fromJson(dynamic json) {
    return Information(
        title: json['title'] as String,
        imageLink: json['imageLink'] as String,
        text: json['text'] as String
    );
  }

}