class Service{
  String id;
  String description;
  DateTime openTime;
  DateTime closeTime;
  String availableDays;

  Service(String id,String description,DateTime openTime,DateTime closeTime,String availableDays){
      this.id=id;
      this.description=description;
  this.openTime=openTime;
  this.closeTime=closeTime;
  this.availableDays=availableDays;
  }
}