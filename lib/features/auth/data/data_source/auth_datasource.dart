import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_ware/features/auth/domain/entity/auth_entity.dart';

import '../models/auth_model.dart';

abstract class DataSource {
   Future<void> signup(UserModel user);
   Future<void> getCreateCurrentUser(UserModel user);
   Future<String> getCurrentUid();


}
class DataSourceImpl implements DataSource{
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  DataSourceImpl({required this.auth,required this.firestore});
  @override
  Future<void> signup(UserModel user) async{
    await auth.createUserWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }
  @override
  Future<String> getCurrentUid() async{
    return await auth.currentUser!.uid;
  }
  @override
  Future<void> getCreateCurrentUser(UserModel user)async {
    final userCollection= firestore.collection('users');
    final uid= await getCurrentUid();
    userCollection.doc(uid).get().then((userDoc){
      final newUser=UserCreationReq(
          id: user.id!,
          name: user.name!,
          email: user.email!,
          password: user.password!
      ).toDocument();
      if(!userDoc.exists){
        userCollection.doc(uid).set(newUser);
      }
    }
    );
  }


}