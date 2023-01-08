import 'package:bric/components/bricit.dart';
import 'package:flutter/widgets.dart';

import '../widgets/inherited_bricit.dart';

extension BuildContextExtensions on BuildContext {
  TBricit of<TBricit extends Bricit<TValue>, TValue>() {
    return dependOnInheritedWidgetOfExactType<
            InheritedBricit<TBricit, TValue>>()!
        .notifier!;
  }
}
