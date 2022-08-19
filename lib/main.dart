// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:chitchat/data/model/user_model.dart';
import 'package:chitchat/firebase_options.dart';
import 'package:chitchat/presentation/bloc/auth/auth_cubit.dart';
import 'package:chitchat/presentation/bloc/communication/communication_cubit.dart';
import 'package:chitchat/presentation/bloc/get_device_number/getdevicenumber_cubit.dart';
import 'package:chitchat/presentation/bloc/my_chat/mychat_cubit.dart';
import 'package:chitchat/presentation/bloc/phone_auth/phone_auth_cubit.dart';
import 'package:chitchat/presentation/bloc/user/user_cubit.dart';
import 'package:chitchat/presentation/screens/home_screen.dart';
import 'package:chitchat/presentation/screens/welcome_screen.dart';
import 'package:chitchat/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'ChitChat-Room', options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider(
          create: (_) => di.sl<PhoneAuthCubit>(),
        ),
        BlocProvider<UserCubit>(
            create: (_) => di.sl<UserCubit>()..getAllUsers()),
        BlocProvider<GetDeviceNumberCubit>(
          create: (_) => di.sl<GetDeviceNumberCubit>(),
        ),
        BlocProvider<CommunicationCubit>(
          create: (_) => di.sl<CommunicationCubit>(),
        ),
        BlocProvider<MychatCubit>(
          create: (_) => di.sl<MychatCubit>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ChitChat Room",
        theme: ThemeData(
          primaryColor: PrimaryColor,
        ),
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Aunthenticated) {
                  return BlocBuilder<UserCubit, UserState>(
                    builder: (context, userState) {
                      if (userState is UserLoaded) {
                        final currentUserInfo = userState.users.firstWhere(
                            (user) => user.uid == authState.uid,
                            orElse: () => UserModel());
                        return HomeScreen(
                          userInfo: currentUserInfo,
                        );
                      }
                      return Container();
                    },
                  );
                }
                if (authState is UnAunthenticated) {
                  return WelcomeScreen();
                }
                return Container();
              },
            );
          }
        },
      ),
    );
  }
}
