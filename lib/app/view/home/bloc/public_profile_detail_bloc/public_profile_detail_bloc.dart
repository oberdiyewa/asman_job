import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'public_profile_detail_event.dart';
part 'public_profile_detail_state.dart';

class PublicProfileDetailBloc
    extends Bloc<PublicProfileDetailEvent, PublicProfileDetailState> {
  PublicProfileDetailBloc(this.repository)
      : super(PublicProfileDetailInitial()) {
    on<PublicProfileDetailFetchEvent>(_onEntityDetailFetch);
  }

  final PublicProfileRepository repository;

  PublicProfileDetail? _detail;

  Future<void> _onEntityDetailFetch(
    PublicProfileDetailFetchEvent event,
    Emitter<PublicProfileDetailState> emit,
  ) async {
    emit(PublicProfileDetailLoading());
    if (_detail != null && _detail!.id == event.id) {
      emit(
        PublicProfileDetailLoaded(_detail!),
      );
    } else {
      try {
        final vDetail = await repository.profileDetail(event.id);
        _detail = vDetail;
        emit(PublicProfileDetailLoaded(_detail!));
      } catch (e) {
        emit(
          PublicProfileDetailFailure(e.toString()),
        );
      }
    }
  }
}
