import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:travela_assignment/core/network/failure.dart';
import 'package:travela_assignment/features/explore/domain/entities/campaigns_entity.dart';
import 'package:travela_assignment/features/explore/domain/use_cases/campaigns_usecase.dart';

part 'campaigns_event.dart';
part 'campaigns_state.dart';

class CampaignsBloc extends Bloc<CampaignsEvent, CampaignsState> {
  final CampaignsUseCase useCase;
  CampaignsBloc({required this.useCase}) : super(CampaignsInitial()) {
    on<GetCampaigns>((event, emit) async {
      emit(CampaignsLoading());
      Either<Failure, CampaignsEntity> result = await useCase();
      result.fold((l) => emit(CampaignsError(
        errorCode: l.code,
        errorStatus: l.status,
        errorMessage: l.message,
      ),), (r) {
        emit(CampaignsSuccess(campaignsEntity: r));
      });
    });
  }
}
