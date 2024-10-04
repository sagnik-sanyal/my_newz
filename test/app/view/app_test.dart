import 'package:flutter_test/flutter_test.dart';
import 'package:mynewz/app/app.dart';
import 'package:mynewz/features/feed/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
