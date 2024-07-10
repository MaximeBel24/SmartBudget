import 'package:flutter/material.dart';
import 'package:smartbudget/core/services/screen/screen_service.dart';

class MobileScreenService extends StatelessWidget implements ScreenService{
  const MobileScreenService({
    super.key,
    required this.mobileWidget
  });

  final Widget mobileWidget;

  @override
  Widget build(BuildContext context) {
    return mobileWidget;
  }
}
