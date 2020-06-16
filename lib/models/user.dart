import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String id;

  @HiveField(1)
  String username;

  @HiveField(2)
  String image;

  @HiveField(3)
  String vechile;

  @HiveField(4)
  String usertype;

  User(this.id, this.username, this.image, this.usertype);
}

// factory User.fromJson(Map<String, dynamic> json) {
//   return User(
//     json['id'] as String,
//     json['displayName'] as String,
//     json['photoUrl'] as String,
//     json['email'] as String,
//     json['address'] as String,
//     json['usertype'] as String,
//     json['serviceCharge'] as String,
///   );
//}
