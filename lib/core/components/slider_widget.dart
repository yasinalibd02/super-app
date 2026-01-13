import '../../app/import.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double value = 50.0;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data: SliderThemeData(
          trackHeight: 12,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
          overlayShape: SliderComponentShape.noThumb,
        ),
        child: Slider(
          activeColor: AppColors.primaryColor,
          inactiveColor: AppColors.contentColorBlack.withValues(alpha: 0.5),
          value: value,
          min: 0,
          max: 100,
          label: value.round().toString(),
          onChanged: (value) => setState(() {
            this.value = value;
          }),
        ));
  }
}
