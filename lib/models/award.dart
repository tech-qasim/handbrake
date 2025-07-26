import 'dart:convert';

class Award {
  String title;
  int daysRequired;
  Award({required this.title, required this.daysRequired});

  Award copyWith({String? title, int? daysRequired}) {
    return Award(
      title: title ?? this.title,
      daysRequired: daysRequired ?? this.daysRequired,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'daysRequired': daysRequired});

    return result;
  }

  factory Award.fromMap(Map<String, dynamic> map) {
    return Award(
      title: map['title'] ?? '',
      daysRequired: map['daysRequired']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Award.fromJson(String source) => Award.fromMap(json.decode(source));

  @override
  String toString() => 'Award(title: $title, daysRequired: $daysRequired)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Award &&
        other.title == title &&
        other.daysRequired == daysRequired;
  }

  @override
  int get hashCode => title.hashCode ^ daysRequired.hashCode;
}
