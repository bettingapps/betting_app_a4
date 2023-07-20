import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/repo.dart';
import '../models/boxing_mathes.dart';

part 'matches_state.dart';
part 'matches_event.dart';

part 'matches_bloc.freezed.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  final Repo repo;

  MatchesBloc({
    required this.repo,
  }) : super(const MatchesState.loading()) {
    on<MatchesEventFetch>((event, emit) async {
      emit(const MatchesState.loading());

      try {
        BoxingMatches matches = await repo.getMatches();

        if (matches.matches.length < 6) {
          emit(MatchesState.loaded(matches: dummyData));
        } else {
          emit(MatchesState.loaded(matches: matches));
        }
      } catch (e) {
        emit(MatchesState.loaded(matches: dummyData));
      }
    });
  }
}
