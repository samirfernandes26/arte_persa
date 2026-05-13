part of '../alerts.dart';

Future<T?> showAlerta<T>(
  BuildContext context, {
  required AlertType tipo,
  String? title,
  required String content,
  List<Widget>? actions,
  Color? surfaceTintColor,
  Color? backgroundColor,
}) async {
  assert(_debugIsActive(context));
  assert(debugCheckHasMaterialLocalizations(context));

  final CapturedThemes themes = InheritedTheme.capture(
    from: context,
    to: Navigator.of(context, rootNavigator: true).context,
  );

  return Navigator.of(context, rootNavigator: true).push<T>(
    DialogRoute<T>(
      context: context,
      builder: (context) => AlertDialog(
        surfaceTintColor: surfaceTintColor,
        backgroundColor: backgroundColor,
        icon: Icon(tipo.icon, size: 56, color: tipo.color),
        title: Text(
          title ?? tipo.title,
          textAlign: TextAlign.center,
          style: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: tipo.color,
          ),
        ),
        content: Text(
          content,
          textAlign: TextAlign.center,
          style: context.theme.textTheme.titleMedium?.copyWith(),
        ),
        actions: actions,
      ),
      barrierColor: Colors.black54,
      barrierDismissible: true,
      barrierLabel: null,
      useSafeArea: true,
      settings: null,
      themes: themes,
      anchorPoint: null,
      traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
    ),
  );
}
