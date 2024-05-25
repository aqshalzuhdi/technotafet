// ignore_for_file: depend_on_referenced_packages

import 'package:technotafet/objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  final Store store;

  ObjectBox._create(this.store);

  static Future<ObjectBox> create() async {
    var dir = await getApplicationDocumentsDirectory();

    Store store =
        await openStore(directory: p.join(dir.path, 'technotafet_db'));
    return ObjectBox._create(store);
  }
}
