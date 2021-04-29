import 'dart:convert';

class Favourite{
  var image;
  var name;
  var price;
  var id;
  var unique;

  Favourite({this.image, this.name,this.price , this.id, this.unique});

  factory Favourite.fromJson(Map<String, dynamic> jsonData) {
    return Favourite(
      id: jsonData['id'],
      name: jsonData['name'],
      image: jsonData['image'],
      price: jsonData['price'],
      unique: jsonData['unique']
    );
  }

  static Map<String, dynamic> toMap(Favourite cart) => {
    'id': cart.id,
    'image': cart.image,
    'name': cart.name,
    'price': cart.price,
    'unique': cart.unique,
  };

  static String encodeMusics(List<Favourite> cart) => json.encode(
    cart
        .map<Map<dynamic, dynamic>>((music) => Favourite.toMap(music))
        .toList(),
  );

  static List<Favourite> decodeMusics(String musics){
    if(musics != null){
      return (json.decode(musics) as List<dynamic>)
          .map<Favourite>((item) => Favourite.fromJson(item))
          .toList();
    }else{
      return new List();
    }

  }


}