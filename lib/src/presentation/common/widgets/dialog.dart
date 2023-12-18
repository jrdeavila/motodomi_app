import 'package:motodomi_app/lib.dart';

enum AppDialogType { info, success, error, warning }

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.title,
    required this.description,
    required this.type,
    this.actions = const [],
  });

  final String title;
  final String description;
  final AppDialogType type;
  final List<Widget> actions;

  IconData get _buildIcon => {
        AppDialogType.info: FontAwesomeIcons.info,
        AppDialogType.success: FontAwesomeIcons.checkDouble,
        AppDialogType.warning: FontAwesomeIcons.triangleExclamation,
        AppDialogType.error: FontAwesomeIcons.slash,
      }[type]!;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: 250,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                    left: 10.0,
                    right: 10.0,
                    bottom: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                        textAlign: TextAlign.justify,
                      ),
                      const Spacer(),
                      Row(
                        children: actions
                            .map((e) {
                              final index = actions.indexOf(e);
                              if (index < actions.length - 1) {
                                return [
                                  Expanded(
                                    child: e,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                ];
                              }
                              return [
                                Expanded(
                                  child: e,
                                )
                              ];
                            })
                            .expand((element) => element)
                            .toList(),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const FractionalOffset(0.5, -0.4),
                child: CircleAvatar(
                  radius: 50,
                  child: Icon(
                    _buildIcon,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
