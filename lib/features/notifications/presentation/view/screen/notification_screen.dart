import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/di/di.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/notification_cubit.dart';
import '../../view_model/notification_state.dart';
import '../widgets/notification_list.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationCubit viewModel = getIt<NotificationCubit>();

  @override
  void initState() {
    super.initState();
    viewModel.doIntent(GetNotificationsAction());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: Scaffold(
        appBar: AppBar(title: Text(LocaleKeys.Notification.tr())),
        body: const NotificationList(),
      ),
    );
  }
}
