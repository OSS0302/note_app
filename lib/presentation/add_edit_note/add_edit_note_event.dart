import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_edit_note_event.freezed.dart';

@freezed
sealed class AddEditNoteEvent with _$AddEditNoteEvent {
  const factory AddEditNoteEvent.changeColor(int color) = ChageColor;
  const factory AddEditNoteEvent.saveNote(int? id, String title, String content) = SaveNote;
}