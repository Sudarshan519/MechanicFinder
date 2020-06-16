
import 'package:MechanicFinder/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class DbHelper {
  final user = Hive.box("user");

  User get whatsAppChat {
    var userkeys = getchatsListenable().value.keys.length > 0
        ? getchatsListenable().value.keys
        : null;
    if (userkeys != null) {
      User data = getchatsListenable().value.get('users');
      return data ?? null;
    } else
      return null;
  }

  ValueListenable<Box<dynamic>> getchatsListenable() {
    return user.listenable();
  }

  get whatsAppMessages {
    return user.listenable().value.get('whatsapp').messages;
  }
  

  editchat(User value) {
    if (user.containsKey(value.id)) {
      return user.put(value.id.toString(), value);
    } else {
      return user.put(value.id.toString(), value);
    }
  }

  deletchat(key) {
    user.delete(key);
  }
  clearmsg(){
    user.clear();
  }
}

final dbHelper = DbHelper();