import 'package:eventreportingsystem/core/network/network_handler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNetworkInfo extends Mock implements NetworkHandler {}
void main() {
  MockNetworkInfo mockNetworkInfo;

  setUp((){
    mockNetworkInfo = MockNetworkInfo();
  });

  test(
    'device should be connected with internet', 
    () async {
      var result = await mockNetworkInfo.isConnected();

      expect(result, true);
    }
  );
}