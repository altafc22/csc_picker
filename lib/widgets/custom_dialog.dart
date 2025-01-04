import 'package:flutter/material.dart';
import '../constants/constants.dart';

class CustomDialog extends StatelessWidget {
  final Widget? child;
  final Duration insetAnimationDuration;
  final Curve insetAnimationCurve;
  final ShapeBorder? shape;
  final BoxConstraints constraints;

  const CustomDialog({
    Key? key,
    this.child,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
    this.shape,
    this.constraints = const BoxConstraints(
        minWidth: 280.0, minHeight: 280.0, maxHeight: 400.0, maxWidth: 400.0),
  }) : super(key: key);

  Color _getColor(BuildContext context) {
    return Theme.of(context).dialogBackgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    final DialogThemeData dialogTheme = Theme.of(context).dialogTheme;
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          const EdgeInsets.symmetric(horizontal: 22.0, vertical: 24.0),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: ConstrainedBox(
            constraints: constraints,
            child: Material(
              elevation: 15.0,
              color: _getColor(context),
              type: MaterialType.card,
              child: child,
              shape: shape ??
                  dialogTheme.shape ??
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(CSCConstants.DEFAULT_DIALOG_RADIUS)),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
