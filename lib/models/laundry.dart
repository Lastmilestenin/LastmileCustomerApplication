class Laundry{
  List<String> image;
  String name;
  List<int> price;
  List<String> desc;
  double ratings;
  String totalRatings;

  Laundry(this.image, this.name,this.desc,this.ratings,this.totalRatings, this.price);
}

List<Laundry> laundry = [
  Laundry(
      ['assets/1.png',
        'assets/3.png','assets/2.png','assets/4.png',],
      'Space T Shirt',
      ['Comfort Fabric','leather quality','best quality','good shirt'],
      4,
      '1278',
      [250,100,54,200]),
  Laundry(
      ['assets/2.png'],
      'Pegasus T Shirt',
      ['Comfort Fabric'],
      4,
      '1278',
      [250]),
  Laundry(
      ['assets/3.png','assets/4.png'],
      'Rumili Case',
      ['Comfort Fabric','good bag'],
      4,
      '1278',
      [250,100]),
  Laundry(
      ['assets/3.png','assets/4.png'],
      'Rumili Case',
      ['Comfort Fabric','good bag'],
      4,
      '1278',
      [250,100]),
  Laundry(
      ['assets/3.png','assets/4.png'],
      'Rumili Case',
      ['Comfort Fabric','good bag'],
      4,
      '1278',
      [250,100]),
];