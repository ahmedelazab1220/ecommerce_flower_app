import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/assets/app_colors.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/dialogs/app_toast.dart';
import '../../../../core/utils/load_data_from_json_service/data_loader.dart';
import '../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../core/utils/load_data_from_json_service/handle_failure_data_loader_state.dart';
import '../../domain/entity/term_section.dart';
import 'widgets/terms_and_conditions_body.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  List<TermSection> _terms = [];

  @override
  void initState() {
    super.initState();
    _loadTerms();
  }

  Future<void> _loadTerms() async {
    try {
      // Load the JSON file from the assets
      final String response = await rootBundle.loadString(
        Constants.termsAndConditionsJsonFilePath,
      );
      // Decode the JSON data
      final data = json.decode(response);

      // Check if the data contains the expected structure
      bool isValid = DataLoader.checkTermsData(data);
      if (!isValid) {
        setState(() {});
        return;
      }
      // Parse the data into a list of TermSection objects
      _terms = DataLoader.parseTerms(data);

      setState(() {});
    } catch (e) {
      setState(() {});
      debugPrint('${LocaleKeys.ErrorLoadingData.tr()}: $e');
      showToast(title: LocaleKeys.ErrorLoadingData.tr(), color: AppColors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.TermsAndConditions.tr()),
        titleSpacing: 0.0,
      ),
      body:
          _terms.isEmpty
              ? HandleFailureDataLoaderState(
                onPressed: () {
                  setState(() {});
                  _loadTerms();
                },
                title: LocaleKeys.NoTermsAvailable.tr(),
                message: LocaleKeys.ErrorLoadingData.tr(),
              )
              : TermsAndConditionsBody(terms: _terms),
    );
  }
}
