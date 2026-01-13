// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../app/import.dart';

class CustomCheckbox extends StatelessWidget {
  bool value;
  final ValueChanged<bool?>? onChanged;

  CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (checked) {
        value = checked!;
        if (onChanged != null) {
          onChanged!(checked);
        }
      },
      activeColor: Theme.of(context).primaryColor,
      checkColor: value ? Theme.of(context).colorScheme.surface : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.radius * 0.5),
      ),
      side: BorderSide(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.primaryColor.withValues(alpha: 0.50)
            : AppColors.black.withValues(alpha: 0.40),
      ),
    );
  }
}
