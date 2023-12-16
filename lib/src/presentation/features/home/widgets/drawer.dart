import 'package:motodomi_app/lib.dart';

class HomeDrawer extends GetView<HomeCtrl> {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Scaffold.of(context).closeDrawer();
                    },
                    icon: Icon(
                      FontAwesomeIcons.barsStaggered,
                      size: 30,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Motodomi",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const CircleAvatar(),
                ],
              ),
            ),
            ...controller.options
                .map((e) => ListTile(
                      leading: Icon(e.icon),
                      title: Text(
                        e.title,
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: Colors.black,
                                ),
                      ),
                      onTap: () => e.onTap?.call(context),
                    ))
                .toList(),
            const Spacer(),
            ListTile(
              leading: const Icon(FontAwesomeIcons.circleArrowRight),
              title: Text(
                'Cerrar sesión',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.black,
                    ),
              ),
              onTap: () {
                controller.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
