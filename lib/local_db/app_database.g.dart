// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $RelapseTableTable extends RelapseTable
    with TableInfo<$RelapseTableTable, RelapseTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelapseTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _relapseTimeMeta = const VerificationMeta(
    'relapseTime',
  );
  @override
  late final GeneratedColumn<DateTime> relapseTime = GeneratedColumn<DateTime>(
    'relapse_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _triggerMeta = const VerificationMeta(
    'trigger',
  );
  @override
  late final GeneratedColumn<String> trigger = GeneratedColumn<String>(
    'trigger',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, relapseTime, trigger];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relapse_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<RelapseTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('relapse_time')) {
      context.handle(
        _relapseTimeMeta,
        relapseTime.isAcceptableOrUnknown(
          data['relapse_time']!,
          _relapseTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relapseTimeMeta);
    }
    if (data.containsKey('trigger')) {
      context.handle(
        _triggerMeta,
        trigger.isAcceptableOrUnknown(data['trigger']!, _triggerMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RelapseTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RelapseTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      relapseTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}relapse_time'],
      )!,
      trigger: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trigger'],
      ),
    );
  }

  @override
  $RelapseTableTable createAlias(String alias) {
    return $RelapseTableTable(attachedDatabase, alias);
  }
}

class RelapseTableData extends DataClass
    implements Insertable<RelapseTableData> {
  final int id;
  final DateTime relapseTime;
  final String? trigger;
  const RelapseTableData({
    required this.id,
    required this.relapseTime,
    this.trigger,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['relapse_time'] = Variable<DateTime>(relapseTime);
    if (!nullToAbsent || trigger != null) {
      map['trigger'] = Variable<String>(trigger);
    }
    return map;
  }

  RelapseTableCompanion toCompanion(bool nullToAbsent) {
    return RelapseTableCompanion(
      id: Value(id),
      relapseTime: Value(relapseTime),
      trigger: trigger == null && nullToAbsent
          ? const Value.absent()
          : Value(trigger),
    );
  }

  factory RelapseTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RelapseTableData(
      id: serializer.fromJson<int>(json['id']),
      relapseTime: serializer.fromJson<DateTime>(json['relapseTime']),
      trigger: serializer.fromJson<String?>(json['trigger']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'relapseTime': serializer.toJson<DateTime>(relapseTime),
      'trigger': serializer.toJson<String?>(trigger),
    };
  }

  RelapseTableData copyWith({
    int? id,
    DateTime? relapseTime,
    Value<String?> trigger = const Value.absent(),
  }) => RelapseTableData(
    id: id ?? this.id,
    relapseTime: relapseTime ?? this.relapseTime,
    trigger: trigger.present ? trigger.value : this.trigger,
  );
  RelapseTableData copyWithCompanion(RelapseTableCompanion data) {
    return RelapseTableData(
      id: data.id.present ? data.id.value : this.id,
      relapseTime: data.relapseTime.present
          ? data.relapseTime.value
          : this.relapseTime,
      trigger: data.trigger.present ? data.trigger.value : this.trigger,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RelapseTableData(')
          ..write('id: $id, ')
          ..write('relapseTime: $relapseTime, ')
          ..write('trigger: $trigger')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, relapseTime, trigger);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RelapseTableData &&
          other.id == this.id &&
          other.relapseTime == this.relapseTime &&
          other.trigger == this.trigger);
}

class RelapseTableCompanion extends UpdateCompanion<RelapseTableData> {
  final Value<int> id;
  final Value<DateTime> relapseTime;
  final Value<String?> trigger;
  const RelapseTableCompanion({
    this.id = const Value.absent(),
    this.relapseTime = const Value.absent(),
    this.trigger = const Value.absent(),
  });
  RelapseTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime relapseTime,
    this.trigger = const Value.absent(),
  }) : relapseTime = Value(relapseTime);
  static Insertable<RelapseTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? relapseTime,
    Expression<String>? trigger,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (relapseTime != null) 'relapse_time': relapseTime,
      if (trigger != null) 'trigger': trigger,
    });
  }

  RelapseTableCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? relapseTime,
    Value<String?>? trigger,
  }) {
    return RelapseTableCompanion(
      id: id ?? this.id,
      relapseTime: relapseTime ?? this.relapseTime,
      trigger: trigger ?? this.trigger,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (relapseTime.present) {
      map['relapse_time'] = Variable<DateTime>(relapseTime.value);
    }
    if (trigger.present) {
      map['trigger'] = Variable<String>(trigger.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelapseTableCompanion(')
          ..write('id: $id, ')
          ..write('relapseTime: $relapseTime, ')
          ..write('trigger: $trigger')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RelapseTableTable relapseTable = $RelapseTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [relapseTable];
}

typedef $$RelapseTableTableCreateCompanionBuilder =
    RelapseTableCompanion Function({
      Value<int> id,
      required DateTime relapseTime,
      Value<String?> trigger,
    });
typedef $$RelapseTableTableUpdateCompanionBuilder =
    RelapseTableCompanion Function({
      Value<int> id,
      Value<DateTime> relapseTime,
      Value<String?> trigger,
    });

class $$RelapseTableTableFilterComposer
    extends Composer<_$AppDatabase, $RelapseTableTable> {
  $$RelapseTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get relapseTime => $composableBuilder(
    column: $table.relapseTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trigger => $composableBuilder(
    column: $table.trigger,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RelapseTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RelapseTableTable> {
  $$RelapseTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get relapseTime => $composableBuilder(
    column: $table.relapseTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trigger => $composableBuilder(
    column: $table.trigger,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RelapseTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RelapseTableTable> {
  $$RelapseTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get relapseTime => $composableBuilder(
    column: $table.relapseTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get trigger =>
      $composableBuilder(column: $table.trigger, builder: (column) => column);
}

class $$RelapseTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RelapseTableTable,
          RelapseTableData,
          $$RelapseTableTableFilterComposer,
          $$RelapseTableTableOrderingComposer,
          $$RelapseTableTableAnnotationComposer,
          $$RelapseTableTableCreateCompanionBuilder,
          $$RelapseTableTableUpdateCompanionBuilder,
          (
            RelapseTableData,
            BaseReferences<_$AppDatabase, $RelapseTableTable, RelapseTableData>,
          ),
          RelapseTableData,
          PrefetchHooks Function()
        > {
  $$RelapseTableTableTableManager(_$AppDatabase db, $RelapseTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RelapseTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RelapseTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RelapseTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> relapseTime = const Value.absent(),
                Value<String?> trigger = const Value.absent(),
              }) => RelapseTableCompanion(
                id: id,
                relapseTime: relapseTime,
                trigger: trigger,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime relapseTime,
                Value<String?> trigger = const Value.absent(),
              }) => RelapseTableCompanion.insert(
                id: id,
                relapseTime: relapseTime,
                trigger: trigger,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RelapseTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RelapseTableTable,
      RelapseTableData,
      $$RelapseTableTableFilterComposer,
      $$RelapseTableTableOrderingComposer,
      $$RelapseTableTableAnnotationComposer,
      $$RelapseTableTableCreateCompanionBuilder,
      $$RelapseTableTableUpdateCompanionBuilder,
      (
        RelapseTableData,
        BaseReferences<_$AppDatabase, $RelapseTableTable, RelapseTableData>,
      ),
      RelapseTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RelapseTableTableTableManager get relapseTable =>
      $$RelapseTableTableTableManager(_db, _db.relapseTable);
}
