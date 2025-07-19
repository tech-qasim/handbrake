// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $RelapsesTable extends Relapses with TableInfo<$RelapsesTable, Relapse> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelapsesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _emotionMeta = const VerificationMeta(
    'emotion',
  );
  @override
  late final GeneratedColumn<String> emotion = GeneratedColumn<String>(
    'emotion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _urgeIntensityMeta = const VerificationMeta(
    'urgeIntensity',
  );
  @override
  late final GeneratedColumn<double> urgeIntensity = GeneratedColumn<double>(
    'urge_intensity',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<int> day = GeneratedColumn<int>(
    'day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _monthYearMeta = const VerificationMeta(
    'monthYear',
  );
  @override
  late final GeneratedColumn<String> monthYear = GeneratedColumn<String>(
    'month_year',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    relapseTime,
    trigger,
    emotion,
    urgeIntensity,
    day,
    monthYear,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relapses';
  @override
  VerificationContext validateIntegrity(
    Insertable<Relapse> instance, {
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
    if (data.containsKey('emotion')) {
      context.handle(
        _emotionMeta,
        emotion.isAcceptableOrUnknown(data['emotion']!, _emotionMeta),
      );
    }
    if (data.containsKey('urge_intensity')) {
      context.handle(
        _urgeIntensityMeta,
        urgeIntensity.isAcceptableOrUnknown(
          data['urge_intensity']!,
          _urgeIntensityMeta,
        ),
      );
    }
    if (data.containsKey('day')) {
      context.handle(
        _dayMeta,
        day.isAcceptableOrUnknown(data['day']!, _dayMeta),
      );
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('month_year')) {
      context.handle(
        _monthYearMeta,
        monthYear.isAcceptableOrUnknown(data['month_year']!, _monthYearMeta),
      );
    } else if (isInserting) {
      context.missing(_monthYearMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Relapse map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Relapse(
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
      emotion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emotion'],
      ),
      urgeIntensity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}urge_intensity'],
      ),
      day: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day'],
      )!,
      monthYear: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}month_year'],
      )!,
    );
  }

  @override
  $RelapsesTable createAlias(String alias) {
    return $RelapsesTable(attachedDatabase, alias);
  }
}

class Relapse extends DataClass implements Insertable<Relapse> {
  final int id;
  final DateTime relapseTime;
  final String? trigger;
  final String? emotion;
  final double? urgeIntensity;
  final int day;
  final String monthYear;
  const Relapse({
    required this.id,
    required this.relapseTime,
    this.trigger,
    this.emotion,
    this.urgeIntensity,
    required this.day,
    required this.monthYear,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['relapse_time'] = Variable<DateTime>(relapseTime);
    if (!nullToAbsent || trigger != null) {
      map['trigger'] = Variable<String>(trigger);
    }
    if (!nullToAbsent || emotion != null) {
      map['emotion'] = Variable<String>(emotion);
    }
    if (!nullToAbsent || urgeIntensity != null) {
      map['urge_intensity'] = Variable<double>(urgeIntensity);
    }
    map['day'] = Variable<int>(day);
    map['month_year'] = Variable<String>(monthYear);
    return map;
  }

  RelapsesCompanion toCompanion(bool nullToAbsent) {
    return RelapsesCompanion(
      id: Value(id),
      relapseTime: Value(relapseTime),
      trigger: trigger == null && nullToAbsent
          ? const Value.absent()
          : Value(trigger),
      emotion: emotion == null && nullToAbsent
          ? const Value.absent()
          : Value(emotion),
      urgeIntensity: urgeIntensity == null && nullToAbsent
          ? const Value.absent()
          : Value(urgeIntensity),
      day: Value(day),
      monthYear: Value(monthYear),
    );
  }

  factory Relapse.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Relapse(
      id: serializer.fromJson<int>(json['id']),
      relapseTime: serializer.fromJson<DateTime>(json['relapseTime']),
      trigger: serializer.fromJson<String?>(json['trigger']),
      emotion: serializer.fromJson<String?>(json['emotion']),
      urgeIntensity: serializer.fromJson<double?>(json['urgeIntensity']),
      day: serializer.fromJson<int>(json['day']),
      monthYear: serializer.fromJson<String>(json['monthYear']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'relapseTime': serializer.toJson<DateTime>(relapseTime),
      'trigger': serializer.toJson<String?>(trigger),
      'emotion': serializer.toJson<String?>(emotion),
      'urgeIntensity': serializer.toJson<double?>(urgeIntensity),
      'day': serializer.toJson<int>(day),
      'monthYear': serializer.toJson<String>(monthYear),
    };
  }

  Relapse copyWith({
    int? id,
    DateTime? relapseTime,
    Value<String?> trigger = const Value.absent(),
    Value<String?> emotion = const Value.absent(),
    Value<double?> urgeIntensity = const Value.absent(),
    int? day,
    String? monthYear,
  }) => Relapse(
    id: id ?? this.id,
    relapseTime: relapseTime ?? this.relapseTime,
    trigger: trigger.present ? trigger.value : this.trigger,
    emotion: emotion.present ? emotion.value : this.emotion,
    urgeIntensity: urgeIntensity.present
        ? urgeIntensity.value
        : this.urgeIntensity,
    day: day ?? this.day,
    monthYear: monthYear ?? this.monthYear,
  );
  Relapse copyWithCompanion(RelapsesCompanion data) {
    return Relapse(
      id: data.id.present ? data.id.value : this.id,
      relapseTime: data.relapseTime.present
          ? data.relapseTime.value
          : this.relapseTime,
      trigger: data.trigger.present ? data.trigger.value : this.trigger,
      emotion: data.emotion.present ? data.emotion.value : this.emotion,
      urgeIntensity: data.urgeIntensity.present
          ? data.urgeIntensity.value
          : this.urgeIntensity,
      day: data.day.present ? data.day.value : this.day,
      monthYear: data.monthYear.present ? data.monthYear.value : this.monthYear,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Relapse(')
          ..write('id: $id, ')
          ..write('relapseTime: $relapseTime, ')
          ..write('trigger: $trigger, ')
          ..write('emotion: $emotion, ')
          ..write('urgeIntensity: $urgeIntensity, ')
          ..write('day: $day, ')
          ..write('monthYear: $monthYear')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    relapseTime,
    trigger,
    emotion,
    urgeIntensity,
    day,
    monthYear,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Relapse &&
          other.id == this.id &&
          other.relapseTime == this.relapseTime &&
          other.trigger == this.trigger &&
          other.emotion == this.emotion &&
          other.urgeIntensity == this.urgeIntensity &&
          other.day == this.day &&
          other.monthYear == this.monthYear);
}

class RelapsesCompanion extends UpdateCompanion<Relapse> {
  final Value<int> id;
  final Value<DateTime> relapseTime;
  final Value<String?> trigger;
  final Value<String?> emotion;
  final Value<double?> urgeIntensity;
  final Value<int> day;
  final Value<String> monthYear;
  const RelapsesCompanion({
    this.id = const Value.absent(),
    this.relapseTime = const Value.absent(),
    this.trigger = const Value.absent(),
    this.emotion = const Value.absent(),
    this.urgeIntensity = const Value.absent(),
    this.day = const Value.absent(),
    this.monthYear = const Value.absent(),
  });
  RelapsesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime relapseTime,
    this.trigger = const Value.absent(),
    this.emotion = const Value.absent(),
    this.urgeIntensity = const Value.absent(),
    required int day,
    required String monthYear,
  }) : relapseTime = Value(relapseTime),
       day = Value(day),
       monthYear = Value(monthYear);
  static Insertable<Relapse> custom({
    Expression<int>? id,
    Expression<DateTime>? relapseTime,
    Expression<String>? trigger,
    Expression<String>? emotion,
    Expression<double>? urgeIntensity,
    Expression<int>? day,
    Expression<String>? monthYear,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (relapseTime != null) 'relapse_time': relapseTime,
      if (trigger != null) 'trigger': trigger,
      if (emotion != null) 'emotion': emotion,
      if (urgeIntensity != null) 'urge_intensity': urgeIntensity,
      if (day != null) 'day': day,
      if (monthYear != null) 'month_year': monthYear,
    });
  }

  RelapsesCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? relapseTime,
    Value<String?>? trigger,
    Value<String?>? emotion,
    Value<double?>? urgeIntensity,
    Value<int>? day,
    Value<String>? monthYear,
  }) {
    return RelapsesCompanion(
      id: id ?? this.id,
      relapseTime: relapseTime ?? this.relapseTime,
      trigger: trigger ?? this.trigger,
      emotion: emotion ?? this.emotion,
      urgeIntensity: urgeIntensity ?? this.urgeIntensity,
      day: day ?? this.day,
      monthYear: monthYear ?? this.monthYear,
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
    if (emotion.present) {
      map['emotion'] = Variable<String>(emotion.value);
    }
    if (urgeIntensity.present) {
      map['urge_intensity'] = Variable<double>(urgeIntensity.value);
    }
    if (day.present) {
      map['day'] = Variable<int>(day.value);
    }
    if (monthYear.present) {
      map['month_year'] = Variable<String>(monthYear.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelapsesCompanion(')
          ..write('id: $id, ')
          ..write('relapseTime: $relapseTime, ')
          ..write('trigger: $trigger, ')
          ..write('emotion: $emotion, ')
          ..write('urgeIntensity: $urgeIntensity, ')
          ..write('day: $day, ')
          ..write('monthYear: $monthYear')
          ..write(')'))
        .toString();
  }
}

class $JournalsTable extends Journals with TableInfo<$JournalsTable, Journal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, content, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journals';
  @override
  VerificationContext validateIntegrity(
    Insertable<Journal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Journal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Journal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $JournalsTable createAlias(String alias) {
    return $JournalsTable(attachedDatabase, alias);
  }
}

class Journal extends DataClass implements Insertable<Journal> {
  final int id;
  final String title;
  final String content;
  final DateTime createdAt;
  const Journal({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  JournalsCompanion toCompanion(bool nullToAbsent) {
    return JournalsCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      createdAt: Value(createdAt),
    );
  }

  factory Journal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Journal(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Journal copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? createdAt,
  }) => Journal(
    id: id ?? this.id,
    title: title ?? this.title,
    content: content ?? this.content,
    createdAt: createdAt ?? this.createdAt,
  );
  Journal copyWithCompanion(JournalsCompanion data) {
    return Journal(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Journal(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Journal &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.createdAt == this.createdAt);
}

class JournalsCompanion extends UpdateCompanion<Journal> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<DateTime> createdAt;
  const JournalsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  JournalsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    this.createdAt = const Value.absent(),
  }) : title = Value(title),
       content = Value(content);
  static Insertable<Journal> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  JournalsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? content,
    Value<DateTime>? createdAt,
  }) {
    return JournalsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RelapsesTable relapses = $RelapsesTable(this);
  late final $JournalsTable journals = $JournalsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [relapses, journals];
}

typedef $$RelapsesTableCreateCompanionBuilder =
    RelapsesCompanion Function({
      Value<int> id,
      required DateTime relapseTime,
      Value<String?> trigger,
      Value<String?> emotion,
      Value<double?> urgeIntensity,
      required int day,
      required String monthYear,
    });
typedef $$RelapsesTableUpdateCompanionBuilder =
    RelapsesCompanion Function({
      Value<int> id,
      Value<DateTime> relapseTime,
      Value<String?> trigger,
      Value<String?> emotion,
      Value<double?> urgeIntensity,
      Value<int> day,
      Value<String> monthYear,
    });

class $$RelapsesTableFilterComposer
    extends Composer<_$AppDatabase, $RelapsesTable> {
  $$RelapsesTableFilterComposer({
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

  ColumnFilters<String> get emotion => $composableBuilder(
    column: $table.emotion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get urgeIntensity => $composableBuilder(
    column: $table.urgeIntensity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get monthYear => $composableBuilder(
    column: $table.monthYear,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RelapsesTableOrderingComposer
    extends Composer<_$AppDatabase, $RelapsesTable> {
  $$RelapsesTableOrderingComposer({
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

  ColumnOrderings<String> get emotion => $composableBuilder(
    column: $table.emotion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get urgeIntensity => $composableBuilder(
    column: $table.urgeIntensity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get monthYear => $composableBuilder(
    column: $table.monthYear,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RelapsesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RelapsesTable> {
  $$RelapsesTableAnnotationComposer({
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

  GeneratedColumn<String> get emotion =>
      $composableBuilder(column: $table.emotion, builder: (column) => column);

  GeneratedColumn<double> get urgeIntensity => $composableBuilder(
    column: $table.urgeIntensity,
    builder: (column) => column,
  );

  GeneratedColumn<int> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<String> get monthYear =>
      $composableBuilder(column: $table.monthYear, builder: (column) => column);
}

class $$RelapsesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RelapsesTable,
          Relapse,
          $$RelapsesTableFilterComposer,
          $$RelapsesTableOrderingComposer,
          $$RelapsesTableAnnotationComposer,
          $$RelapsesTableCreateCompanionBuilder,
          $$RelapsesTableUpdateCompanionBuilder,
          (Relapse, BaseReferences<_$AppDatabase, $RelapsesTable, Relapse>),
          Relapse,
          PrefetchHooks Function()
        > {
  $$RelapsesTableTableManager(_$AppDatabase db, $RelapsesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RelapsesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RelapsesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RelapsesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> relapseTime = const Value.absent(),
                Value<String?> trigger = const Value.absent(),
                Value<String?> emotion = const Value.absent(),
                Value<double?> urgeIntensity = const Value.absent(),
                Value<int> day = const Value.absent(),
                Value<String> monthYear = const Value.absent(),
              }) => RelapsesCompanion(
                id: id,
                relapseTime: relapseTime,
                trigger: trigger,
                emotion: emotion,
                urgeIntensity: urgeIntensity,
                day: day,
                monthYear: monthYear,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime relapseTime,
                Value<String?> trigger = const Value.absent(),
                Value<String?> emotion = const Value.absent(),
                Value<double?> urgeIntensity = const Value.absent(),
                required int day,
                required String monthYear,
              }) => RelapsesCompanion.insert(
                id: id,
                relapseTime: relapseTime,
                trigger: trigger,
                emotion: emotion,
                urgeIntensity: urgeIntensity,
                day: day,
                monthYear: monthYear,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RelapsesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RelapsesTable,
      Relapse,
      $$RelapsesTableFilterComposer,
      $$RelapsesTableOrderingComposer,
      $$RelapsesTableAnnotationComposer,
      $$RelapsesTableCreateCompanionBuilder,
      $$RelapsesTableUpdateCompanionBuilder,
      (Relapse, BaseReferences<_$AppDatabase, $RelapsesTable, Relapse>),
      Relapse,
      PrefetchHooks Function()
    >;
typedef $$JournalsTableCreateCompanionBuilder =
    JournalsCompanion Function({
      Value<int> id,
      required String title,
      required String content,
      Value<DateTime> createdAt,
    });
typedef $$JournalsTableUpdateCompanionBuilder =
    JournalsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> content,
      Value<DateTime> createdAt,
    });

class $$JournalsTableFilterComposer
    extends Composer<_$AppDatabase, $JournalsTable> {
  $$JournalsTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JournalsTableOrderingComposer
    extends Composer<_$AppDatabase, $JournalsTable> {
  $$JournalsTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JournalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $JournalsTable> {
  $$JournalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$JournalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JournalsTable,
          Journal,
          $$JournalsTableFilterComposer,
          $$JournalsTableOrderingComposer,
          $$JournalsTableAnnotationComposer,
          $$JournalsTableCreateCompanionBuilder,
          $$JournalsTableUpdateCompanionBuilder,
          (Journal, BaseReferences<_$AppDatabase, $JournalsTable, Journal>),
          Journal,
          PrefetchHooks Function()
        > {
  $$JournalsTableTableManager(_$AppDatabase db, $JournalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JournalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JournalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JournalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => JournalsCompanion(
                id: id,
                title: title,
                content: content,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String content,
                Value<DateTime> createdAt = const Value.absent(),
              }) => JournalsCompanion.insert(
                id: id,
                title: title,
                content: content,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JournalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JournalsTable,
      Journal,
      $$JournalsTableFilterComposer,
      $$JournalsTableOrderingComposer,
      $$JournalsTableAnnotationComposer,
      $$JournalsTableCreateCompanionBuilder,
      $$JournalsTableUpdateCompanionBuilder,
      (Journal, BaseReferences<_$AppDatabase, $JournalsTable, Journal>),
      Journal,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RelapsesTableTableManager get relapses =>
      $$RelapsesTableTableManager(_db, _db.relapses);
  $$JournalsTableTableManager get journals =>
      $$JournalsTableTableManager(_db, _db.journals);
}
