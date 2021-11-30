// To parse this JSON data, do
//
//     final pokedex = pokedexFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'package:meta/meta.dart';
import 'dart:convert';

List<Pokedex> pokedexFromJson(String str) => List<Pokedex>.from(json.decode(str).map((x) => Pokedex.fromJson(x)));

String pokedexToJson(List<Pokedex> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pokedex {
    Pokedex({
        required this.score,
        required this.show,
    });

    double score;
    Show show;

    factory Pokedex.fromJson(Map<String, dynamic> json) => Pokedex(
        score: json["score"].toDouble(),
        show: Show.fromJson(json["show"]),
    );

    Map<String, dynamic> toJson() => {
        "score": score,
        "show": show.toJson(),
    };
}

class Show {
    Show({
        required this.id,
        required this.url,
        required this.name,
        required this.type,
        required this.language,
        required this.genres,
        required this.rating,
        required this.image,
        required this.summary,
        required this.updated,
        required this.links,
    });

    int id;
    String url;
    String name;
    String type;
    String language;
    List<String> genres;
    Rating rating;
    Images image;
    String summary;
    int updated;
    Links links;

    factory Show.fromJson(Map<String, dynamic> json) => Show(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        type: json["type"],
        language: json["language"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        rating: Rating.fromJson(json["rating"]),
        image:  Images.fromJson(json["image"]),
        summary: json["summary"],
        updated: json["updated"],
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "type": type,
        "language": language,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "rating": rating.toJson(),
      
        "image": image == null ? null : image.toJson(),
        "summary": summary,
        "updated": updated,
        "_links": links.toJson(),
    };
}

class Externals {
    Externals({
        required this.tvrage,
        required this.thetvdb,
        required this.imdb,
    });

    int tvrage;
    int thetvdb;
    String imdb;

    factory Externals.fromJson(Map<String, dynamic> json) => Externals(
        tvrage: json["tvrage"] == null ? null : json["tvrage"],
        thetvdb: json["thetvdb"] == null ? null : json["thetvdb"],
        imdb: json["imdb"] == null ? null : json["imdb"],
    );

    Map<String, dynamic> toJson() => {
        "tvrage": tvrage == null ? null : tvrage,
        "thetvdb": thetvdb == null ? null : thetvdb,
        "imdb": imdb == null ? null : imdb,
    };
}

class Images {
    Images({
        required this.medium,
        required this.original,
    });

    String medium;
    String original;

    factory Images.fromJson(Map<String, dynamic> json) => Images(
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
        required this.previousepisode,
    });

    Previousepisode self;
    Previousepisode previousepisode;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: Previousepisode.fromJson(json["self"]),
        previousepisode: Previousepisode.fromJson(json["previousepisode"]),
    );

    Map<String, dynamic> toJson() => {
        "self": self.toJson(),
        "previousepisode": previousepisode.toJson(),
    };
}

class Previousepisode {
    Previousepisode({
        required this.href,
    });

    String href;

    factory Previousepisode.fromJson(Map<String, dynamic> json) => Previousepisode(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class Network {
    Network({
        required this.id,
        required this.name,
    });

    int id;
    String name;
    

    factory Network.fromJson(Map<String, dynamic> json) => Network(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Country {
    Country({
        required this.name,
        required this.code,
        required this.timezone,
    });

    String name;
    String code;
    String timezone;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
        timezone: json["timezone"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "timezone": timezone,
    };
}

class Rating {
    Rating({
        required this.average,
    });

    int average;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"] == null ? null : json["average"],
    );

    Map<String, dynamic> toJson() => {
        "average": average == null ? null : average,
    };
}

class Schedule {
    Schedule({
        required this.time,
        required this.days,
    });

    String time;
    List<String> days;

    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        time: json["time"],
        days: List<String>.from(json["days"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "days": List<dynamic>.from(days.map((x) => x)),
    };
}
