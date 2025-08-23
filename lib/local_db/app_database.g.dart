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
  static const VerificationMeta _relapseHappeningTimeMeta =
      const VerificationMeta('relapseHappeningTime');
  @override
  late final GeneratedColumn<String> relapseHappeningTime =
      GeneratedColumn<String>(
        'relapse_happening_time',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _triggerMeta = const VerificationMeta(
    'trigger',
  );
  @override
  late final GeneratedColumn<String> trigger = GeneratedColumn<String>(
    'trigger',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
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
  static const VerificationMeta _isResistUrgeMeta = const VerificationMeta(
    'isResistUrge',
  );
  @override
  late final GeneratedColumn<String> isResistUrge = GeneratedColumn<String>(
    'is_resist_urge',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _urgeStartedReasonMeta = const VerificationMeta(
    'urgeStartedReason',
  );
  @override
  late final GeneratedColumn<String> urgeStartedReason =
      GeneratedColumn<String>(
        'urge_started_reason',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
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
    relapseHappeningTime,
    trigger,
    urgeIntensity,
    isResistUrge,
    urgeStartedReason,
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
    if (data.containsKey('relapse_happening_time')) {
      context.handle(
        _relapseHappeningTimeMeta,
        relapseHappeningTime.isAcceptableOrUnknown(
          data['relapse_happening_time']!,
          _relapseHappeningTimeMeta,
        ),
      );
    }
    if (data.containsKey('trigger')) {
      context.handle(
        _triggerMeta,
        trigger.isAcceptableOrUnknown(data['trigger']!, _triggerMeta),
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
    if (data.containsKey('is_resist_urge')) {
      context.handle(
        _isResistUrgeMeta,
        isResistUrge.isAcceptableOrUnknown(
          data['is_resist_urge']!,
          _isResistUrgeMeta,
        ),
      );
    }
    if (data.containsKey('urge_started_reason')) {
      context.handle(
        _urgeStartedReasonMeta,
        urgeStartedReason.isAcceptableOrUnknown(
          data['urge_started_reason']!,
          _urgeStartedReasonMeta,
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
      relapseHappeningTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relapse_happening_time'],
      )!,
      trigger: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trigger'],
      )!,
      urgeIntensity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}urge_intensity'],
      ),
      isResistUrge: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}is_resist_urge'],
      )!,
      urgeStartedReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}urge_started_reason'],
      )!,
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
  final String relapseHappeningTime;
  final String trigger;
  final double? urgeIntensity;
  final String isResistUrge;
  final String urgeStartedReason;
  final int day;
  final String monthYear;
  const Relapse({
    required this.id,
    required this.relapseTime,
    required this.relapseHappeningTime,
    required this.trigger,
    this.urgeIntensity,
    required this.isResistUrge,
    required this.urgeStartedReason,
    required this.day,
    required this.monthYear,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['relapse_time'] = Variable<DateTime>(relapseTime);
    map['relapse_happening_time'] = Variable<String>(relapseHappeningTime);
    map['trigger'] = Variable<String>(trigger);
    if (!nullToAbsent || urgeIntensity != null) {
      map['urge_intensity'] = Variable<double>(urgeIntensity);
    }
    map['is_resist_urge'] = Variable<String>(isResistUrge);
    map['urge_started_reason'] = Variable<String>(urgeStartedReason);
    map['day'] = Variable<int>(day);
    map['month_year'] = Variable<String>(monthYear);
    return map;
  }

  RelapsesCompanion toCompanion(bool nullToAbsent) {
    return RelapsesCompanion(
      id: Value(id),
      relapseTime: Value(relapseTime),
      relapseHappeningTime: Value(relapseHappeningTime),
      trigger: Value(trigger),
      urgeIntensity: urgeIntensity == null && nullToAbsent
          ? const Value.absent()
          : Value(urgeIntensity),
      isResistUrge: Value(isResistUrge),
      urgeStartedReason: Value(urgeStartedReason),
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
      relapseHappeningTime: serializer.fromJson<String>(
        json['relapseHappeningTime'],
      ),
      trigger: serializer.fromJson<String>(json['trigger']),
      urgeIntensity: serializer.fromJson<double?>(json['urgeIntensity']),
      isResistUrge: serializer.fromJson<String>(json['isResistUrge']),
      urgeStartedReason: serializer.fromJson<String>(json['urgeStartedReason']),
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
      'relapseHappeningTime': serializer.toJson<String>(relapseHappeningTime),
      'trigger': serializer.toJson<String>(trigger),
      'urgeIntensity': serializer.toJson<double?>(urgeIntensity),
      'isResistUrge': serializer.toJson<String>(isResistUrge),
      'urgeStartedReason': serializer.toJson<String>(urgeStartedReason),
      'day': serializer.toJson<int>(day),
      'monthYear': serializer.toJson<String>(monthYear),
    };
  }

  Relapse copyWith({
    int? id,
    DateTime? relapseTime,
    String? relapseHappeningTime,
    String? trigger,
    Value<double?> urgeIntensity = const Value.absent(),
    String? isResistUrge,
    String? urgeStartedReason,
    int? day,
    String? monthYear,
  }) => Relapse(
    id: id ?? this.id,
    relapseTime: relapseTime ?? this.relapseTime,
    relapseHappeningTime: relapseHappeningTime ?? this.relapseHappeningTime,
    trigger: trigger ?? this.trigger,
    urgeIntensity: urgeIntensity.present
        ? urgeIntensity.value
        : this.urgeIntensity,
    isResistUrge: isResistUrge ?? this.isResistUrge,
    urgeStartedReason: urgeStartedReason ?? this.urgeStartedReason,
    day: day ?? this.day,
    monthYear: monthYear ?? this.monthYear,
  );
  Relapse copyWithCompanion(RelapsesCompanion data) {
    return Relapse(
      id: data.id.present ? data.id.value : this.id,
      relapseTime: data.relapseTime.present
          ? data.relapseTime.value
          : this.relapseTime,
      relapseHappeningTime: data.relapseHappeningTime.present
          ? data.relapseHappeningTime.value
          : this.relapseHappeningTime,
      trigger: data.trigger.present ? data.trigger.value : this.trigger,
      urgeIntensity: data.urgeIntensity.present
          ? data.urgeIntensity.value
          : this.urgeIntensity,
      isResistUrge: data.isResistUrge.present
          ? data.isResistUrge.value
          : this.isResistUrge,
      urgeStartedReason: data.urgeStartedReason.present
          ? data.urgeStartedReason.value
          : this.urgeStartedReason,
      day: data.day.present ? data.day.value : this.day,
      monthYear: data.monthYear.present ? data.monthYear.value : this.monthYear,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Relapse(')
          ..write('id: $id, ')
          ..write('relapseTime: $relapseTime, ')
          ..write('relapseHappeningTime: $relapseHappeningTime, ')
          ..write('trigger: $trigger, ')
          ..write('urgeIntensity: $urgeIntensity, ')
          ..write('isResistUrge: $isResistUrge, ')
          ..write('urgeStartedReason: $urgeStartedReason, ')
          ..write('day: $day, ')
          ..write('monthYear: $monthYear')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    relapseTime,
    relapseHappeningTime,
    trigger,
    urgeIntensity,
    isResistUrge,
    urgeStartedReason,
    day,
    monthYear,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Relapse &&
          other.id == this.id &&
          other.relapseTime == this.relapseTime &&
          other.relapseHappeningTime == this.relapseHappeningTime &&
          other.trigger == this.trigger &&
          other.urgeIntensity == this.urgeIntensity &&
          other.isResistUrge == this.isResistUrge &&
          other.urgeStartedReason == this.urgeStartedReason &&
          other.day == this.day &&
          other.monthYear == this.monthYear);
}

class RelapsesCompanion extends UpdateCompanion<Relapse> {
  final Value<int> id;
  final Value<DateTime> relapseTime;
  final Value<String> relapseHappeningTime;
  final Value<String> trigger;
  final Value<double?> urgeIntensity;
  final Value<String> isResistUrge;
  final Value<String> urgeStartedReason;
  final Value<int> day;
  final Value<String> monthYear;
  const RelapsesCompanion({
    this.id = const Value.absent(),
    this.relapseTime = const Value.absent(),
    this.relapseHappeningTime = const Value.absent(),
    this.trigger = const Value.absent(),
    this.urgeIntensity = const Value.absent(),
    this.isResistUrge = const Value.absent(),
    this.urgeStartedReason = const Value.absent(),
    this.day = const Value.absent(),
    this.monthYear = const Value.absent(),
  });
  RelapsesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime relapseTime,
    this.relapseHappeningTime = const Value.absent(),
    this.trigger = const Value.absent(),
    this.urgeIntensity = const Value.absent(),
    this.isResistUrge = const Value.absent(),
    this.urgeStartedReason = const Value.absent(),
    required int day,
    required String monthYear,
  }) : relapseTime = Value(relapseTime),
       day = Value(day),
       monthYear = Value(monthYear);
  static Insertable<Relapse> custom({
    Expression<int>? id,
    Expression<DateTime>? relapseTime,
    Expression<String>? relapseHappeningTime,
    Expression<String>? trigger,
    Expression<double>? urgeIntensity,
    Expression<String>? isResistUrge,
    Expression<String>? urgeStartedReason,
    Expression<int>? day,
    Expression<String>? monthYear,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (relapseTime != null) 'relapse_time': relapseTime,
      if (relapseHappeningTime != null)
        'relapse_happening_time': relapseHappeningTime,
      if (trigger != null) 'trigger': trigger,
      if (urgeIntensity != null) 'urge_intensity': urgeIntensity,
      if (isResistUrge != null) 'is_resist_urge': isResistUrge,
      if (urgeStartedReason != null) 'urge_started_reason': urgeStartedReason,
      if (day != null) 'day': day,
      if (monthYear != null) 'month_year': monthYear,
    });
  }

  RelapsesCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? relapseTime,
    Value<String>? relapseHappeningTime,
    Value<String>? trigger,
    Value<double?>? urgeIntensity,
    Value<String>? isResistUrge,
    Value<String>? urgeStartedReason,
    Value<int>? day,
    Value<String>? monthYear,
  }) {
    return RelapsesCompanion(
      id: id ?? this.id,
      relapseTime: relapseTime ?? this.relapseTime,
      relapseHappeningTime: relapseHappeningTime ?? this.relapseHappeningTime,
      trigger: trigger ?? this.trigger,
      urgeIntensity: urgeIntensity ?? this.urgeIntensity,
      isResistUrge: isResistUrge ?? this.isResistUrge,
      urgeStartedReason: urgeStartedReason ?? this.urgeStartedReason,
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
    if (relapseHappeningTime.present) {
      map['relapse_happening_time'] = Variable<String>(
        relapseHappeningTime.value,
      );
    }
    if (trigger.present) {
      map['trigger'] = Variable<String>(trigger.value);
    }
    if (urgeIntensity.present) {
      map['urge_intensity'] = Variable<double>(urgeIntensity.value);
    }
    if (isResistUrge.present) {
      map['is_resist_urge'] = Variable<String>(isResistUrge.value);
    }
    if (urgeStartedReason.present) {
      map['urge_started_reason'] = Variable<String>(urgeStartedReason.value);
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
          ..write('relapseHappeningTime: $relapseHappeningTime, ')
          ..write('trigger: $trigger, ')
          ..write('urgeIntensity: $urgeIntensity, ')
          ..write('isResistUrge: $isResistUrge, ')
          ..write('urgeStartedReason: $urgeStartedReason, ')
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

class $StatsTable extends Stats with TableInfo<$StatsTable, Stat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _totalCleanDaysMeta = const VerificationMeta(
    'totalCleanDays',
  );
  @override
  late final GeneratedColumn<int> totalCleanDays = GeneratedColumn<int>(
    'total_clean_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _relapseCountMeta = const VerificationMeta(
    'relapseCount',
  );
  @override
  late final GeneratedColumn<int> relapseCount = GeneratedColumn<int>(
    'relapse_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _longestStreakMeta = const VerificationMeta(
    'longestStreak',
  );
  @override
  late final GeneratedColumn<int> longestStreak = GeneratedColumn<int>(
    'longest_streak',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    totalCleanDays,
    relapseCount,
    longestStreak,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stats';
  @override
  VerificationContext validateIntegrity(
    Insertable<Stat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('total_clean_days')) {
      context.handle(
        _totalCleanDaysMeta,
        totalCleanDays.isAcceptableOrUnknown(
          data['total_clean_days']!,
          _totalCleanDaysMeta,
        ),
      );
    }
    if (data.containsKey('relapse_count')) {
      context.handle(
        _relapseCountMeta,
        relapseCount.isAcceptableOrUnknown(
          data['relapse_count']!,
          _relapseCountMeta,
        ),
      );
    }
    if (data.containsKey('longest_streak')) {
      context.handle(
        _longestStreakMeta,
        longestStreak.isAcceptableOrUnknown(
          data['longest_streak']!,
          _longestStreakMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Stat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Stat(
      totalCleanDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_clean_days'],
      )!,
      relapseCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}relapse_count'],
      )!,
      longestStreak: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}longest_streak'],
      )!,
    );
  }

  @override
  $StatsTable createAlias(String alias) {
    return $StatsTable(attachedDatabase, alias);
  }
}

class Stat extends DataClass implements Insertable<Stat> {
  final int totalCleanDays;
  final int relapseCount;
  final int longestStreak;
  const Stat({
    required this.totalCleanDays,
    required this.relapseCount,
    required this.longestStreak,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['total_clean_days'] = Variable<int>(totalCleanDays);
    map['relapse_count'] = Variable<int>(relapseCount);
    map['longest_streak'] = Variable<int>(longestStreak);
    return map;
  }

  StatsCompanion toCompanion(bool nullToAbsent) {
    return StatsCompanion(
      totalCleanDays: Value(totalCleanDays),
      relapseCount: Value(relapseCount),
      longestStreak: Value(longestStreak),
    );
  }

  factory Stat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Stat(
      totalCleanDays: serializer.fromJson<int>(json['totalCleanDays']),
      relapseCount: serializer.fromJson<int>(json['relapseCount']),
      longestStreak: serializer.fromJson<int>(json['longestStreak']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'totalCleanDays': serializer.toJson<int>(totalCleanDays),
      'relapseCount': serializer.toJson<int>(relapseCount),
      'longestStreak': serializer.toJson<int>(longestStreak),
    };
  }

  Stat copyWith({int? totalCleanDays, int? relapseCount, int? longestStreak}) =>
      Stat(
        totalCleanDays: totalCleanDays ?? this.totalCleanDays,
        relapseCount: relapseCount ?? this.relapseCount,
        longestStreak: longestStreak ?? this.longestStreak,
      );
  Stat copyWithCompanion(StatsCompanion data) {
    return Stat(
      totalCleanDays: data.totalCleanDays.present
          ? data.totalCleanDays.value
          : this.totalCleanDays,
      relapseCount: data.relapseCount.present
          ? data.relapseCount.value
          : this.relapseCount,
      longestStreak: data.longestStreak.present
          ? data.longestStreak.value
          : this.longestStreak,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Stat(')
          ..write('totalCleanDays: $totalCleanDays, ')
          ..write('relapseCount: $relapseCount, ')
          ..write('longestStreak: $longestStreak')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(totalCleanDays, relapseCount, longestStreak);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Stat &&
          other.totalCleanDays == this.totalCleanDays &&
          other.relapseCount == this.relapseCount &&
          other.longestStreak == this.longestStreak);
}

class StatsCompanion extends UpdateCompanion<Stat> {
  final Value<int> totalCleanDays;
  final Value<int> relapseCount;
  final Value<int> longestStreak;
  final Value<int> rowid;
  const StatsCompanion({
    this.totalCleanDays = const Value.absent(),
    this.relapseCount = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StatsCompanion.insert({
    this.totalCleanDays = const Value.absent(),
    this.relapseCount = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<Stat> custom({
    Expression<int>? totalCleanDays,
    Expression<int>? relapseCount,
    Expression<int>? longestStreak,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (totalCleanDays != null) 'total_clean_days': totalCleanDays,
      if (relapseCount != null) 'relapse_count': relapseCount,
      if (longestStreak != null) 'longest_streak': longestStreak,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StatsCompanion copyWith({
    Value<int>? totalCleanDays,
    Value<int>? relapseCount,
    Value<int>? longestStreak,
    Value<int>? rowid,
  }) {
    return StatsCompanion(
      totalCleanDays: totalCleanDays ?? this.totalCleanDays,
      relapseCount: relapseCount ?? this.relapseCount,
      longestStreak: longestStreak ?? this.longestStreak,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (totalCleanDays.present) {
      map['total_clean_days'] = Variable<int>(totalCleanDays.value);
    }
    if (relapseCount.present) {
      map['relapse_count'] = Variable<int>(relapseCount.value);
    }
    if (longestStreak.present) {
      map['longest_streak'] = Variable<int>(longestStreak.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatsCompanion(')
          ..write('totalCleanDays: $totalCleanDays, ')
          ..write('relapseCount: $relapseCount, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TriggersTable extends Triggers with TableInfo<$TriggersTable, Trigger> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TriggersTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _triggerMeta = const VerificationMeta(
    'trigger',
  );
  @override
  late final GeneratedColumn<String> trigger = GeneratedColumn<String>(
    'trigger',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, trigger];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'triggers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Trigger> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('trigger')) {
      context.handle(
        _triggerMeta,
        trigger.isAcceptableOrUnknown(data['trigger']!, _triggerMeta),
      );
    } else if (isInserting) {
      context.missing(_triggerMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Trigger map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Trigger(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      trigger: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trigger'],
      )!,
    );
  }

  @override
  $TriggersTable createAlias(String alias) {
    return $TriggersTable(attachedDatabase, alias);
  }
}

class Trigger extends DataClass implements Insertable<Trigger> {
  final int id;
  final String trigger;
  const Trigger({required this.id, required this.trigger});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['trigger'] = Variable<String>(trigger);
    return map;
  }

  TriggersCompanion toCompanion(bool nullToAbsent) {
    return TriggersCompanion(id: Value(id), trigger: Value(trigger));
  }

  factory Trigger.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Trigger(
      id: serializer.fromJson<int>(json['id']),
      trigger: serializer.fromJson<String>(json['trigger']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'trigger': serializer.toJson<String>(trigger),
    };
  }

  Trigger copyWith({int? id, String? trigger}) =>
      Trigger(id: id ?? this.id, trigger: trigger ?? this.trigger);
  Trigger copyWithCompanion(TriggersCompanion data) {
    return Trigger(
      id: data.id.present ? data.id.value : this.id,
      trigger: data.trigger.present ? data.trigger.value : this.trigger,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Trigger(')
          ..write('id: $id, ')
          ..write('trigger: $trigger')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, trigger);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Trigger &&
          other.id == this.id &&
          other.trigger == this.trigger);
}

class TriggersCompanion extends UpdateCompanion<Trigger> {
  final Value<int> id;
  final Value<String> trigger;
  const TriggersCompanion({
    this.id = const Value.absent(),
    this.trigger = const Value.absent(),
  });
  TriggersCompanion.insert({
    this.id = const Value.absent(),
    required String trigger,
  }) : trigger = Value(trigger);
  static Insertable<Trigger> custom({
    Expression<int>? id,
    Expression<String>? trigger,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trigger != null) 'trigger': trigger,
    });
  }

  TriggersCompanion copyWith({Value<int>? id, Value<String>? trigger}) {
    return TriggersCompanion(
      id: id ?? this.id,
      trigger: trigger ?? this.trigger,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (trigger.present) {
      map['trigger'] = Variable<String>(trigger.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TriggersCompanion(')
          ..write('id: $id, ')
          ..write('trigger: $trigger')
          ..write(')'))
        .toString();
  }
}

class $CheckInsTable extends CheckIns with TableInfo<$CheckInsTable, CheckIn> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CheckInsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
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
  static const VerificationMeta _isCleanMeta = const VerificationMeta(
    'isClean',
  );
  @override
  late final GeneratedColumn<bool> isClean = GeneratedColumn<bool>(
    'is_clean',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_clean" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [id, date, day, monthYear, isClean];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'check_ins';
  @override
  VerificationContext validateIntegrity(
    Insertable<CheckIn> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
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
    if (data.containsKey('is_clean')) {
      context.handle(
        _isCleanMeta,
        isClean.isAcceptableOrUnknown(data['is_clean']!, _isCleanMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CheckIn map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CheckIn(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      day: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day'],
      )!,
      monthYear: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}month_year'],
      )!,
      isClean: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_clean'],
      )!,
    );
  }

  @override
  $CheckInsTable createAlias(String alias) {
    return $CheckInsTable(attachedDatabase, alias);
  }
}

class CheckIn extends DataClass implements Insertable<CheckIn> {
  final int id;
  final DateTime date;
  final int day;
  final String monthYear;
  final bool isClean;
  const CheckIn({
    required this.id,
    required this.date,
    required this.day,
    required this.monthYear,
    required this.isClean,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['day'] = Variable<int>(day);
    map['month_year'] = Variable<String>(monthYear);
    map['is_clean'] = Variable<bool>(isClean);
    return map;
  }

  CheckInsCompanion toCompanion(bool nullToAbsent) {
    return CheckInsCompanion(
      id: Value(id),
      date: Value(date),
      day: Value(day),
      monthYear: Value(monthYear),
      isClean: Value(isClean),
    );
  }

  factory CheckIn.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CheckIn(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      day: serializer.fromJson<int>(json['day']),
      monthYear: serializer.fromJson<String>(json['monthYear']),
      isClean: serializer.fromJson<bool>(json['isClean']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'day': serializer.toJson<int>(day),
      'monthYear': serializer.toJson<String>(monthYear),
      'isClean': serializer.toJson<bool>(isClean),
    };
  }

  CheckIn copyWith({
    int? id,
    DateTime? date,
    int? day,
    String? monthYear,
    bool? isClean,
  }) => CheckIn(
    id: id ?? this.id,
    date: date ?? this.date,
    day: day ?? this.day,
    monthYear: monthYear ?? this.monthYear,
    isClean: isClean ?? this.isClean,
  );
  CheckIn copyWithCompanion(CheckInsCompanion data) {
    return CheckIn(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      day: data.day.present ? data.day.value : this.day,
      monthYear: data.monthYear.present ? data.monthYear.value : this.monthYear,
      isClean: data.isClean.present ? data.isClean.value : this.isClean,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CheckIn(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('day: $day, ')
          ..write('monthYear: $monthYear, ')
          ..write('isClean: $isClean')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, day, monthYear, isClean);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CheckIn &&
          other.id == this.id &&
          other.date == this.date &&
          other.day == this.day &&
          other.monthYear == this.monthYear &&
          other.isClean == this.isClean);
}

class CheckInsCompanion extends UpdateCompanion<CheckIn> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> day;
  final Value<String> monthYear;
  final Value<bool> isClean;
  const CheckInsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.day = const Value.absent(),
    this.monthYear = const Value.absent(),
    this.isClean = const Value.absent(),
  });
  CheckInsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required int day,
    required String monthYear,
    this.isClean = const Value.absent(),
  }) : date = Value(date),
       day = Value(day),
       monthYear = Value(monthYear);
  static Insertable<CheckIn> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? day,
    Expression<String>? monthYear,
    Expression<bool>? isClean,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (day != null) 'day': day,
      if (monthYear != null) 'month_year': monthYear,
      if (isClean != null) 'is_clean': isClean,
    });
  }

  CheckInsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<int>? day,
    Value<String>? monthYear,
    Value<bool>? isClean,
  }) {
    return CheckInsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      day: day ?? this.day,
      monthYear: monthYear ?? this.monthYear,
      isClean: isClean ?? this.isClean,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (day.present) {
      map['day'] = Variable<int>(day.value);
    }
    if (monthYear.present) {
      map['month_year'] = Variable<String>(monthYear.value);
    }
    if (isClean.present) {
      map['is_clean'] = Variable<bool>(isClean.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CheckInsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('day: $day, ')
          ..write('monthYear: $monthYear, ')
          ..write('isClean: $isClean')
          ..write(')'))
        .toString();
  }
}

class $ActionsTable extends Actions with TableInfo<$ActionsTable, Action> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActionsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, action];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'actions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Action> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Action map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Action(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
    );
  }

  @override
  $ActionsTable createAlias(String alias) {
    return $ActionsTable(attachedDatabase, alias);
  }
}

class Action extends DataClass implements Insertable<Action> {
  final int id;
  final String action;
  const Action({required this.id, required this.action});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['action'] = Variable<String>(action);
    return map;
  }

  ActionsCompanion toCompanion(bool nullToAbsent) {
    return ActionsCompanion(id: Value(id), action: Value(action));
  }

  factory Action.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Action(
      id: serializer.fromJson<int>(json['id']),
      action: serializer.fromJson<String>(json['action']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'action': serializer.toJson<String>(action),
    };
  }

  Action copyWith({int? id, String? action}) =>
      Action(id: id ?? this.id, action: action ?? this.action);
  Action copyWithCompanion(ActionsCompanion data) {
    return Action(
      id: data.id.present ? data.id.value : this.id,
      action: data.action.present ? data.action.value : this.action,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Action(')
          ..write('id: $id, ')
          ..write('action: $action')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, action);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Action && other.id == this.id && other.action == this.action);
}

class ActionsCompanion extends UpdateCompanion<Action> {
  final Value<int> id;
  final Value<String> action;
  const ActionsCompanion({
    this.id = const Value.absent(),
    this.action = const Value.absent(),
  });
  ActionsCompanion.insert({
    this.id = const Value.absent(),
    required String action,
  }) : action = Value(action);
  static Insertable<Action> custom({
    Expression<int>? id,
    Expression<String>? action,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (action != null) 'action': action,
    });
  }

  ActionsCompanion copyWith({Value<int>? id, Value<String>? action}) {
    return ActionsCompanion(id: id ?? this.id, action: action ?? this.action);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActionsCompanion(')
          ..write('id: $id, ')
          ..write('action: $action')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RelapsesTable relapses = $RelapsesTable(this);
  late final $JournalsTable journals = $JournalsTable(this);
  late final $StatsTable stats = $StatsTable(this);
  late final $TriggersTable triggers = $TriggersTable(this);
  late final $CheckInsTable checkIns = $CheckInsTable(this);
  late final $ActionsTable actions = $ActionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    relapses,
    journals,
    stats,
    triggers,
    checkIns,
    actions,
  ];
}

typedef $$RelapsesTableCreateCompanionBuilder =
    RelapsesCompanion Function({
      Value<int> id,
      required DateTime relapseTime,
      Value<String> relapseHappeningTime,
      Value<String> trigger,
      Value<double?> urgeIntensity,
      Value<String> isResistUrge,
      Value<String> urgeStartedReason,
      required int day,
      required String monthYear,
    });
typedef $$RelapsesTableUpdateCompanionBuilder =
    RelapsesCompanion Function({
      Value<int> id,
      Value<DateTime> relapseTime,
      Value<String> relapseHappeningTime,
      Value<String> trigger,
      Value<double?> urgeIntensity,
      Value<String> isResistUrge,
      Value<String> urgeStartedReason,
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

  ColumnFilters<String> get relapseHappeningTime => $composableBuilder(
    column: $table.relapseHappeningTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trigger => $composableBuilder(
    column: $table.trigger,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get urgeIntensity => $composableBuilder(
    column: $table.urgeIntensity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get isResistUrge => $composableBuilder(
    column: $table.isResistUrge,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get urgeStartedReason => $composableBuilder(
    column: $table.urgeStartedReason,
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

  ColumnOrderings<String> get relapseHappeningTime => $composableBuilder(
    column: $table.relapseHappeningTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trigger => $composableBuilder(
    column: $table.trigger,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get urgeIntensity => $composableBuilder(
    column: $table.urgeIntensity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get isResistUrge => $composableBuilder(
    column: $table.isResistUrge,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get urgeStartedReason => $composableBuilder(
    column: $table.urgeStartedReason,
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

  GeneratedColumn<String> get relapseHappeningTime => $composableBuilder(
    column: $table.relapseHappeningTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get trigger =>
      $composableBuilder(column: $table.trigger, builder: (column) => column);

  GeneratedColumn<double> get urgeIntensity => $composableBuilder(
    column: $table.urgeIntensity,
    builder: (column) => column,
  );

  GeneratedColumn<String> get isResistUrge => $composableBuilder(
    column: $table.isResistUrge,
    builder: (column) => column,
  );

  GeneratedColumn<String> get urgeStartedReason => $composableBuilder(
    column: $table.urgeStartedReason,
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
                Value<String> relapseHappeningTime = const Value.absent(),
                Value<String> trigger = const Value.absent(),
                Value<double?> urgeIntensity = const Value.absent(),
                Value<String> isResistUrge = const Value.absent(),
                Value<String> urgeStartedReason = const Value.absent(),
                Value<int> day = const Value.absent(),
                Value<String> monthYear = const Value.absent(),
              }) => RelapsesCompanion(
                id: id,
                relapseTime: relapseTime,
                relapseHappeningTime: relapseHappeningTime,
                trigger: trigger,
                urgeIntensity: urgeIntensity,
                isResistUrge: isResistUrge,
                urgeStartedReason: urgeStartedReason,
                day: day,
                monthYear: monthYear,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime relapseTime,
                Value<String> relapseHappeningTime = const Value.absent(),
                Value<String> trigger = const Value.absent(),
                Value<double?> urgeIntensity = const Value.absent(),
                Value<String> isResistUrge = const Value.absent(),
                Value<String> urgeStartedReason = const Value.absent(),
                required int day,
                required String monthYear,
              }) => RelapsesCompanion.insert(
                id: id,
                relapseTime: relapseTime,
                relapseHappeningTime: relapseHappeningTime,
                trigger: trigger,
                urgeIntensity: urgeIntensity,
                isResistUrge: isResistUrge,
                urgeStartedReason: urgeStartedReason,
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
typedef $$StatsTableCreateCompanionBuilder =
    StatsCompanion Function({
      Value<int> totalCleanDays,
      Value<int> relapseCount,
      Value<int> longestStreak,
      Value<int> rowid,
    });
typedef $$StatsTableUpdateCompanionBuilder =
    StatsCompanion Function({
      Value<int> totalCleanDays,
      Value<int> relapseCount,
      Value<int> longestStreak,
      Value<int> rowid,
    });

class $$StatsTableFilterComposer extends Composer<_$AppDatabase, $StatsTable> {
  $$StatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get totalCleanDays => $composableBuilder(
    column: $table.totalCleanDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get relapseCount => $composableBuilder(
    column: $table.relapseCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StatsTableOrderingComposer
    extends Composer<_$AppDatabase, $StatsTable> {
  $$StatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get totalCleanDays => $composableBuilder(
    column: $table.totalCleanDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get relapseCount => $composableBuilder(
    column: $table.relapseCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StatsTable> {
  $$StatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get totalCleanDays => $composableBuilder(
    column: $table.totalCleanDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get relapseCount => $composableBuilder(
    column: $table.relapseCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => column,
  );
}

class $$StatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StatsTable,
          Stat,
          $$StatsTableFilterComposer,
          $$StatsTableOrderingComposer,
          $$StatsTableAnnotationComposer,
          $$StatsTableCreateCompanionBuilder,
          $$StatsTableUpdateCompanionBuilder,
          (Stat, BaseReferences<_$AppDatabase, $StatsTable, Stat>),
          Stat,
          PrefetchHooks Function()
        > {
  $$StatsTableTableManager(_$AppDatabase db, $StatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> totalCleanDays = const Value.absent(),
                Value<int> relapseCount = const Value.absent(),
                Value<int> longestStreak = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StatsCompanion(
                totalCleanDays: totalCleanDays,
                relapseCount: relapseCount,
                longestStreak: longestStreak,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<int> totalCleanDays = const Value.absent(),
                Value<int> relapseCount = const Value.absent(),
                Value<int> longestStreak = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StatsCompanion.insert(
                totalCleanDays: totalCleanDays,
                relapseCount: relapseCount,
                longestStreak: longestStreak,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StatsTable,
      Stat,
      $$StatsTableFilterComposer,
      $$StatsTableOrderingComposer,
      $$StatsTableAnnotationComposer,
      $$StatsTableCreateCompanionBuilder,
      $$StatsTableUpdateCompanionBuilder,
      (Stat, BaseReferences<_$AppDatabase, $StatsTable, Stat>),
      Stat,
      PrefetchHooks Function()
    >;
typedef $$TriggersTableCreateCompanionBuilder =
    TriggersCompanion Function({Value<int> id, required String trigger});
typedef $$TriggersTableUpdateCompanionBuilder =
    TriggersCompanion Function({Value<int> id, Value<String> trigger});

class $$TriggersTableFilterComposer
    extends Composer<_$AppDatabase, $TriggersTable> {
  $$TriggersTableFilterComposer({
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

  ColumnFilters<String> get trigger => $composableBuilder(
    column: $table.trigger,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TriggersTableOrderingComposer
    extends Composer<_$AppDatabase, $TriggersTable> {
  $$TriggersTableOrderingComposer({
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

  ColumnOrderings<String> get trigger => $composableBuilder(
    column: $table.trigger,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TriggersTableAnnotationComposer
    extends Composer<_$AppDatabase, $TriggersTable> {
  $$TriggersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get trigger =>
      $composableBuilder(column: $table.trigger, builder: (column) => column);
}

class $$TriggersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TriggersTable,
          Trigger,
          $$TriggersTableFilterComposer,
          $$TriggersTableOrderingComposer,
          $$TriggersTableAnnotationComposer,
          $$TriggersTableCreateCompanionBuilder,
          $$TriggersTableUpdateCompanionBuilder,
          (Trigger, BaseReferences<_$AppDatabase, $TriggersTable, Trigger>),
          Trigger,
          PrefetchHooks Function()
        > {
  $$TriggersTableTableManager(_$AppDatabase db, $TriggersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TriggersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TriggersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TriggersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> trigger = const Value.absent(),
              }) => TriggersCompanion(id: id, trigger: trigger),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String trigger,
              }) => TriggersCompanion.insert(id: id, trigger: trigger),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TriggersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TriggersTable,
      Trigger,
      $$TriggersTableFilterComposer,
      $$TriggersTableOrderingComposer,
      $$TriggersTableAnnotationComposer,
      $$TriggersTableCreateCompanionBuilder,
      $$TriggersTableUpdateCompanionBuilder,
      (Trigger, BaseReferences<_$AppDatabase, $TriggersTable, Trigger>),
      Trigger,
      PrefetchHooks Function()
    >;
typedef $$CheckInsTableCreateCompanionBuilder =
    CheckInsCompanion Function({
      Value<int> id,
      required DateTime date,
      required int day,
      required String monthYear,
      Value<bool> isClean,
    });
typedef $$CheckInsTableUpdateCompanionBuilder =
    CheckInsCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<int> day,
      Value<String> monthYear,
      Value<bool> isClean,
    });

class $$CheckInsTableFilterComposer
    extends Composer<_$AppDatabase, $CheckInsTable> {
  $$CheckInsTableFilterComposer({
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

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
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

  ColumnFilters<bool> get isClean => $composableBuilder(
    column: $table.isClean,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CheckInsTableOrderingComposer
    extends Composer<_$AppDatabase, $CheckInsTable> {
  $$CheckInsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
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

  ColumnOrderings<bool> get isClean => $composableBuilder(
    column: $table.isClean,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CheckInsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CheckInsTable> {
  $$CheckInsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<String> get monthYear =>
      $composableBuilder(column: $table.monthYear, builder: (column) => column);

  GeneratedColumn<bool> get isClean =>
      $composableBuilder(column: $table.isClean, builder: (column) => column);
}

class $$CheckInsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CheckInsTable,
          CheckIn,
          $$CheckInsTableFilterComposer,
          $$CheckInsTableOrderingComposer,
          $$CheckInsTableAnnotationComposer,
          $$CheckInsTableCreateCompanionBuilder,
          $$CheckInsTableUpdateCompanionBuilder,
          (CheckIn, BaseReferences<_$AppDatabase, $CheckInsTable, CheckIn>),
          CheckIn,
          PrefetchHooks Function()
        > {
  $$CheckInsTableTableManager(_$AppDatabase db, $CheckInsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CheckInsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CheckInsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CheckInsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> day = const Value.absent(),
                Value<String> monthYear = const Value.absent(),
                Value<bool> isClean = const Value.absent(),
              }) => CheckInsCompanion(
                id: id,
                date: date,
                day: day,
                monthYear: monthYear,
                isClean: isClean,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required int day,
                required String monthYear,
                Value<bool> isClean = const Value.absent(),
              }) => CheckInsCompanion.insert(
                id: id,
                date: date,
                day: day,
                monthYear: monthYear,
                isClean: isClean,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CheckInsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CheckInsTable,
      CheckIn,
      $$CheckInsTableFilterComposer,
      $$CheckInsTableOrderingComposer,
      $$CheckInsTableAnnotationComposer,
      $$CheckInsTableCreateCompanionBuilder,
      $$CheckInsTableUpdateCompanionBuilder,
      (CheckIn, BaseReferences<_$AppDatabase, $CheckInsTable, CheckIn>),
      CheckIn,
      PrefetchHooks Function()
    >;
typedef $$ActionsTableCreateCompanionBuilder =
    ActionsCompanion Function({Value<int> id, required String action});
typedef $$ActionsTableUpdateCompanionBuilder =
    ActionsCompanion Function({Value<int> id, Value<String> action});

class $$ActionsTableFilterComposer
    extends Composer<_$AppDatabase, $ActionsTable> {
  $$ActionsTableFilterComposer({
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

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ActionsTableOrderingComposer
    extends Composer<_$AppDatabase, $ActionsTable> {
  $$ActionsTableOrderingComposer({
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

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActionsTable> {
  $$ActionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);
}

class $$ActionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActionsTable,
          Action,
          $$ActionsTableFilterComposer,
          $$ActionsTableOrderingComposer,
          $$ActionsTableAnnotationComposer,
          $$ActionsTableCreateCompanionBuilder,
          $$ActionsTableUpdateCompanionBuilder,
          (Action, BaseReferences<_$AppDatabase, $ActionsTable, Action>),
          Action,
          PrefetchHooks Function()
        > {
  $$ActionsTableTableManager(_$AppDatabase db, $ActionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> action = const Value.absent(),
              }) => ActionsCompanion(id: id, action: action),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String action,
              }) => ActionsCompanion.insert(id: id, action: action),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ActionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActionsTable,
      Action,
      $$ActionsTableFilterComposer,
      $$ActionsTableOrderingComposer,
      $$ActionsTableAnnotationComposer,
      $$ActionsTableCreateCompanionBuilder,
      $$ActionsTableUpdateCompanionBuilder,
      (Action, BaseReferences<_$AppDatabase, $ActionsTable, Action>),
      Action,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RelapsesTableTableManager get relapses =>
      $$RelapsesTableTableManager(_db, _db.relapses);
  $$JournalsTableTableManager get journals =>
      $$JournalsTableTableManager(_db, _db.journals);
  $$StatsTableTableManager get stats =>
      $$StatsTableTableManager(_db, _db.stats);
  $$TriggersTableTableManager get triggers =>
      $$TriggersTableTableManager(_db, _db.triggers);
  $$CheckInsTableTableManager get checkIns =>
      $$CheckInsTableTableManager(_db, _db.checkIns);
  $$ActionsTableTableManager get actions =>
      $$ActionsTableTableManager(_db, _db.actions);
}
