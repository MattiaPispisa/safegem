part of 'emergency_composer_bloc.dart';

sealed class EmergencyComposerState extends Equatable {
  const EmergencyComposerState();
  
  @override
  List<Object> get props => [];
}

final class EmergencyComposerInitial extends EmergencyComposerState {}
