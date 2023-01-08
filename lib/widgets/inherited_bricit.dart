import 'package:bric/components/bricit.dart';
import 'package:flutter/widgets.dart';

class InheritedBricit<TBricit extends Bricit<TValue>, TValue>
    extends InheritedNotifier<TBricit> {
  const InheritedBricit({
    required Widget child,
    required TBricit bricitNotifier,
    Key? key,
  }) : super(key: key, child: child, notifier: bricitNotifier);

  static TBricit of<TBricit extends Bricit<TValue>, TValue>(
      BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedBricit<TBricit, TValue>>()!
        .notifier!;
  }
}
