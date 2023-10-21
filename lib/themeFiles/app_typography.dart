

import 'package:flutter/material.dart';
import '../main.dart';

//picking context from main.dart
var context = navigatorKey.currentContext;

class AppTextStyle{

    //Heading
    static TextStyle headlineSmall = Theme.of(context!).textTheme.headlineSmall!;
    static TextStyle headlineMedium = Theme.of(context!).textTheme.headlineMedium!;
    static TextStyle headlineLarge = Theme.of(context!).textTheme.headlineLarge!;


    //Title
    static TextStyle titleSmall = Theme.of(context!).textTheme.titleSmall!;
    static TextStyle titleMedium = Theme.of(context!).textTheme.titleMedium!;
    static TextStyle titleLarge = Theme.of(context!).textTheme.titleLarge!;

    //Body
    static TextStyle bodySmall = Theme.of(context!).textTheme.bodySmall!;
    static TextStyle bodyMedium = Theme.of(context!).textTheme.bodyMedium!;
    static TextStyle bodyLarge = Theme.of(context!).textTheme.bodyLarge!;

    //Caption
    static TextStyle labelSmall = Theme.of(context!).textTheme.labelSmall!;
    static TextStyle labelMedium = Theme.of(context!).textTheme.labelMedium!;
    static TextStyle labelLarge = Theme.of(context!).textTheme.labelLarge!;
}

