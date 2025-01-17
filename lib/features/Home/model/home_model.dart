// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HomeModel {
  HomeModel({
    required this.coverImage,
    required this.profilePicture,
    required this.pQuestion,
    required this.location,
    required this.age,
    required this.name,
    required this.views,
    required this.time,
    required this.answers,
    required this.answer,
  });

  final String location;
  final String age;
  final String name;
  final String views;
  final String time;
  final String answer;
  final String pQuestion;
  final String coverImage;
  final String profilePicture;
  final List<Answers> answers;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'location': location,
      'age': age,
      'name': name,
      'views': views,
      'time': time,
      'answer': answer,
      'pQuestion': pQuestion,
      'coverimage': coverImage,
      'profilepicture': profilePicture,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      location: map['location'] as String,
      age: map['age'] as String,
      name: map['name'] as String,
      views: map['views'] as String,
      time: map['time'] as String,
      answer: map['answer'] as String,
      pQuestion: map['pQuestion'] as String,
      coverImage: map['coverimage'] as String,
      profilePicture: map['profilepicture'] as String,
      answers: List<Answers>.from((map['answers'] as List)
          .map((x) => Answers.fromMap(x as Map<String, dynamic>))),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeModel.fromJson(String source) =>
      HomeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Answers {
  final String options;
  final String answers;

  Answers({required this.answers, required this.options});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'options': options,
      'answers': answers,
    };
  }

  factory Answers.fromMap(Map<String, dynamic> map) {
    return Answers(
      options: map['options'] as String,
      answers: map['answers'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Answers.fromJson(String source) =>
      Answers.fromMap(json.decode(source) as Map<String, dynamic>);
}
