import 'package:intl/intl.dart';
import 'package:motodomi_app/lib.dart';

class DateTimePicker extends StatelessWidget {
  const DateTimePicker({
    super.key,
    required this.date,
    required this.firstDate,
    required this.lastDate,
    required this.label,
    required this.onChangeDate,
    this.error,
  });

  final String label;
  final DateTime? date;
  final DateTime firstDate;
  final DateTime lastDate;
  final void Function(DateTime) onChangeDate;
  final String? error;

  @override
  Widget build(BuildContext context) {
    late String completeDate;
    if (date == null) {
      completeDate = 'Seleccionar fecha';
    } else {
      final dateStr = DateFormat('yyyy-MM-dd').format(date!);
      final dayName = DateFormat('EEEE', 'es_CO').format(date!).capitalize!;
      completeDate = '$dayName, $dateStr';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: date,
              firstDate: firstDate,
              lastDate: lastDate,
            ).then((value) {
              if (value != null) {
                onChangeDate(value);
              }
            });
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(context).colorScheme.surface,
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .inputDecorationTheme
                            .hintStyle
                            ?.color,
                      ),
                ),
                Text(
                  completeDate.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
        if (error != null) ...[
          const SizedBox(height: 10),
          Text(
            error!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
        ]
      ],
    );
  }
}
