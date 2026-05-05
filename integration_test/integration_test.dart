import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tiktok_clone/firebase_options.dart';
import 'package:tiktok_clone/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseAuth.instance.signOut();
  });

  testWidgets(
    "Create Account Flow",
    (WidgetTester tester) async {
      await tester.pumpWidget(ProviderScope(
        child: TiktokApp(),
      ));
      await tester.pumpAndSettle();
      expect(find.text("Sign up for TikTok"), findsOneWidget);
      final login = find.text("Log in");
      expect(login, findsOneWidget);
      // 다른 화면으로 전환시켜주는 역할을 함
      await tester.tap(find.text("Log in"));
      await tester.pumpAndSettle(Duration(seconds: 20));
      final signUp = find.text("Sign up");
      expect(signUp, findsOneWidget);
      await tester.tap(signUp);
      await tester.pumpAndSettle();
      final EmailBtn = find.text("Use email & password");
    },
  );
}
