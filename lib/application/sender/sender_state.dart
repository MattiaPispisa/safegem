part of 'sender_bloc.dart';

sealed class SenderState extends Equatable {
  const SenderState();
  
  @override
  List<Object> get props => [];
}

final class SenderInitial extends SenderState {}
