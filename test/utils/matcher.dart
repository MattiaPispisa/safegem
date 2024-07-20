import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

/// Match objects like Some<Left<[Matcher],dynamic>
class _IsSomeLeft extends Matcher {
  const _IsSomeLeft(this._matcher);

  final Matcher _matcher;

  @override
  bool matches(Object? item, Map<dynamic, dynamic> matchState) {
    if (item is! Some) {
      return false;
    }

    return item.fold(
      () => false,
      (some) {
        if (some is! Either) {
          return false;
        }

        return some.fold(
          (left) => _matcher.matches(left, matchState),
          (_) => false,
        );
      },
    );
  }

  @override
  Description describe(Description description) => description
      .add('Some<Left<${_matcher.describe(StringDescription())},dynamic>>');
}

/// Match objects like Some<Right<dynamic,[Matcher]>
class _IsSomeRight extends Matcher {
  _IsSomeRight(this._matcher);

  final Matcher _matcher;

  @override
  bool matches(Object? item, Map<dynamic, dynamic> matchState) {
    if (item is! Some) {
      return false;
    }

    return item.fold(
      () => false,
      (some) {
        if (some is! Either) {
          return false;
        }

        return some.fold(
          (_) => false,
          (right) => _matcher.matches(right, matchState),
        );
      },
    );
  }

  @override
  Description describe(Description description) => description
      .add('Some<Right<dynamic, ${_matcher.describe(StringDescription())}>>');
}

/// Match objects like Some<Left<[Matcher],dynamic>
Matcher isSomeFailure(Object? valueOrMatcher) =>
    _IsSomeLeft(wrapMatcher(valueOrMatcher));

/// Match objects like Some<Right<dynamic,[Matcher]>
Matcher isSomeRight(Object? valueOrMatcher) =>
    _IsSomeRight(wrapMatcher(valueOrMatcher));
