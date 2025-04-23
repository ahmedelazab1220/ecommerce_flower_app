import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/load_data_from_json_service/data_loader.dart';
import '../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../core/utils/load_data_from_json_service/handle_failure_data_loader_state.dart';
import '../../domain/entity/about_section.dart';
import 'widgets/about_us_body.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  List<AboutSection> _terms = [];

  @override
  void initState() {
    super.initState();
    _loadAbout();
  }

  Future<void> _loadAbout() async {
    try {
      // Load the JSON file from the assets
      final String response = await rootBundle.loadString(
        Constants.aboutUsJsonFilePath,
      );
      // Decode the JSON data
      final data = json.decode(response);

      // Check if the data contains the expected structure
      bool isValid = DataLoader.checkAboutData(data);
      if (!isValid) {
        setState(() {});
        return;
      }
      // Parse the data into a list of AboutSection objects
      _terms = DataLoader.parseAbout(data);

      setState(() {});
    } catch (e) {
      setState(() {});
      throw Exception('${LocaleKeys.ErrorLoadingData.tr()}: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.AboutUs.tr()), titleSpacing: 0.0),
      body:
          _terms.isEmpty
              ? HandleFailureDataLoaderState(
                onPressed: () {
                  setState(() {});
                  _loadAbout();
                },
                title: LocaleKeys.NoAboutUsAvailable.tr(),
                message: LocaleKeys.ErrorLoadingData.tr(),
              )
              : AboutUsBody(terms: _terms),
    );
  }
}
