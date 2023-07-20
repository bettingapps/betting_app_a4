part of 'matches_bloc.dart';

@freezed
class MatchesEvent with _$MatchesEvent {
  const factory MatchesEvent.fetch() = MatchesEventFetch;
}
