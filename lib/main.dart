import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'app.dart';

Future<void> main()  {
   WidgetsFlutterBinding.ensureInitialized();
    MobileAds.instance.initialize();

  runApp(MyApp());
}
