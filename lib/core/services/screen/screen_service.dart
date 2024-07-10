import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smartbudget/core/services/screen/web_screen_service.dart';

import 'mobile_screen_service.dart';

abstract class ScreenService {
  factory ScreenService({
    required Widget mobileWidget,
    required Widget webWidget,
  }) {
    if (kIsWeb) {
      return WebScreenService(webWidget: webWidget);
    }
    return MobileScreenService(mobileWidget: mobileWidget);
  }
}