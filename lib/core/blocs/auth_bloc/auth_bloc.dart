import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../models/auth/user.dart';
import '../../providers/auth_provider.dart';
import '../../utils/helpers/logger_helper.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthProvider authProvider;

  AuthBloc({
    required this.authProvider
  }) : super(const InitState()) {

    //Evenement appelé au lancement de l'application
    //
    on<InitEvent>((event, emit) async{
      try {
        final User? user = await authProvider.init();
        if(user != null) {
          emit(SignedInState(
              user: user
          ));
        } else {
          emit(const SignedOutState());
        }
      } catch(e) {
        emit(const SignedOutState());
      }
    });

    on<UserSignedInEvent>((event, emit) {
      emit(SignedInState(
          user: event.user
      ));
    });

    on<SignedInEvent>((event, emit) async {
      emit(const LoadingState(text: 'Authentification ...'));

      final email = event.email.toLowerCase();
      final password = event.password;

      try {
        final User? user = await authProvider.signIn(
            email: email,
            password: password
        );

      } on Exception catch (e) {
        emit(SignedOutState(exception: e));
      }
    });

    on<SignUpEvent>((event, emit) async {
      emit(const LoadingState(text: 'Inscription en cours ...'));

      final email = event.email;
      final password = event.password;
      final firstname = event.firstname;
      final lastname = event.lastname;
      final phoneNumber = event.phoneNumber;

      try {
        final User? user = await authProvider.signUp(
            email: email,
            password: password,
            firstname: firstname,
            lastname: lastname,
            phoneNumber: phoneNumber
        );
      } on Exception catch (e) {
        logger.e('Signup error : ${e.toString()}');
        emit(SignUpState(
          exception: e,
        ));
      }
    });

  }
}
