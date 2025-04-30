import 'package:flutter/material.dart';

import 'saved_address_item.dart';

class HandleLoadingAddressState extends StatelessWidget {
  const HandleLoadingAddressState({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: SavedAddressItem(addressEntity: null, index: index),
            ),
      ),
    );
  }
}
