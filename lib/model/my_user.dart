class MyUser {
static const String collectionName='Users';
  String id;
  String name;
  String email;

  MyUser({required this.id, required this.name ,required this.email});
///From Json

  MyUser.fromFireStore(Map<String,dynamic>data):this(
    id:data['id'],
    name:data['name'],
    email:data['email']

  );

///To Json
   Map<String,dynamic>toFireStore(){
     return
         {
           'id':id,
           'name':name,
           'email':email
         };
   }

}