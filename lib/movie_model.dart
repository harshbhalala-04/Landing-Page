class MovieModel {
  String? title, poster;
  String? imdbID;
  String? year;

  MovieModel({
    this.title,
    this.poster,
    this.imdbID,
    this.year,
  });

  factory MovieModel.fromApi(Map<String, dynamic> data) {
    String getThumbnailSafety(Map<String, dynamic> data) {
      final imageLinks = data['volumeInfo']['imageLinks'];
      if (imageLinks != null && imageLinks['thumbnail'] != null) {
        return imageLinks['thumbnail'];
      } else {
        return "https://yt3.ggpht.com/ytc/AKedOLR0Q2jl80Ke4FS0WrTjciAu_w6WETLlI0HmzPa4jg=s176-c-k-c0x00ffffff-no-rj";
      }
    }

    return MovieModel(
        title: data['Title'],
        imdbID: data['imdbID'],
        year: data['Year'],
        poster: data['Poster'] == "N/A"
            ? "https://yt3.ggpht.com/ytc/AKedOLR0Q2jl80Ke4FS0WrTjciAu_w6WETLlI0HmzPa4jg=s176-c-k-c0x00ffffff-no-rj"
            : data['Poster']);
  }
}
