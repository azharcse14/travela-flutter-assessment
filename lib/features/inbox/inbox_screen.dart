import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travela_assignment/core/utility/constants/style_manager.dart';
import 'package:travela_assignment/core/utility/widgets/error/no_data_found.dart';

@RoutePage()
class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Inbox',
          style: getBoldStyle(),
        ),
      ),
      body: NoDataFound(),
    );
  }
}
