import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:travela_assignment/core/utility/constants/style_manager.dart';
import 'package:travela_assignment/core/utility/widgets/error/no_data_found.dart';

@RoutePage()
class HostScreen extends StatelessWidget {
  const HostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Host', style: getBoldStyle(),),),
      body: NoDataFound(),
    );
  }
}
