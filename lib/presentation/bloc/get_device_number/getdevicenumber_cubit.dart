import 'package:bloc/bloc.dart';
import 'package:chitchat/domain/entities/contact_entity.dart';
import 'package:chitchat/domain/usecase/get_device_numbers_usecase.dart';
//import 'package:chitchat/domain/usecase/get_device_number_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'getdevicenumber_state.dart';

class GetDeviceNumberCubit extends Cubit<GetDeviceNumberState> {
  final GetDeviceNumberUseCase getDeviceNumberUseCase;
  GetDeviceNumberCubit({this.getDeviceNumberUseCase})
      : super(GetDeviceNumberInitial());

  Future<void> getDeviceNumbers() async {
    try {
      final contactsNumbers = await getDeviceNumberUseCase.call();
      emit(GetDeviceNumberLoaded(contact: contactsNumbers));
    } catch (_) {
      emit(GetDeviceNumberFailure());
    }
  }
}
