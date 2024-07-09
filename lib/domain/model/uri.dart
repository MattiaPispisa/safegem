/// Uri extension to create default uri schema
/// useful for this app
extension UriHelper on Uri {
  /// sms schema
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

  /// phone schema
  static Uri phone({
    required String number,
  }) {
    return Uri(
      scheme: 'tel',
      path: number,
    );
  }
}
