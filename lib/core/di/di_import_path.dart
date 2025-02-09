import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:get_it/get_it.dart';
import 'package:travela_assignment/core/network/api_config.dart';
import 'package:travela_assignment/core/network/network_info.dart';
import 'package:travela_assignment/core/utility/constants/constants_manager.dart';
import 'package:travela_assignment/features/explore/data/api_service/explore_api_service.dart';
import 'package:travela_assignment/features/explore/data/data_sources/explore_data_source.dart';
import 'package:travela_assignment/features/explore/data/data_sources/i_explore_data_source.dart';
import 'package:travela_assignment/features/explore/data/repositories/explore_repository.dart';
import 'package:travela_assignment/features/explore/domain/repositories/i_explore_repository.dart';
import 'package:travela_assignment/features/explore/domain/use_cases/campaigns_item_list_usecase.dart';
import 'package:travela_assignment/features/explore/domain/use_cases/campaigns_usecase.dart';
import 'package:travela_assignment/features/explore/presentation/manager/campaigns/campaigns_bloc.dart';
import 'package:travela_assignment/features/explore/presentation/manager/campaigns_item_list/campaigns_item_list_bloc.dart';

part 'di.dart';
