// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Item {
  int id;
  String name;
  String category;
  String releaseDate;
  String releaseDateDesc;
  String directors;
  String runtime;
  String desc;
  double rating;
  String imageUrl;
  String bannerUrl;
  String trailerImg1;
  String trailerImg2;
  String trailerImg3;
  String secondImg;
  String secondText;

  Item({
    required this.id,
    required this.name,
    required this.category,
    required this.releaseDate,
    required this.releaseDateDesc,
    required this.directors,
    required this.runtime,
    required this.desc,
    required this.rating,
    required this.imageUrl,
    required this.bannerUrl,
    required this.trailerImg1,
    required this.trailerImg2,
    required this.trailerImg3,
    required this.secondImg,
    required this.secondText,
  });

  Item copyWith({
    int? id,
    String? name,
    String? category,
    String? releaseDate,
    String? releaseDateDesc,
    String? directors,
    String? runtime,
    String? desc,
    double? rating,
    String? imageUrl,
    String? bannerUrl,
    String? trailerImg1,
    String? trailerImg2,
    String? trailerImg3,
    String? secondImg,
    String? secondText,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      releaseDate: releaseDate ?? this.releaseDate,
      releaseDateDesc: releaseDateDesc ?? this.releaseDateDesc,
      directors: directors ?? this.directors,
      runtime: runtime ?? this.runtime,
      desc: desc ?? this.desc,
      rating: rating ?? this.rating,
      imageUrl: imageUrl ?? this.imageUrl,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      trailerImg1: trailerImg1 ?? this.trailerImg1,
      trailerImg2: trailerImg2 ?? this.trailerImg2,
      trailerImg3: trailerImg3 ?? this.trailerImg3,
      secondImg: secondImg ?? this.secondImg,
      secondText: secondText ?? this.secondText,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'category': category,
      'releaseDate': releaseDate,
      'releaseDateDesc': releaseDateDesc,
      'directors': directors,
      'runtime': runtime,
      'desc': desc,
      'rating': rating,
      'imageUrl': imageUrl,
      'bannerUrl': bannerUrl,
      'trailerImg1': trailerImg1,
      'trailerImg2': trailerImg2,
      'trailerImg3': trailerImg3,
      'secondImg': secondImg,
      'secondText': secondText,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      category: map['category'] as String,
      releaseDate: map['releaseDate'] as String,
      releaseDateDesc: map['releaseDateDesc'] as String,
      directors: map['directors'] as String,
      runtime: map['runtime'] as String,
      desc: map['desc'] as String,
      rating: map['rating'] as double,
      imageUrl: map['imageUrl'] as String,
      bannerUrl: map['bannerUrl'] as String,
      trailerImg1: map['trailerImg1'] as String,
      trailerImg2: map['trailerImg2'] as String,
      trailerImg3: map['trailerImg3'] as String,
      secondImg: map['secondImg'] as String,
      secondText: map['secondText'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, category: $category, releaseDate: $releaseDate, releaseDateDesc: $releaseDateDesc, directors: $directors, runtime: $runtime, desc: $desc, rating: $rating, imageUrl: $imageUrl, bannerUrl: $bannerUrl, trailerImg1: $trailerImg1, trailerImg2: $trailerImg2, trailerImg3: $trailerImg3, secondImg: $secondImg, secondText: $secondText)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.category == category &&
        other.releaseDate == releaseDate &&
        other.releaseDateDesc == releaseDateDesc &&
        other.directors == directors &&
        other.runtime == runtime &&
        other.desc == desc &&
        other.rating == rating &&
        other.imageUrl == imageUrl &&
        other.bannerUrl == bannerUrl &&
        other.trailerImg1 == trailerImg1 &&
        other.trailerImg2 == trailerImg2 &&
        other.trailerImg3 == trailerImg3 &&
        other.secondImg == secondImg &&
        other.secondText == secondText;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        category.hashCode ^
        releaseDate.hashCode ^
        releaseDateDesc.hashCode ^
        directors.hashCode ^
        runtime.hashCode ^
        desc.hashCode ^
        rating.hashCode ^
        imageUrl.hashCode ^
        bannerUrl.hashCode ^
        trailerImg1.hashCode ^
        trailerImg2.hashCode ^
        trailerImg3.hashCode ^
        secondImg.hashCode ^
        secondText.hashCode;
  }
}
