class PlaylistModel {
  String? href;
  List<OnePlayList>? items;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;

  PlaylistModel(
      {this.href,
      this.items,
      this.limit,
      this.next,
      this.offset,
      this.previous,
      this.total});

  PlaylistModel.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    if (json['items'] != null) {
      items = <OnePlayList>[];
      json['items'].forEach((v) {
        items!.add(OnePlayList.fromJson(v));
      });
    }
    limit = json['limit'];
    next = json['next'];
    offset = json['offset'];
    previous = json['previous'];
    total = json['total'];
  }
}

class OnePlayList {
  bool? collaborative;
  String? description;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Images>? images;
  String? name;
  Owner? owner;
  String? primaryColor;
  bool? public;
  String? snapshotId;
  Tracks? tracks;
  String? type;
  String? uri;

  OnePlayList(
      {this.collaborative,
      this.description,
      this.externalUrls,
      this.href,
      this.id,
      this.images,
      this.name,
      this.owner,
      this.primaryColor,
      this.public,
      this.snapshotId,
      this.tracks,
      this.type,
      this.uri});

  OnePlayList.fromJson(Map<String, dynamic> json) {
    collaborative = json['collaborative'];
    description = json['description'];
    externalUrls = json['external_urls'] != null
        ? ExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    name = json['name'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    primaryColor = json['primary_color'];
    public = json['public'];
    snapshotId = json['snapshot_id'];
    tracks = json['tracks'] != null ? Tracks.fromJson(json['tracks']) : null;
    type = json['type'];
    uri = json['uri'];
  }
}

class Images {
  int? height;
  String? url;
  int? width;

  Images({this.height, this.url, this.width});

  Images.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }
}

class ExternalUrls {
  String? spotify;

  ExternalUrls({this.spotify});

  ExternalUrls.fromJson(Map<String, dynamic> json) {
    spotify = json['spotify'];
  }
}

class Owner {
  String? displayName;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? type;
  String? uri;

  Owner(
      {this.displayName,
      this.externalUrls,
      this.href,
      this.id,
      this.type,
      this.uri});

  Owner.fromJson(Map<String, dynamic> json) {
    displayName = json['display_name'];
    externalUrls = json['external_urls'] != null
        ? ExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    type = json['type'];
    uri = json['uri'];
  }
}

class Tracks {
  String? href;
  int? total;

  Tracks({this.href, this.total});

  Tracks.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    total = json['total'];
  }
}
