import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartbudget/core/blocs/auth_bloc/auth_bloc.dart';
import 'package:smartbudget/core/router/routes.dart';
import 'package:smartbudget/core/services/screen/screen_service.dart';
import 'package:smartbudget/ui/themes/app-theme.dart';

class SmartbudgetAppBar extends StatefulWidget implements PreferredSizeWidget{

  final bool enableBack;

  const SmartbudgetAppBar({
    super.key,
    this.enableBack = false
  });

  @override
  State<SmartbudgetAppBar> createState() => _SmartbudgetAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SmartbudgetAppBarState extends State<SmartbudgetAppBar> {
  @override
  Widget build(BuildContext context) {
    return ScreenService(
        mobileWidget: _buildMobileAppbar(context),
        webWidget: _buildWebAppBar(context)
    ) as Widget;
  }

  Widget _buildMobileAppbar(BuildContext context) {
    return AppBar(
      // leadingWidth: MediaQuery.of(context).size.width * 0.3,
      // leading: (widget.enableBack)
      //   ? IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: (){
      //       Navigator.of(context).pop();
      //     },
      // ) : Padding(
      //     padding: EdgeInsets.only(
      //       left: AppTheme.padding,
      //       bottom: AppTheme.padding
      //     ),
      //   child:
      //   Image.asset(
      //     'asset',
      //     fit: BoxFit.contain,
      //   ),
      // ),
      // flexibleSpace: Container(
      //   decoration: const BoxDecoration(
      //     color: Colors.white
      //   ),
      //   child: SvgPicture.asset(
      //     'svg',
      //     fit: BoxFit.cover,
      //   ),
      // ),
      title: Text(
        "Smart Budget",
        style: TextStyle(
          color: Colors.white
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }

  Widget _buildWebAppBar(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            leadingWidth: MediaQuery.of(context).size.width * 0.3,
            leading: (widget.enableBack)
              ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
                : Padding(
                padding: EdgeInsets.only(
                  left: AppTheme.padding,
                  bottom: AppTheme.padding
                ),
              child: Image.asset(
                'asset',
                fit: BoxFit.contain,
              ),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: AppTheme.boxShadow
              ),
              child: SvgPicture.asset(
                'svg',
                fit:  BoxFit.cover,
              ),
            ),
            actions: [
              if (state is SignedInState) ... [
                SizedBox(width: AppTheme.spacing),
                _buildWebLinkButton(
                    context,
                    text: 'Gérer mes Budgets',
                    route: Routes.dashboard
                ),
                SizedBox(width: AppTheme.spacing),
                Padding(
                  padding: EdgeInsets.only(right: AppTheme.padding),
                  child: _buildWebLinkButton(
                      context, 
                      text: "Mon compte", 
                      route: Routes.account
                  ),
                )
              ]
            ],
          );
        }
    );
  }

  Widget _buildWebLinkButton(
      BuildContext context, {
        required String text,
        required String route,
      }) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary
        ),
      ),
    );
  }
}
