part of 'communication_cubit.dart';

abstract class CommunicationState extends Equatable {
  const CommunicationState();
}

class CommunicationInitial extends CommunicationState {
  @override
  List<Object> get props => [];
}

class CommunicationLoaded extends CommunicationState {
  List<TextMessageEntity> messages;

  CommunicationLoaded({this.messages});
  @override
  List<Object> get props => [];
}

class CommunicationFailure extends CommunicationState {
  @override
  List<Object> get props => [];
}

class CommunicationLoading extends CommunicationState {
  @override
  List<Object> get props => [];
}
