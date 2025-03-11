import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entity/auth_entity.dart';

class UserCreationReq extends UserModel{
  UserCreationReq({
    required final String id,
    required final String name,
    required final String email,
    required final String password,
  }):super(
      id:  id,
      name:  name,
      email: email,
      password: password
  );

  factory UserCreationReq.fromSnaoshot(DocumentSnapshot snapshot){
    return UserCreationReq(
        id: snapshot.get('uid'),
        name: snapshot.get('name'),
        email: snapshot.get('email'),
        password: snapshot.get('password')
    );
  }
  Map<String,dynamic>toDocument(){
    return{
      "uid":id,
      "name":name,
      "email":email,
      "password":password
    };
  }


}