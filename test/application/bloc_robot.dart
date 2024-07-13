// ignore_for_file: lines_longer_than_80_chars
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mocktail/mocktail.dart';

class _MockStorage extends Mock implements Storage {}

late Storage _hydratedStorage;

/// init [HydratedBloc] with a mocked [Storage]
void initHydratedStorage() {
  _hydratedStorage = _MockStorage();
  when(
    () => _hydratedStorage.write(any(), any<dynamic>()),
  ).thenAnswer((_) async {});
  HydratedBloc.storage = _hydratedStorage;
}

/// a robot to make bloc test readable like natural language
///
/// extends [BlocRobot] implementing a [BlocStateRobotMatcher]
///
/// Example:
/// ```
/// class InfinityRobot extends BlocRobot<InfinityListState<int>> {
///  const InfinityRobot(this.bloc);
///
///  @override
///  InfinityRobotMatchers get state {
///    return InfinityRobotMatchers();
///  }
///
///  void moreData() {
///    bloc.add(const InfinityListDataFetched());
///  }
///}
///
///
/// class InfinityRobotMatchers extends BlocStateRobotMatcher<InfinityListState<int>> {
///  InfinityRobotMatchers get havingSuccess {
///    add((state) => state.having(
///          (state) => state.status,
///          'status',
///          const Status.success(),
///        ));
///    return this;
///  }
/// }
/// ```
///
/// Example of usage:
/// ```
/// blocTest(
///   'data fetch correctly',
///   setUp: () {
///     // robot setup
///     robot = InfinityRobot(CRightInfinityListBloc.filled(20));
///   },
///   build: () => robot.bloc,
///   act: (bloc) => bloc.adds([const InfinityListDataFetched()]),
///   expect: () => [
///     // robot test usage
///     robot.state.havingSuccess.typeMatcher,
///   ],
/// );
/// ```
abstract class BlocRobot<State> {
  /// bloc
  BlocBase<State> get bloc;

  /// matcher creator
  BlocStateRobotMatcher<State> get state;

  /// dispose
  void dispose();
}

typedef BlocStateMatcherFunctions<T> = TypeMatcher<T> Function(
  TypeMatcher<T> state,
);

/// collect a list of [BlocStateMatcherFunctions] comparable calling [BlocStateRobotMatcher.typeMatcher]
///
/// more info on [BlocRobot]
class BlocStateRobotMatcher<T> {
  final List<BlocStateMatcherFunctions<T>> _matcherFunctions = [];

  void add(BlocStateMatcherFunctions<T> matcherFunction) {
    _matcherFunctions.add(matcherFunction);
  }

  void addAll(List<BlocStateMatcherFunctions<T>> matcherFunctions) {
    _matcherFunctions.addAll(matcherFunctions);
  }

  /// call after adding every [BlocStateMatcherFunctions] to compare bloc state in `blocTest.expect`
  TypeMatcher<T> get typeMatcher {
    var isState = isA<T>();

    for (final f in _matcherFunctions) {
      isState = f(isState);
    }

    return isState;
  }
}

@isTest
void robotBlocTest<Robot extends BlocRobot<State>, State>(
  String description, {
  required Robot Function() setUp,
  List<BlocStateRobotMatcher<State>> Function(Robot robot)? expect,
  void Function(Robot robot)? act,
  int skip = 0,
  Duration wait = const Duration(seconds: 2),
}) {
  late Robot blocRobot;

  return blocTest<BlocBase<State>, State>(
    description,
    setUp: () => blocRobot = setUp(),
    build: () => blocRobot.bloc,
    skip: skip,
    act: (_) => act?.call(blocRobot),
    tearDown: () => blocRobot.dispose(),
    wait: wait,
    expect: () =>
        expect?.call(blocRobot).map((matcher) => matcher.typeMatcher) ?? [],
  );
}
