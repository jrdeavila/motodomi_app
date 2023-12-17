import 'package:motodomi_app/lib.dart';

enum PickerSelection { camera, gallery, remove }

class PickerSelectionModal extends StatelessWidget {
  const PickerSelectionModal({
    super.key,
    this.canRemove = false,
    this.onSelect,
  });

  final ValueChanged<PickerSelection>? onSelect;

  final bool canRemove;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Selecciona una opción',
              style: Get.textTheme.headlineMedium?.copyWith(
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(FontAwesomeIcons.camera),
              title: Text('Tomar foto',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                  )),
              onTap: () {
                Get.back();
                onSelect?.call(PickerSelection.camera);
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.images),
              title: Text(
                'Seleccionar de la galería',
                style: Get.textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Get.back();
                onSelect?.call(PickerSelection.gallery);
              },
            ),
            if (canRemove)
              ListTile(
                leading: const Icon(FontAwesomeIcons.trash),
                title: Text(
                  'Eliminar foto',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Get.back();
                  onSelect?.call(PickerSelection.remove);
                },
              ),
          ],
        ),
      ),
    );
  }
}
