import 'package:sqflite_common/sqlite_api.dart';
import 'package:todo_list_provider/app/core/database/migrations/migrations.dart';

class MigrationV3 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('create table test2(id integer)');
  }

  @override
  void update(Batch batch) {
    batch.execute('create table test2(id integer)');
  }
}
