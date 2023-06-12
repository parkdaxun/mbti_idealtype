import 'package:flutter/material.dart';
import 'package:mbti_idealtype/splash.dart';
import 'package:get_storage/get_storage.dart';

Future main() async {
  // MBTI 점수 초기화하기
  final storage = GetStorage();
  storage.write('E', 0);
  storage.write('N', 0);
  storage.write('S', 0);
  storage.write('N', 0);
  storage.write('F', 0);
  storage.write('T', 0);
  storage.write('P', 0);
  storage.write('J', 0);

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MaterialApp(
    home: splash(),
  ));
}