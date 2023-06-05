// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Todo {
  Todo({
    required this.id,
    required this.description,
    required this.subtitle,
    required this.title,
    this.completed = false,
  });

  final int id;
  final String title;
  final String subtitle;
  final String description;
  bool completed; // this will track the completion of todos

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'description': description, 
      
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as int,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        subtitle.hashCode ^
        description.hashCode;
  }
}
