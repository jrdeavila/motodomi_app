import 'package:motodomi_app/lib.dart';

class SearcheableDropDownItem<T> {
  final T value;
  final String key;
  final Widget label;

  SearcheableDropDownItem({
    required this.key,
    required this.label,
    required this.value,
  });
}

class SearcheableDropDownNotification extends Notification {
  final SearcheableDropDownItem item;

  SearcheableDropDownNotification(this.item);
}

class SearcheableDropdown<T> extends StatelessWidget {
  final String label;
  final T value;
  final Iterable<SearcheableDropDownItem<T>> items;
  final ValueChanged<T> onChanged;
  final String? error;

  const SearcheableDropdown({
    super.key,
    required this.value,
    required this.label,
    required this.items,
    required this.onChanged,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          key: key,
          onTap: _showMenu,
          child: Container(
            height: 60,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5),
                      ),
                ),
                Text(
                  value.toString(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ],
            ),
          ),
        ),
        if (error != null) ...[
          const SizedBox(
            height: 10.0,
          ),
          Text(
            error!,
            style: Theme.of(context).inputDecorationTheme.errorStyle,
          )
        ],
      ],
    );
  }

  void _showMenu() {
    showModalBottomSheet(
        context: Get.context!,
        builder: (_) {
          return NotificationListener<SearcheableDropDownNotification>(
            onNotification: (notification) {
              onChanged(notification.item.value);
              return true;
            },
            child: _SearcheableDropdownModal(
              items: items,
              searchLabel: label,
            ),
          );
        });
  }
}

class _SearcheableDropdownModal extends StatefulWidget {
  const _SearcheableDropdownModal({
    required this.items,
    required this.searchLabel,
  });

  final Iterable<SearcheableDropDownItem> items;
  final String searchLabel;

  @override
  State<_SearcheableDropdownModal> createState() =>
      _SearcheableDropdownModalState();
}

class _SearcheableDropdownModalState extends State<_SearcheableDropdownModal> {
  late Iterable<SearcheableDropDownItem> _items = widget.items;

  bool _compareElements(SearcheableDropDownItem element, String value) {
    return element.key.toLowerCase().contains(value.toLowerCase());
  }

  void _onSearch(String value) {
    if (value.isEmpty) {
      _items = widget.items;
    } else {
      _items =
          widget.items.where((element) => _compareElements(element, value));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          TextFormField(
            onChanged: _onSearch,
            decoration: InputDecoration(
              hintText: widget.searchLabel,
              prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: _items
                  .map((e) => ListTile(
                        title: e.label,
                        onTap: () {
                          SearcheableDropDownNotification(e).dispatch(context);
                          Navigator.of(context).pop();
                        },
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
