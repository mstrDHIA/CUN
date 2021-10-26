class User{
  String id;
  int phone;
  String firstName;
  String lastName;
  String email;
  String photo;
  String password;


  User({String id,String password,int phone,String firstName,String lastName,String email,String photo}){
    this.id=id;
  this.phone=phone;
  this.firstName=firstName;
  this.lastName=lastName;
  this.email=email;
  this.password=password;
  this.photo=photo;
  }

   Map<String,dynamic> toJson() => {
//  'phone':phone,
    'name':firstName,
    'email':email,
    'photo': photo,
  // 'id':id,
      };


       User.fromJson(Map<String, dynamic> json)
      : photo=json['photo'],
    firstName=json['name'],
    // lastName=json['last_name'],
    email=json['email'];
    
  // id=json['id'];
    
  
}
