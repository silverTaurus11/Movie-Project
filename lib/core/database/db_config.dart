class DbConfig {
  final String dbName;
  final int dbVersion;
  final Map<String, String> tables;

  DbConfig({
    required this.dbName,
    required this.dbVersion,
    required this.tables,
  });

  factory DbConfig.fromJson(Map<String, dynamic> json) {
    return DbConfig(
      dbName: json['dbName'] as String,
      dbVersion: json['dbVersion'] as int,
      tables: Map<String, String>.from(json['tables']),
    );
  }
}