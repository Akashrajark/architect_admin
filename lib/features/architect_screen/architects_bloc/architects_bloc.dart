import 'package:bloc/bloc.dart';
import 'package:logger/web.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../values/strings.dart';

part 'architects_event.dart';
part 'architects_state.dart';

class ArchitectsBloc extends Bloc<ArchitectsEvent, ArchitectsState> {
  ArchitectsBloc() : super(ArchitectsInitialState()) {
    on<ArchitectsEvent>((event, emit) async {
      try {
        emit(ArchitectsLoadingState());
        SupabaseQueryBuilder table =
            Supabase.instance.client.from('architects');

        if (event is GetAllArchitectsEvent) {
          PostgrestFilterBuilder<List<Map<String, dynamic>>> query =
              table.select('*');
          if (event.params['status'] == 'Approved') {
            query = query.eq('status', event.params['status']);
          } else if (event.params['status'] == 'Pending') {
            query = query.eq('status', event.params['status']);
          }
          if (event.params['query'] != null) {
            query = query.ilike('name', '%${event.params['query']}%');
          }

          if (event.params['limit'] != null) {
            await query.limit(event.params['limit']);
          }

          List<Map<String, dynamic>> architects =
              await query.order('name', ascending: true);

          emit(ArchitectsGetSuccessState(architects: architects));
        } else if (event is AddArchitectsEvent) {
          await table.insert(event.architectDetails);

          emit(ArchitectsSuccessState());
        } else if (event is EditArchitectsEvent) {
          await table
              .update(event.architectDetails)
              .eq('id', event.architectId);

          emit(ArchitectsSuccessState());
        } else if (event is DeleteArchitectsEvent) {
          await table.delete().eq('id', event.architectId);
          emit(ArchitectsSuccessState());
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(ArchitectsFailureState());
      }
    });
  }
}
