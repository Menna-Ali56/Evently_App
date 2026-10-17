import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/model/my_user.dart';

import '../model/event.dart';

class FireBaseUtils {
  static CollectionReference<MyUser> getUsersCollections(){
  return FirebaseFirestore.instance.collection(MyUser.collectionName)
      .withConverter<MyUser>(

    fromFirestore: ((snapshot, options) =>MyUser.fromFireStore(snapshot.data()!) ),

    toFirestore: (user, options) => user.toFireStore(),
  );

  }
  static CollectionReference<Event> getEventCollection(){
    return FirebaseFirestore.instance.collection(Event.collectionName)
        .withConverter<Event>(

      fromFirestore: ((snapshot, options) =>Event.fromFireStore(snapshot.data()!) ),

      toFirestore: (event, options) => event.toFireStore(),
    );

  }
  static Future<void> addUserInFireStore(MyUser myUser){

    // todo:1-collection
    CollectionReference<MyUser> collectionRef=getUsersCollections();
    //todo:2-document
    DocumentReference<MyUser> docRef=collectionRef.doc(myUser.id);
    //todo:3- add data

    return docRef.set(myUser);

    ///getUsersCollections().doc(myUser.id).set(myUser);





  }

  static Future<MyUser?> readUserFromFireStore(String uId)async{
    DocumentSnapshot<MyUser> querySnapshot=await getUsersCollections()
        .doc(uId).get();
    return querySnapshot.data();
  }

static Future<void>  addEventInFireStore(Event event){
  // todo:1-collection
  CollectionReference<Event> collectionRef=getEventCollection();
  //todo:2-document
  DocumentReference<Event> docRef=collectionRef.doc();
  //todo:3- auto id

    event.eventId=docRef.id;
//todo: save data
return docRef.set(event);

}
}