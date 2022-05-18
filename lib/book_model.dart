class BookModel {
  String? id, title, subtitle, description, thumbnail, bookUrl;
  List<dynamic>? authors;

  BookModel(
      {this.id,
      this.title,
      this.subtitle,
      this.description,
      this.thumbnail,
      this.bookUrl, this.authors});

  factory BookModel.fromApi(Map<String, dynamic> data) {
    String getThumbnailSafety(Map<String, dynamic> data) {
      final imageLinks = data['volumeInfo']['imageLinks'];
      if (imageLinks != null && imageLinks['thumbnail'] != null) {
        return imageLinks['thumbnail'];
      } else {
        return "https://www.wildhareboca.com/wp-content/uploads/sites/310/2018/03/image-not-available.jpg";
      }
    }

    return BookModel(
        id: data['id'],
        title: data['volumeInfo']['title'],
        authors: data['volumeInfo']['authors'],
        description: data['volumeInfo']['description'],
        subtitle: data['volumeInfo']['subtitle'],
        thumbnail: getThumbnailSafety(data).replaceAll("http", "https"),
        bookUrl: data['volumeInfo']['previewLink']);
  }
}
