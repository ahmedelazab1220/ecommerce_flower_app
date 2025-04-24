import 'package:flutter/material.dart';

import 'address_details_form.dart';
import 'location_map_view.dart';

class AddressDetailsBody extends StatelessWidget {
  const AddressDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            LocationMapView(),
            SizedBox(height: 16),
            AddressDetailsForm(),
          ],
        ),
      ),
    );
  }
}
