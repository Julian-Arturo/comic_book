import 'package:comic_book/common/toast_extension.dart';
import 'package:comic_book/common/failures/common_failure.dart';
import 'package:comic_book/utils/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

final log = Logger('UtilsClass');

// Function to filter email and return only the part before '@'
String filterEmail(String email) {
  int atIndex = email.indexOf('@');
  if (atIndex != -1) {
    return email.substring(0, atIndex);
  } else {
    return email;
  }
}

// Function to handle and send error messages
void sendError(BuildContext context, CommonFailure failure) {
  log.info("sendError -> Exception: ${failure.message}");

  late String title;
  late String subtitle;

  // Determine error message based on failure type
  if (failure.message.contains("network")) {
    title = "No Connection";
    subtitle = "We can't connect. Please check your internet connection.";
  } else if (failure.message.contains("Timeout")) {
    title = "Timeout Issues!";
    subtitle = "The service has taken too long to respond.";
  } else {
    title = "We Have Issues!";
    subtitle = "An unexpected error occurred. Please try again later.";
  }

  // Navigate to network failure page with error details
  Map<String, dynamic> params = {'title': title, 'subtitle': subtitle};
  return context.go(Routes.networkFailure, extra: params);
}

// Function to analyze error message and extract error code
int? analyzeMessage(String message) {
  List<Map<String, dynamic>> errorMessages = [
    {'keyword': 'credential is incorrect', 'errorCode': 1},
    {'keyword': 'email address is already', 'errorCode': 2}
  ];

  for (Map<String, dynamic> errorMessage in errorMessages) {
    if (message.contains(errorMessage['keyword'])) {
      return errorMessage['errorCode'];
    }
  }

  return null;
}

// Function to show toast message based on error code
void showToastForErrorCode(BuildContext context, int? errorCode) {
  String errorMessage;
  String error;

  // Determine error message based on error code
  switch (errorCode) {
    case 1:
      error = 'Error! Credential is incorrect';
      errorMessage = 'Please check your credentials and try again.';
      break;
    case 2:
      error = 'Error! These data are already registered';
      errorMessage = 'Please check your credentials and try again.';
      break;
    default:
      error = "Error";
      errorMessage = 'An unknown error occurred.';
  }

  // Show toast message with error details
  context.showToastMessage(
    error: true,
    title: error,
    subtitle: errorMessage,
  );
}

// Function to capture issue ID from URL
String captureIssueId(String url) {
  RegExp regExp = RegExp(r'issue\/\d+-\d+\/');
  Match? match = regExp.firstMatch(url);
  return match?.group(0) ?? '';
}
