import 'package:flutter/material.dart';

class ScrollVisibilityController {
  final ValueNotifier<bool> isVisible = ValueNotifier(true);

  void listen(ScrollController controller) {
    double lastOffset = 0;

    controller.addListener(() {
      final offset = controller.offset;
      final direction = offset - lastOffset;

      if (direction > 5 && isVisible.value) {
        isVisible.value = false;
      } else if (direction < -5 && !isVisible.value) {
        isVisible.value = true;
      }

      lastOffset = offset;
    });
  }

  void dispose() {
    isVisible.dispose();
  }
}
