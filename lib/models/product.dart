class Product{
   var _image;
   var _name;
   var _price;
   var _desc;
   var _ratings;
   var _totalRatings;
   var _id;
   var _fav;
   var _vid;
   var _categoryname;
   var _status;
   var _subscription;
   get subscription=>_subscription;
   set subscription(value)
   {
     _subscription=value;
   }

   get status=> _status;
   set status(value)
   {
     _status=value;
   }

   get categoryname => _categoryname;
   set categoryname(value)
   {
     _categoryname=value;
   }

  get vid => _vid;

  set vid(value) {
    _vid = value;
  }

  get fav => _fav;

  set fav(value) {
    _fav = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

  get image => _image;

  set image(value) {
    _image = value;
  }

  get id => _id;

  set id(value) {
    _id = value;
  }


  get totalRatings => _totalRatings;

  set totalRatings(var value) {
    _totalRatings = value;
  }

   get ratings => _ratings;

  set ratings(var value) {
    _ratings = value;
  }



  get price => _price;

  set price(value) {
    _price = value;
  }

  get desc => _desc;

  set desc(value) {
    _desc = value;
  }

//Product(this.image, this.name,this.desc,this.ratings,this.totalRatings, this.price);



}