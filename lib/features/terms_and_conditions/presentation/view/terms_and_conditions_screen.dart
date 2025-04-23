import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/l10n/locale_keys.g.dart';
import '../../domain/entity/term_section.dart';
import '../../utils/load_terms.dart';
import 'widgets/handle_terms_empty_state.dart';
import 'widgets/handle_terms_loading_state.dart';
import 'widgets/terms_and_conditions_body.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  List<TermSection> _terms = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTerms();
  }

  /// Loads the terms and conditions data from a JSON file and updates the state.
  ///
  /// This method retrieves the JSON data from the assets using the path defined in
  /// [Constants.termsAndConditionsJsonFilePath], decodes it, and validates its structure.
  /// If the data is valid (i.e., contains the 'terms_and_conditions' key), it parses the data
  /// into a list of [TermSection] objects and updates the [_terms] list. The [_isLoading] state
  /// is set to `false` once the operation is complete, whether successful or not.
  ///
  /// If the JSON data is invalid or an error occurs during loading or parsing, the method
  /// sets [_isLoading] to `false` and leaves [_terms] unchanged (empty).
  ///
  /// Throws:
  ///   - [Exception] if an error occurs while loading the JSON file or parsing the data.
  ///
  /// Returns:
  ///   - [Future<void>] that completes when the loading and parsing operation is finished.
  Future<void> _loadTerms() async {
    try {
      // Load the JSON file from the assets
      final String response = await rootBundle.loadString(
        Constants.termsAndConditionsJsonFilePath,
      );
      // Decode the JSON data
      final data = json.decode(response);

      // Check if the data contains the expected structure
      bool isValid = LoadTerms.checkIfData(data);
      if (!isValid) {
        setState(() {
          _isLoading = false;
        });
        return;
      }
      // Parse the data into a list of TermSection objects
      _terms = LoadTerms.parseData(data);

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
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
          _isLoading
              ? const HandleTermsLoadingState()
              : _terms.isEmpty
              ? HandleTermsEmptyState(
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                  });
                  _loadTerms();
                },
              )
              : TermsAndConditionsBody(isLoading: _isLoading, terms: _terms),
    );
  }
}
