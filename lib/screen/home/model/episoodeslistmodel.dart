// To parse this JSON data, do
//
//     final pokedex = pokedexFromJson(jsonString);

import 'dart:convert';

EpisodeslistModel pokedexFromJson(String str) => EpisodeslistModel.fromJson(json.decode(str));

String pokedexToJson(EpisodeslistModel data) => json.encode(data.toJson());

class EpisodeslistModel {
    EpisodeslistModel({
        required this.id,
        required this.url,
        required this.name,
        required this.season,
        required this.number,
        required this.type,
        required this.airdate,
        required this.airtime,
        required this.airstamp,
        required this.runtime,
        required this.rating,
        required this.image,
        required this.summary,
        required this.links,
    });

    int id;
    String url;
    String name;
    int season;
    int number;
    String type;
    DateTime airdate;
    String airtime;
    DateTime airstamp;
    int runtime;
    Rating rating;
    Image image;
    String summary;
    Links links;

    factory EpisodeslistModel.fromJson(Map<String, dynamic> json) => EpisodeslistModel(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        season: json["season"],
        number: json["number"],
        type: json["type"],
        airdate: DateTime.parse(json["airdate"]),
        airtime: json["airtime"],
        airstamp: DateTime.parse(json["airstamp"]),
        runtime: json["runtime"],
        rating: Rating.fromJson(json["rating"]),
        image: Image.fromJson(json["image"]),
        summary: json["summary"],
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "season": season,
        "number": number,
        "type": type,
        "airdate": "${airdate.year.toString().padLeft(4, '0')}-${airdate.month.toString().padLeft(2, '0')}-${airdate.day.toString().padLeft(2, '0')}",
        "airtime": airtime,
        "airstamp": airstamp.toIso8601String(),
        "runtime": runtime,
        "rating": rating.toJson(),
        "image": image.toJson(),
        "summary": summary,
        "_links": links.toJson(),
    };
}

class Image {
    Image({
        required this.medium,
        required this.original,
    });

    String medium;
    String original;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json["medium"],
        original: json["original"],
    );

    Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
    };
}

class Links {
    Links({
        required this.self,
    });

    Self self;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: Self.fromJson(json["self"]),
    );

    Map<String, dynamic> toJson() => {
        "self": self.toJson(),
    };
}

class Self {
    Self({
        required this.href,
    });

    String href;

    factory Self.fromJson(Map<String, dynamic> json) => Self(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class Rating {
    Rating({
        required this.average,
    });

    double average;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "average": average,
    };
}
