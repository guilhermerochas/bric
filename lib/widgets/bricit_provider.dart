import 'package:bric/components/bricit.dart';
import 'package:bric/widgets/inherited_bricit.dart';
import 'package:flutter/widgets.dart';

class BricitProvider<TBricit extends Bricit<TValue>, TValue>
    extends StatefulWidget {
  final TBricit Function(BuildContext context) create;
  final Widget child;

  const BricitProvider({
    Key? key,
    required this.create,
    required this.child,
  }) : super(key: key);

  @override
  State<BricitProvider> createState() =>
      _BricitProviderState<TBricit, TValue>();
}

class _BricitProviderState<TBricit extends Bricit<TValue>, TValue>
    extends State<BricitProvider<TBricit, TValue>> {
  @override
  Widget build(BuildContext context) {
    return InheritedBricit<TBricit, TValue>(
      bricitNotifier: widget.create(context),
      child: widget.child,
    );
  }
}
