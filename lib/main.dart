import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rama_otaqu/core/config/di/di.dart';
import 'package:rama_otaqu/core/services/databases/local_db.dart';
import 'package:rama_otaqu/otaqu_app.dart';

Future<void> main() async {
  await initialize();

  runApp(OtaquApp());
}

Future<void> initialize() async {
  await dotenv.load(fileName: ".env");
  configureDependencies();
  final db = getIt<LocalDb>();
  await db.init();
}
