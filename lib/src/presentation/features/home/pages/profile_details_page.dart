import 'package:motodomi_app/lib.dart';

class ProfileDetailsPage extends GetView<HomeCtrl> {
  const ProfileDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      drawer: const HomeDrawer(),
      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
            color: Colors.white,
          )),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.2,
            child: WelcomeRoundedBall(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.2,
            child: _buildUserData(context),
          ),
          Positioned(
            top: kTextTabBarHeight,
            left: 16.0,
            child: FloatingActionButton(
              heroTag: 'back',
              onPressed: () {
                key.currentState?.openDrawer();
              },
              child: const Icon(FontAwesomeIcons.bars),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserData(BuildContext context) {
    return Obx(() {
      return Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: controller.userAvatar != null
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                              imageUrl: controller.userAvatar!,
                              placeholder: (context, url) => const Icon(
                                FontAwesomeIcons.user,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const Icon(
                        FontAwesomeIcons.user,
                        color: Colors.white,
                        size: 40,
                      ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  controller.userName,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                controller.userPhone,
              ),
              const SizedBox(
                height: 20,
              ),
              ...controller.profileOptions
                  .map((e) => [
                        ListTile(
                          leading: Icon(e.icon),
                          iconColor: Theme.of(context).colorScheme.secondary,
                          textColor: Colors.white,
                          tileColor: Theme.of(context).colorScheme.tertiary,
                          title: Text(
                            e.title,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          //
                          trailing: const Icon(
                            FontAwesomeIcons.chevronRight,
                          ),
                          onTap: () => e.onTap?.call(context),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ])
                  .expand((element) => element)
                  .toList(),
            ],
          ),
        ),
      );
    });
  }
}
