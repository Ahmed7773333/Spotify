import 'playlists_model.dart';

class PodcastShow {
  List<Shows>? shows;

  PodcastShow({this.shows});

  PodcastShow.fromJson(Map<String, dynamic> json) {
    if (json['shows'] != null) {
      shows = <Shows>[];
      json['shows'].forEach((v) {
        shows!.add(Shows.fromJson(v));
      });
    }
  }
}

class Shows {
  List<String>? availableMarkets;
  List<Copyrights>? copyrights;
  String? description;
  bool? explicit;
  ExternalUrls? externalUrls;
  String? href;
  String? htmlDescription;
  String? id;
  List<Images>? images;
  bool? isExternallyHosted;
  List<String>? languages;
  String? mediaType;
  String? name;
  String? publisher;
  int? totalEpisodes;
  String? type;
  String? uri;

  Shows(
      {this.availableMarkets,
      this.copyrights,
      this.description,
      this.explicit,
      this.externalUrls,
      this.href,
      this.htmlDescription,
      this.id,
      this.images,
      this.isExternallyHosted,
      this.languages,
      this.mediaType,
      this.name,
      this.publisher,
      this.totalEpisodes,
      this.type,
      this.uri});

  Shows.fromJson(Map<String, dynamic> json) {
    availableMarkets = json['available_markets'].cast<String>();
    if (json['copyrights'] != null) {
      copyrights = <Copyrights>[];
      json['copyrights'].forEach((v) {
        copyrights!.add(Copyrights.fromJson(v));
      });
    }
    description = json['description'];
    explicit = json['explicit'];
    externalUrls = json['external_urls'] != null
        ? ExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    htmlDescription = json['html_description'];
    id = json['id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    isExternallyHosted = json['is_externally_hosted'];
    languages = json['languages'].cast<String>();
    mediaType = json['media_type'];
    name = json['name'];
    publisher = json['publisher'];
    totalEpisodes = json['total_episodes'];
    type = json['type'];
    uri = json['uri'];
  }
}

class Copyrights {
  String? text;
  String? type;

  Copyrights({this.text, this.type});

  Copyrights.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    type = json['type'];
  }
}
