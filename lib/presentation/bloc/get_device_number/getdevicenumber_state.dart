part of 'getdevicenumber_cubit.dart';

abstract class GetDeviceNumberState extends Equatable {
  const GetDeviceNumberState();
}

class GetDeviceNumberInitial extends GetDeviceNumberState {
  @override
  List<Object> get props => [];
}

class GetDeviceNumbersLoading extends GetDeviceNumberState {
  @override
  List<Object> get props => [];
}

class GetDeviceNumberLoaded extends GetDeviceNumberState {
  final List<ContactEntity> contact;

  GetDeviceNumberLoaded({this.contact});

  @override
  List<Object> get props => [];
}

class GetDeviceNumberFailure extends GetDeviceNumberState {
  @override
  List<Object> get props => [];
}
