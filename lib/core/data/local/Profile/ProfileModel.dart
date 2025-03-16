import 'package:hive/hive.dart';

part 'ProfileModel.g.dart';

@HiveType(typeId: 0)
class ProfileModel extends HiveObject {
  ProfileModel(this.email, this.username, this.phoneNumber);
  @HiveField(0)
  final String email;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String phoneNumber;

}
