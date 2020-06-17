// import 'package:MechanicFinder/models/user.dart';
// import 'package:flutter/foundation.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:MechanicFinder/models/user.dart';
import 'package:hive/hive.dart';

class DbHelper {
  final userBox = Hive.box("users");
  addUser(users) {
    userBox.add(users);
  }



//   User get users {
//     var userkeys = getchatsListenable().value.keys.length > 0
//         ? getchatsListenable().value.keys
//         : null;
//     if (userkeys != null) {
//       User data = getchatsListenable().value.get('users');
//       return data ?? null;
//     } else
//       return null;
//   }

  // ValueListenable<Box<dynamic>> getchatsListenable() {
  //   return user.listenable();
  // }



  // get useri {
  //   return user.listenable().value.get('users');
  // }

//   edituser(User value) {
//     if (user.containsKey(value.id)) {
//       return user.put(value.id.toString(), value);
//     } else {
//       return user.put(value.id.toString(), value);
//     }
//   }

//   deletuser(key) {
//     user.delete(key);
//   }

//   clearmsg() {
//     user.clear();
//   }
 }

final dbHelper = DbHelper();
