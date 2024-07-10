import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smartbudget/core/services/screen/screen_service.dart';
import 'package:smartbudget/ui/widgets/navigation/smartbudget_app_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:smartbudget/core/blocs/auth_bloc/auth_bloc.dart';
import '../../../ui/themes/app-theme.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key,
    required this.title,
    required this.mainHint,
    this.footerHint,
    this.footerAction,
    this.footerRoute,
    required this.withFooter,
    required this.form
  });

  final String title;
  final String mainHint;
  final String? footerHint;
  final String? footerAction;
  final String? footerRoute;
  final bool withFooter;
  final Widget form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SmartbudgetAppBar(),
      body: Padding(
        padding: EdgeInsets.all(AppTheme.largePadding),
        child: Column(
          children: [
            Expanded(
                child: ScreenService(
                    mobileWidget: ListView(
                      children: [

                      ],
                    ),
                    webWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: AppTheme.largeSpacing,)
                      ],
                    )
                ) as Widget,
            ),
            if (withFooter) ...[
              // const Separator(),
            ]
          ],
        ),
      ),
    );
  }
}

class SignLayoutMain extends StatelessWidget {
  const SignLayoutMain({
    super.key,
    required this.hint,
    required this.title
  });

  final String hint;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 350),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: AppTheme.largeSpacing),
          Text(
            hint,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppTheme.largeSpacing),
          BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if ((state is SignedOutState ||
                    state is SignUpState ||
                    state is ChangeForgotPasswordEvent ||
                    state is VerifyOtpState) &&
                    state.exception != null
                ) {
                  return Container(

                  );
                } else if () {
                  return Container();
                } else {
                  return const SizedBox.shrink();
                }
              })
        ],
      ),
    );
  }
}

class SignLayoutForm extends StatelessWidget {

  final Widget form;

  const SignLayoutForm({
    super.key,
    required this.form
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 350),
      child: form,
    );
  }
}

class SignLayoutFooter extends StatelessWidget {

  final String hint;
  final String action;
  final String route;

  const SignLayoutFooter({
    super.key,
    required this.hint,
    required this.action,
    required this.route
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(hint),
        TextButton(
          onPressed: () {
            context.pushReplacementNamed(route);
          },
          child: Text(
            action,
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Theme.of(context).colorScheme.primary
            ),
          )
        )
      ],
    );
  }
}



