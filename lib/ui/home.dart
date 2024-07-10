import 'package:flutter/material.dart';
import 'package:smartbudget/ui/widgets/navigation/smartbudget_app_bar.dart';
import 'package:smartbudget/ui/widgets/navigation/smartbudget_bottom_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SmartbudgetAppBar(),
      body: Column(),
      bottomNavigationBar: SmartbudgetBottomBar(),
    );
  }
}
