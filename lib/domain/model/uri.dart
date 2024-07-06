extension UriHelper on Uri {
  static Uri sms({
    required String message,
    required String number,
  }) {
    return Uri(
      scheme: 'sms',
      path: number,
      queryParameters: {
        'body': message,
      },
    );
  }

  static Uri phone({
    required String number,
  }) {
    return Uri(
      scheme: 'tel',
      path: number,
    );
  }
}
