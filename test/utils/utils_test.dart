import 'package:flutter_test/flutter_test.dart';
import 'package:comic_book/utils/utils.dart';

void main() {
  group('Utils Tests', () {
    test('should return part before at if email contains at', () async {
      String email = "test@example.com";
      String result = filterEmail(email);
      expect(result, "test");
    });

    test('Should return null when message does not contain any error keyword',
        () async {
      String message = "This is a normal message";
      int? errorCode = analyzeMessage(message);
      expect(errorCode, null);
    });

    test('should return null when errorMessages list is empty', () async {
      String message = "This is an error message";
      int? errorCode = analyzeMessage(message);
      expect(errorCode, null);
    });

    test('Should return empty string when given an empty string', () async {
      String url = '';
      String result = captureIssueId(url);
      expect(result, '');
    });

    test('Should return empty string when given an invalid URL', () async {
      String url = 'https://comicvine.gamespot.com/api/issue/4000-6/';
      String result = captureIssueId(url);
      expect(result, 'issue/4000-6/');
    });
  });
}
