import 'dart:math' as math;

/// string utils
extension StringHelper on String {
  /// create a random string of length [length]
  static String generateRandomString(int length) {
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final random = math.Random();

    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }
}
