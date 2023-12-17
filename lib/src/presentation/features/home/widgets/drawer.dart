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
                    controller.userFirstName,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: controller.userAvatar != null
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CachedNetworkImage(
                                  imageUrl: controller.userAvatar!,
                                  placeholder: (context, url) => const Icon(
                                    FontAwesomeIcons.user,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const Icon(
                            FontAwesomeIcons.user,
                            color: Colors.white,
                            size: 20,
                          ),
                  ),
                ],
              ),
            ),
            ...controller.homeOptions
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
