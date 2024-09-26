// To parse this JSON data, do
//
//     final courses = coursesFromJson(jsonString);

import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'courses.g.dart';

List<Courses> coursesFromJson(String str) => List<Courses>.from(json.decode(str).map((x) => Courses.fromJson(x)));

String coursesToJson(List<Courses> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 1)
class Courses {
  @HiveField(0)
    int id;
    @HiveField(1)
    String name;
    @HiveField(2)
    String image;
    @HiveField(3)
    Instructor instructor;
    @HiveField(4)
    String duration;
    @HiveField(5)
    List<Category> categories;
    @HiveField(6)
    int price;
    @HiveField(7)
    String priceRendered;
    @HiveField(8)
    dynamic originPrice;
    @HiveField(9)
    String originPriceRendered;
    @HiveField(10)
    bool onSale;
    @HiveField(11)
    int salePrice;
    @HiveField(12)
    String salePriceRendered;
    @HiveField(13)
    int rating;
    @HiveField(14)

    Courses({
        required this.id,
        required this.name,
        required this.image,
        required this.instructor,
        required this.duration,
        required this.categories,
        required this.price,
        required this.priceRendered,
        required this.originPrice,
        required this.originPriceRendered,
        required this.onSale,
        required this.salePrice,
        required this.salePriceRendered,
        required this.rating,
    });

    factory Courses.fromJson(Map<String, dynamic> json) => Courses(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        instructor: Instructor.fromJson(json["instructor"]),
        duration: json["duration"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        price: json["price"],
        priceRendered: json["price_rendered"],
        originPrice: json["origin_price"],
        originPriceRendered: json["origin_price_rendered"],
        onSale: json["on_sale"],
        salePrice: json["sale_price"],
        salePriceRendered: json["sale_price_rendered"],
        rating: json["rating"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "instructor": instructor.toJson(),
        "duration": duration,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "price": price,
        "price_rendered": priceRendered,
        "origin_price": originPrice,
        "origin_price_rendered": originPriceRendered,
        "on_sale": onSale,
        "sale_price": salePrice,
        "sale_price_rendered": salePriceRendered,
        "rating": rating,
    };
}

@HiveType(typeId: 2)
class Category {
  @HiveField(0)
    int termId;
    @HiveField(1)
    String name;
    @HiveField(2)
    String slug;
    @HiveField(3)
    int termGroup;
    @HiveField(4)
    int termTaxonomyId;
    @HiveField(5)
    String taxonomy;
    @HiveField(6)
    String description;
    @HiveField(7)
    int parent;
    @HiveField(8)
    int count;
    @HiveField(9)
    String filter;
    @HiveField(10)
    int id;

    Category({
        required this.termId,
        required this.name,
        required this.slug,
        required this.termGroup,
        required this.termTaxonomyId,
        required this.taxonomy,
        required this.description,
        required this.parent,
        required this.count,
        required this.filter,
        required this.id,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        termId: json["term_id"],
        name: json["name"],
        slug: json["slug"],
        termGroup: json["term_group"],
        termTaxonomyId: json["term_taxonomy_id"],
        taxonomy: json["taxonomy"],
        description: json["description"],
        parent: json["parent"],
        count: json["count"],
        filter: json["filter"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "term_id": termId,
        "name": name,
        "slug": slug,
        "term_group": termGroup,
        "term_taxonomy_id": termTaxonomyId,
        "taxonomy": taxonomy,
        "description": description,
        "parent": parent,
        "count": count,
        "filter": filter,
        "id": id,
    };
}


@HiveType(typeId: 3)

class Instructor {
  @HiveField(0)
    String avatar;
    @HiveField(1)
    int id;
    @HiveField(2)
    String name;
    @HiveField(3)
    String description;

    Instructor({
        required this.avatar,
        required this.id,
        required this.name,
        required this.description,

    });

    factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        avatar: json["avatar"],
        id: json["id"],
        name: json["name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "id": id,
        "name": name,
        "description": description,
    };
}





