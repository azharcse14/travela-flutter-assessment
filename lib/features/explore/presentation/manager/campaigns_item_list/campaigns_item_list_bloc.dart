import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:travela_assignment/core/network/failure.dart';
import 'package:travela_assignment/features/explore/domain/entities/campaign_item_list_entity.dart';
import 'package:travela_assignment/features/explore/domain/use_cases/campaigns_item_list_usecase.dart';

part 'campaigns_item_list_event.dart';

part 'campaigns_item_list_state.dart';

class CampaignsItemListBloc
    extends Bloc<CampaignsItemListEvent, CampaignsItemListState> {
  final CampaignsItemListUseCase useCase;

  CampaignItemListEntity? campaignsItemListEntity;
  List<CampaignItemListDataEntity> _campaignsItemListData = [];

  List<CampaignItemListDataEntity> get getCampaignsItemListData =>
      _campaignsItemListData;
  int _page = 1;
  final int _perPage = 20;

  CampaignsItemListBloc({required this.useCase})
      : super(CampaignsItemListInitial()) {
    on<GetCampaignsItemList>((event, emit) async {
      _page = 1;
      _campaignsItemListData = [];
      emit(CampaignsItemListLoading());
      Either<Failure, CampaignItemListEntity> result = await useCase(
        campaignId: event.campaignId,
        page: _page,
        perPage: _perPage,
      );
      _page++;
      result.fold(
          (l) => emit(
                CampaignsItemListError(
                  errorCode: l.code,
                  errorStatus: l.status,
                  errorMessage: l.message,
                ),
              ), (r) {
        campaignsItemListEntity = r;
        _campaignsItemListData.addAll(r.data);

        emit(CampaignsItemListSuccess(campaignsItemListEntity: r));
      });
    });

    on<LoadMoreCampaignsItemList>((event, emit) async {
      if (_page == 1 ||
          _page <= /*campaignsItemListEntity!.pagination.total*/100 ~/ _perPage) {
        emit(MoreCampaignsItemListLoading());
        Either<Failure, CampaignItemListEntity> result = await useCase(
          campaignId: event.campaignId,
          page: _page,
          perPage: _perPage,
        );
        _page++;

        result.fold(
            (l) => emit(
                  CampaignsItemListError(
                    errorCode: l.code,
                    errorStatus: l.status,
                    errorMessage: l.message,
                  ),
                ), (r) {
          campaignsItemListEntity = r;
          _campaignsItemListData.addAll(r.data);
          emit(CampaignsItemListSuccess(campaignsItemListEntity: r));
        });
      }
    });
  }
}
