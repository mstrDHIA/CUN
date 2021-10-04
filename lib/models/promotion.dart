class Promotion{
  String id;
  String title;
  String description;
  String code;
  bool active;
  int discount;
  DateTime beginDate;
  DateTime endDate;
  String image;

  Promotion( String id,String title,String descrption,String image,String code,bool active,int discount,DateTime beginDate,DateTime endDate){
     this.id=id;
  this.title=title;
  this.description=description;
  this.code=code;
  this.active=active;
  this.discount=discount;
  this.beginDate=beginDate;
  this.endDate=endDate;
  this.image=image;
  }
}


