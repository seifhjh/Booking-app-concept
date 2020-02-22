class Suitable{


  String id;
  String imgUrl;
  double price;
  double rating ;
  int total_review;
  String title;
  String categorie;

  Suitable({this.id, this.imgUrl, this.price, this.rating, this.total_review,
      this.title, this.categorie});

}

List<Suitable> listSuitable=[

  Suitable(
    id: "1",
    imgUrl: "assest/images/1.jpg",
    price: 1000,
    categorie: "Small family house",
    rating: 4,
    total_review: 220,
    title: "Aromic Apartement",


  ),

  Suitable(
    id: "2",
    imgUrl: "assest/images/2.jpg",
    price: 1500,
    categorie: "Small family house",
    rating: 5,
    total_review: 520,
    title: "Aromic Apartement",


  ),

  Suitable(
    id: "3",
    imgUrl: "assest/images/3.jpg",
    price: 1020,
    categorie: "Small family house",
    rating: 3.5,
    total_review: 70,
    title: "Aromic Apartement",


  ),

  Suitable(
    id: "4",
    imgUrl: "assest/images/4.jpg",
    price: 985,
    categorie: "Small family house",
    rating: 2.5,
    total_review: 140,
    title: "Aromic Apartement",


  ),

];

List<String> listString =[
  "Category",
  "Service",
  "Reviews",
  "Nearby",
];