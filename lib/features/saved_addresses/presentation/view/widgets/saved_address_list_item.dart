import 'package:flutter/material.dart';

import '../../../../../core/utils/shared_models/address_entity.dart';
import 'handle_empty_address_state.dart';
import 'saved_address_item.dart';

class SavedAddressListItem extends StatefulWidget {
  const SavedAddressListItem({super.key, required this.savedAdress});

  final List<AddressEntity> savedAdress;

  @override
  State<SavedAddressListItem> createState() => _SavedAddressListItemState();
}

class _SavedAddressListItemState extends State<SavedAddressListItem> {
  @override
  Widget build(BuildContext context) {
    return widget.savedAdress.isEmpty
        ? const HandleEmptyAddressState()
        : SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  final offsetAnimation = Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(parent: animation, curve: Curves.easeOut),
                  );

                  return SlideTransition(
                    position: offsetAnimation,
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
                child: SavedAddressItem(
                  key: ValueKey(widget.savedAdress[index].id),
                  addressEntity: widget.savedAdress[index],
                  index: index,
                ),
              ),
            );
          }, childCount: widget.savedAdress.length),
        );
  }
}
