import 'dart:io';

import '../base/app_core.dart';
import 'icon.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  const BackButtonWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (onTap != null) {
          onTap!();
        }
        Navigator.pop(context);
      },
      icon: CustomIcon(
        Platform.isIOS ? Icons.arrow_back_ios_new_outlined : Icons.arrow_back,
      ),
    );
  }
}
