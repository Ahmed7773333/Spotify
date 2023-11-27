class EndPoints {
  //categories
  static const String categories = '/v1/browse/categories';
  static const String playListsOfCategory = '/playlists';
  static const String playList = '/v1/playlists';
  static const String tracksOfPlayList = '/tracks';
  static const String track = '/v1/tracks';
  static const String getUserPlaylists =
      '/v1/users/31gyta2g2td5cgymqysh4hvkwsgm/playlists?offset=0&limit=20';
  static const String getCurruntUserPlaylists = '/v1/me/playlists';
  static const String search = '/v1/search';
  static const String podcastsForHome =
      '/v1/shows?ids=5CfCWKI5pZ28U0uOzXkDHe,5as3aKmN2k11yfDDDSrvaZ,1VVE7CH4pmGuzGGKIGLEDQ,0fmoWfEzePjmtbqFqxc5Rv,6FO6Y2gZpPjhYSaQs0KLbh';

  static const String podcasts = '/v1/shows';
  static const String episodes = '/episodes';
  static const String newRelease = '/v1/browse/new-releases';
}
