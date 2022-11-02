class Books {
  String? author;
  String? description;
  String? fileUrl;
  String? lang;
  String? name;
  int? numberOfPages;
  int? year;
  String? publisher;
  String? category;
  double? rate;
  String? thumbnail;

  Books(
      {this.author,
      this.description,
      this.fileUrl,
      this.lang,
      this.name,
      this.numberOfPages,
      this.publisher,
      this.year,
      this.category,
      this.rate,
      this.thumbnail});

  Books.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    author = json['author'];
    description = json['description'];
    lang = json['lang'];
    numberOfPages = json['number_of_pages'];
    publisher = json['publisher'];
    year = json['year'];
    category = json['category'];
    rate = json['rate'];
    fileUrl = json['file_url'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['author'] = this.author;
    data['description'] = this.description;
    data['lang'] = this.lang;
    data['number_of_pages'] = this.numberOfPages;
    data['publisher'] = this.publisher;
    data['year'] = this.year;
    data['category'] = this.category;
    data['rate'] = this.rate;
    data['thumbnail'] = this.thumbnail;
    data['file_url'] = this.fileUrl;

    return data;
  }
}
