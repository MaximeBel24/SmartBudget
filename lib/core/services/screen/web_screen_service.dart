import 'package:flutter/material.dart';
import 'package:smartbudget/core/services/screen/screen_service.dart';

class WebScreenService extends StatelessWidget implements ScreenService{

  final Widget webWidget;

  const WebScreenService({
    super.key,
    required this.webWidget
  });

  @override
  Widget build(BuildContext context) {
    return webWidget;
  }
}
