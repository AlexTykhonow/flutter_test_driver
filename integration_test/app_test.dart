import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_driver/main.dart';
import 'package:integration_test/integration_test.dart';


void main() {
  group('Testing App Performance Tests', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
    as IntegrationTestWidgetsFlutterBinding;

    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;



    testWidgets('Fields test', (tester) async {
      await tester.pumpWidget(TestingApp());

      await tester.tap(find.text('Fields'));
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('Item find'), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: 1));

//icon button
      await tester.tap(find.byIcon(Icons.sailing));
      await tester.pumpAndSettle(Duration(seconds: 1));

//button
      await tester.tap(find.byKey(Key('elevated_button')));
      await tester.pumpAndSettle(Duration(seconds: 1));

//textfield
      tester.testTextInput.register();
      await tester.tap(find.byKey(Key('text_Form_button')));
      await tester.pumpAndSettle(Duration(seconds: 1));
      await tester.enterText(find.byKey(Key('text_Form_button')), 'hello world');
      await tester.pumpAndSettle(Duration(seconds: 1));
      await tester.enterText(find.byKey(Key('text_Form_button')), 'hello world :)');
      await tester.pumpAndSettle(Duration(seconds: 10));

//dropdown( check duration)
      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle(Duration(seconds: 1));
      //dropdown find item 'three'
      await tester.tap(find.text('Three').last);
      //dropdown tap on position
      //position tap
      //await tester.tapAt(Offset(200, 400));
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('Three'), findsOneWidget);

//switch
      await tester.tap(find.byKey(Key('switch_button')));
      await tester.pumpAndSettle(Duration(seconds: 1));

//ratio
      await tester.tap(find.byKey(Key('radio_2_button')));
      await tester.pumpAndSettle(Duration(seconds: 5));

// checkbox
      await tester.tap(find.byKey(Key('check_box')));
      await tester.pumpAndSettle(Duration(seconds: 5));

      await tester.tap(find.byTooltip('Back'));
      await tester.pumpAndSettle(Duration(seconds: 1));


    });
    testWidgets('Scrolling test', (tester) async {
      await tester.pumpWidget(TestingApp());

      final listFinder = find.byType(ListView);

      await binding.watchPerformance(() async {
        await tester.fling(listFinder, Offset(0, -500), 100);
        await tester.pumpAndSettle();

        await tester.fling(listFinder, Offset(0, 500), 100);
        await tester.pumpAndSettle();
      }, reportKey: 'scrolling_summary');
    });
    testWidgets('Favorites operations test', (tester) async {
      await tester.pumpWidget(TestingApp());

      final iconKeys = [
        'icon_0',
        'icon_1',
        'icon_2',
        'icon_3',
        'icon_4',
        'icon_5',
      ];

      for (var icon in iconKeys) {
        await tester.tap(find.byKey(ValueKey(icon)));
        await tester.pumpAndSettle(Duration(seconds: 1));

        expect(find.text('Added to favorites.'), findsOneWidget);
      }

      await tester.tap(find.text('Favorites'));
      await tester.pumpAndSettle();

      final removeIconKeys = [
        'remove_icon_0',
        'remove_icon_1',
        'remove_icon_2',
        'remove_icon_4',
      ];

      for (final iconKey in removeIconKeys) {
        await tester.tap(find.byKey(ValueKey(iconKey)));
        await tester.pumpAndSettle(Duration(seconds: 1));

        expect(find.text('Removed from favorites.'), findsOneWidget);
      }
      await tester.tap(find.byTooltip('Back'));
      await tester.pumpAndSettle();
    });
  });

}