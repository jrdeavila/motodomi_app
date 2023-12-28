import 'package:motodomi_app/lib.dart';

class BackSideIdentification extends StatelessWidget {
  const BackSideIdentification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const backgroundCard = Color.fromRGBO(51, 147, 226, 1);
    const backgroundAvatar = Color.fromRGBO(80, 176, 255, 1);
    const foregroundColor = Color.fromARGB(255, 228, 240, 255);
    return Container(
      width: 350,
      height: 200,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: backgroundCard,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 120,
                      decoration: BoxDecoration(
                        color: backgroundAvatar,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Icon(
                        FontAwesomeIcons.fingerprint,
                        color: foregroundColor,
                        size: 70.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "DORSO",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        children: [
                          ...List.generate(
                              3,
                              (index) => [
                                    Expanded(
                                      child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          color: foregroundColor,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5.0),
                                  ]).expand((element) => element),
                        ],
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 6.0),
                        height: 15,
                        decoration: BoxDecoration(
                          color: foregroundColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              15,
              (index) => const Icon(
                FontAwesomeIcons.barcode,
                color: foregroundColor,
                size: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FrontalSideIdentification extends StatelessWidget {
  const FrontalSideIdentification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const backgroundCard = Color.fromRGBO(51, 147, 226, 1);
    const backgroundAvatar = Color.fromRGBO(80, 176, 255, 1);
    const foregroundColor = Color.fromARGB(255, 228, 240, 255);
    return Container(
      width: 350,
      height: 200,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: backgroundCard,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "FRENTE",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 100,
                        height: 15,
                        decoration: BoxDecoration(
                          color: foregroundColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Container(
                      width: 50,
                      height: 15,
                      decoration: BoxDecoration(
                        color: foregroundColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                ...List.generate(
                  2,
                  (index) => Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    height: 15,
                    decoration: BoxDecoration(
                      color: foregroundColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 15.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 120,
                decoration: BoxDecoration(
                  color: backgroundAvatar,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Icon(
                  FontAwesomeIcons.solidUser,
                  color: foregroundColor,
                  size: 70.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
