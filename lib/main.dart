import 'package:andy_portfolio/contents.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  //increaseVisitorCount();
  //sfsfsefse
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '신현우 Portfolio',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false, // 디버그 플래그 제거
      home: ResponsiveScreen(),
    );
  }
}

Future<void> increaseVisitorCount() async {
  const String functionUrl = "https://getvisitorip-hqwry7wj4a-an.a.run.app";
  try {
    final response = await http.get(
      Uri.parse(functionUrl),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      print("📊 방문자 수 업데이트 완료! 응답: ${response.body}");
    } else {
      print("❌ 방문자 수 업데이트 실패! 상태 코드: ${response.statusCode}");
    }
  } catch (e) {
    print("🔥 Firebase Function 호출 중 오류 발생: $e");
  }
}
