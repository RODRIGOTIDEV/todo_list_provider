import 'package:todo_list_provider/app/core/database/migrations/migration_v1.dart';
import 'package:todo_list_provider/app/core/database/migrations/migrations.dart';
import 'package:todo_list_provider/app/core/database/migrations/migrations_V2.dart';
import 'package:todo_list_provider/app/core/database/migrations/migrations_V3.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigration() => [
        MigrationV1(),
        MigrationV2(),
        MigrationV3(),
      ];
  List<Migration> getUpgredeMigration(int version) {
    var migrations = <Migration>[];

    if (version == 1) {
      migrations.add(MigrationV2());
      migrations.add(MigrationV3());
    }
    if (version == 2) {
      migrations.add(MigrationV3());
    }
    return migrations;
  }
}
