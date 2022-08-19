import 'package:chitchat/data/local_datasource/local_datasource.dart';
import 'package:chitchat/data/repositories/get_device_number_repository_impl.dart';
import 'package:chitchat/domain/usecase/add_to_my_chat_usecase.dart';
import 'package:chitchat/domain/usecase/create_one_to_one_chat_channel_usecase.dart';
import 'package:chitchat/domain/usecase/get_all_user_usecase.dart';
import 'package:chitchat/domain/usecase/get_create_current_user_usercase.dart';
import 'package:chitchat/domain/usecase/get_current_uid_usecase.dart';
import 'package:chitchat/domain/usecase/get_device_numbers_usecase.dart';
import 'package:chitchat/domain/usecase/get_my_chat_usecase.dart';
import 'package:chitchat/domain/usecase/get_one_to_one_single_user_chat_channel_usecae.dart';
import 'package:chitchat/domain/usecase/get_text_messages_usecase.dart';
import 'package:chitchat/domain/usecase/is_sign_in_usecase.dart';
import 'package:chitchat/domain/usecase/send_text_message_usecase.dart';
import 'package:chitchat/domain/usecase/sign_in_with_phone_number_usecase.dart';
import 'package:chitchat/domain/usecase/sign_out_usecase.dart';
import 'package:chitchat/domain/usecase/verify_phone_number_usecase.dart';
import 'package:chitchat/domain/repositories/firebase_repository.dart';
import 'package:chitchat/domain/repositories/get_device_number_repository.dart';
// ignore: duplicate_import
import 'package:chitchat/domain/usecase/is_sign_in_usecase.dart';
import 'package:chitchat/presentation/bloc/auth/auth_cubit.dart';
import 'package:chitchat/presentation/bloc/communication/communication_cubit.dart';
import 'package:chitchat/presentation/bloc/get_device_number/getdevicenumber_cubit.dart';
import 'package:chitchat/presentation/bloc/my_chat/mychat_cubit.dart';
import 'package:chitchat/presentation/bloc/phone_auth/phone_auth_cubit.dart';
import 'package:chitchat/presentation/bloc/user/user_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chitchat/data/datasources/firebase_remote_datasource.dart';
import 'package:chitchat/data/datasources/firebase_remote_datasource_impl.dart';
import 'package:chitchat/data/repositories/firebase_repository_impl.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
//FUTURES BLOC

  sl.registerFactory<AuthCubit>(() => AuthCubit(
        isSignInUseCase: sl.call(),
        signOutUseCase: sl.call(),
        getCurrentUidUseCase: sl.call(),
      ));
  sl.registerFactory<PhoneAuthCubit>(() => PhoneAuthCubit(
      signInWithPhoneNumberUseCase: sl.call(),
      getCreateCurrentUserUseCase: sl.call(),
      verifyPhoneNumberUseCase: sl.call()));

  sl.registerFactory<CommunicationCubit>(() => CommunicationCubit(
        addToMyChatUseCase: sl.call(),
        getOneToOneSingleUserChatChannelUseCase: sl.call(),
        getTextMessageUseCase: sl.call(),
        sendTextMessageUseCase: sl.call(),
      ));
  sl.registerFactory<MychatCubit>(
      () => MychatCubit(getMyChatUseCase: sl.call()));

  sl.registerFactory<GetDeviceNumberCubit>(
      () => GetDeviceNumberCubit(getDeviceNumberUseCase: sl.call()));

  sl.registerFactory<UserCubit>(() => UserCubit(
      createOneToOneChatChannelUseCase: sl.call(),
      getAllUserUseCase: sl.call()));

//USECASE

  sl.registerLazySingleton<GetCreateCurrentUserUseCase>(
      () => GetCreateCurrentUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUidUseCase>(
      () => GetCurrentUidUseCase(repository: sl.call()));
  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignInWithPhoneNumberUseCase>(
      () => SignInWithPhoneNumberUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton<VerifyPhoneNumberUseCase>(
      () => VerifyPhoneNumberUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetAllUserUseCase>(
      () => GetAllUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetMyChatUseCase>(
      () => GetMyChatUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetTextMessagesUseCase>(
      () => GetTextMessagesUseCase(repository: sl.call()));
  sl.registerLazySingleton<SendTextMessageUseCase>(
      () => SendTextMessageUseCase(repository: sl.call()));
  sl.registerLazySingleton<AddToMyChatUseCase>(
      () => AddToMyChatUseCase(repository: sl.call()));
  sl.registerLazySingleton<CreateOneToOneChatChannelUseCase>(
      () => CreateOneToOneChatChannelUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetOneToOneSingleUserChatChannelUseCase>(
      () => GetOneToOneSingleUserChatChannelUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetDeviceNumberUseCase>(
      () => GetDeviceNumberUseCase(deviceNumberRepository: sl.call()));
//REPOSITORY

  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));
  sl.registerLazySingleton<GetDeviceNumberRepository>(
      () => GetDeviceNumberRepositoryImpl(
            localDataSource: sl.call(),
          ));

//REMOTE DATA

  sl.registerLazySingleton<FirebaseRemoteDataSource>(
      () => FirebaseRemoteDataSourceImpl(
            auth: sl.call(),
            fireStore: sl.call(),
          ));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

//EXTERNAL

  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
}
