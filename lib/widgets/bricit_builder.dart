import 'package:bric/components/bricit.dart';
import 'package:flutter/widgets.dart';

import 'inherited_bricit.dart';

class BricitBuilder<TBricit extends Bricit<TValue>, TValue>
    extends StatefulWidget {
  final Widget Function(BuildContext context, TValue state) builder;

  const BricitBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  State<BricitBuilder> createState() => _BricitBuilderState<TBricit, TValue>();
}

class _BricitBuilderState<TBricit extends Bricit<TValue>, TValue>
    extends State<BricitBuilder<TBricit, TValue>> {
  @override
  Widget build(BuildContext context) {
    var bricitState = InheritedBricit.of<TBricit, TValue>(context);

    return ValueListenableBuilder<TValue>(
      valueListenable: bricitState,
      builder: (context, state, _) => widget.builder(context, state),
    );
  }
}
