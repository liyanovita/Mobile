// test/widget_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_api/main.dart';
import 'package:my_flutter_api/screens/splash_screen.dart';  

void main() {
  testWidgets('Initial route loads correctly', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the initial route is the SplashScreen
    expect(find.byType(SplashScreen), findsOneWidget);

    // Tap the button to navigate to the Login screen if necessary (this is just an example)
    // You can add more actions based on your app's flow.
    // For example, if you want to test login functionality:
    // await tester.tap(find.byType(ElevatedButton));
    // await tester.pump();

    // Verify that the LoginScreen is shown
    // expect(find.byType(LoginScreen), findsOneWidget);
  });
}

