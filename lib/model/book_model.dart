class BookModel {
  String name, image, author, price;

  BookModel(this.name, this.image, this.author, this.price);
}

List bookList = <BookModel>[
  BookModel(
      "The Millennial Mind", "assets/book2.jpeg", "Daniel M. Francis", "20"),
  BookModel(
      "The Glass Hotel", "assets/book3.jpeg", "Emily St. John Mandel", "25"),
  BookModel(
      "The Willpower Instinct", "assets/book4.jpeg", "Kelly McGonigal", "18"),
  BookModel(
      "Awaken the Giant Within", "assets/book5.jpeg", "Tony Robbins", "38"),
];
