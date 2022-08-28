import 'package:flutter/foundation.dart';

@immutable
class GetSuperCategoryResponse {
  const GetSuperCategoryResponse({
    required this.categories,
  });

  final List<Category> categories;

  factory GetSuperCategoryResponse.fromJson(Map<String, dynamic> json) =>
      GetSuperCategoryResponse(
          categories: (json['data'] as List? ?? [])
              .map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList());

  Map<String, dynamic> toJson() =>
      {'data': categories.map((e) => e.toJson()).toList()};

  GetSuperCategoryResponse clone() => GetSuperCategoryResponse(
      categories: categories.map((e) => e.clone()).toList());

  GetSuperCategoryResponse copyWith({List<Category>? categories}) =>
      GetSuperCategoryResponse(
        categories: categories ?? this.categories,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetSuperCategoryResponse && categories == other.categories;

  @override
  int get hashCode => categories.hashCode;
}

@immutable
class Category {
  const Category({
    required this.cid,
    required this.cname,
    required this.cpic,
    required this.subcategories,
  });

  final String cid;
  final String cname;
  final String cpic;
  final List<Subcategory> subcategories;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
      cid: json['cid'].toString(),
      cname: json['cname'].toString(),
      cpic: json['cpic'].toString(),
      subcategories: (json['subcategories'] as List? ?? [])
          .map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
          .toList());

  Map<String, dynamic> toJson() => {
        'cid': cid,
        'cname': cname,
        'cpic': cpic,
        'subcategories': subcategories.map((e) => e.toJson()).toList()
      };

  Category clone() => Category(
      cid: cid,
      cname: cname,
      cpic: cpic,
      subcategories: subcategories.map((e) => e.clone()).toList());

  Category copyWith(
          {String? cid,
          String? cname,
          String? cpic,
          List<Subcategory>? subcategories}) =>
      Category(
        cid: cid ?? this.cid,
        cname: cname ?? this.cname,
        cpic: cpic ?? this.cpic,
        subcategories: subcategories ?? this.subcategories,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category &&
          cid == other.cid &&
          cname == other.cname &&
          cpic == other.cpic &&
          subcategories == other.subcategories;

  @override
  int get hashCode =>
      cid.hashCode ^ cname.hashCode ^ cpic.hashCode ^ subcategories.hashCode;
}

@immutable
class Subcategory {
  const Subcategory({
    required this.scpic,
    required this.subcid,
    required this.subcname,
  });

  final String scpic;
  final String subcid;
  final String subcname;

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
      scpic: json['scpic'].toString(),
      subcid: json['subcid'].toString(),
      subcname: json['subcname'].toString());

  Map<String, dynamic> toJson() =>
      {'scpic': scpic, 'subcid': subcid, 'subcname': subcname};

  Subcategory clone() =>
      Subcategory(scpic: scpic, subcid: subcid, subcname: subcname);

  Subcategory copyWith({String? scpic, String? subcid, String? subcname}) =>
      Subcategory(
        scpic: scpic ?? this.scpic,
        subcid: subcid ?? this.subcid,
        subcname: subcname ?? this.subcname,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Subcategory &&
          scpic == other.scpic &&
          subcid == other.subcid &&
          subcname == other.subcname;

  @override
  int get hashCode => scpic.hashCode ^ subcid.hashCode ^ subcname.hashCode;
}
