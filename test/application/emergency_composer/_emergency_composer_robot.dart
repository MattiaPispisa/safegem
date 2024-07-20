import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/domain/emergency_service.dart';
import 'package:safegem/domain/failure/failure.dart';
import 'package:safegem/domain/model/model.dart';

import '../../utils/matcher.dart';
import '../bloc_robot.dart';

class _MockEmergencyService extends Mock implements EmergencyService {}

class _MockGetEmergencyMessageDto extends Mock
    implements GetEmergencyMessageDto {}

class EmergencyComposerRobot extends BlocRobot<EmergencyComposerState> {
  EmergencyComposerRobot._(this.bloc);

  factory EmergencyComposerRobot.init() {
    final service = _MockEmergencyService();
    _fallbacks();
    _mocks(service);
    final bloc = EmergencyComposerBloc(service);
    return EmergencyComposerRobot._(bloc);
  }

  /// setUp all
  static void setUpAll() {}

  static void _fallbacks() {
    registerFallbackValue(_MockGetEmergencyMessageDto());
  }

  static void _mocks(_MockEmergencyService service) {
    when(() => service.getEmergencyMessage(any())).thenAnswer(
      (_) => Future.value(
        right(
          const EmergencyMessage(
            authorityName: 'A mock name',
            message: 'A mock message',
            authorityNumber: '123',
          ),
        ),
      ),
    );
  }

  @override
  EmergencyComposerBloc bloc;

  void addSentMessage() {
    bloc.add(
      const EmergencyMessageSent(
        location: Location(latitude: 1, longitude: 1),
        message: UserMessage(content: 'content'),
        senderContactInfo: null,
      ),
    );
  }

  @override
  EmergencyComposerMatcher get state => EmergencyComposerMatcher();
}

class EmergencyComposerMatcher
    extends BlocStateRobotMatcher<EmergencyComposerState> {
  void havingComposing(bool composing) {
    add(
      (state) => state.having(
        (state) => state.composingMessage,
        'composingMessage',
        composing,
      ),
    );
  }

  void havingMessage() {
    add(
      (state) => state.having(
        (state) => state.optionFailureOrMessageCreated,
        'optionFailureOrMessageCreated',
        isSomeRight(isA<EmergencyMessage>()),
      ),
    );
  }

  void notHavingMessage() {
    add(
      (state) => state.having(
        (state) => state.optionFailureOrMessageCreated,
        'optionFailureOrMessageCreated',
        none<Either<EmergencyMessageFailure, EmergencyMessage>>(),
      ),
    );
  }
}
