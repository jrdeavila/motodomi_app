import 'package:intl/intl.dart';
import 'package:motodomi_app/lib.dart';

class DatePickerField extends StatelessWidget {
  const DatePickerField({
    super.key,
    required this.date,
    required this.label,
    required this.onChangeDate,
    this.errorText,
  });

  final String label;
  final DateTime date;
  final String? errorText;
  final void Function(DateTime) onChangeDate;

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('yyyy-MM-dd').format(date);
    final dayName = DateFormat('EEEE', 'es_CO').format(date).capitalize!;
    final completeDate = '$dateStr - $dayName';
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildField(context, completeDate),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              errorText!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          ),
      ],
    );
  }

  Widget _buildField(BuildContext context, String completeDate) {
    return GestureDetector(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime(
            DateTime.now().year - 80,
            DateTime.now().month,
            DateTime.now().day,
          ),
          lastDate: DateTime.now(),
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
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(completeDate.toUpperCase(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
          ],
        ),
      ),
    );
  }
}
