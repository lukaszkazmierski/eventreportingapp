import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class UidGenerator {
  Uuid _uuid;

  UidGenerator() {
    _uuid ??= Uuid(options: {
      'grgn': UuidUtil.cryptoRNG
      }
    );
  }

  String get generateRandomId => _uuid.v4();
}

UidGenerator uidGenerator = UidGenerator();
