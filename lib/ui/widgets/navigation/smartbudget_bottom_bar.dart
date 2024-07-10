import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smartbudget/core/services/screen/screen_service.dart';

import '../../../core/router/routes.dart';

class SmartbudgetBottomBar extends StatelessWidget {
  const SmartbudgetBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenService(
        mobileWidget: Container(
          // decoration: BoxDecoration(
          //   border: Border(
          //     top: BorderSide(
          //       color: Colors.black,
          //       width: 1
          //     )
          //   )
          // ),
          child: BottomAppBar(
            color: Theme.of(context).colorScheme.background,
            elevation: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: const Icon(
                      Icons.home,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      context.goNamed(Routes.dashboard);
                    }
                ),
                IconButton(
                    icon: const Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      context.goNamed(Routes.account);
                    },
                )
              ],
            ),
          ),
        ),
        webWidget: BottomAppBar(
          color: Theme.of(context).colorScheme.primary,
          height: 50,
          elevation: 0,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '© 2024 SmartBudget',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary
                    ),
                  )
                ],
              ),
              // const Positioned(
              //     left: 0,
              //     child:
              // )
            ],
          ),
        )
    ) as Widget;
  }
}
