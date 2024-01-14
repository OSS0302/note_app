import 'package:note_app/domain/model/note.dart';

abstract interface class NoteRepository {
  Future<List<Note>> getNotes();

  // 노트 눌렀을때  id 로 상세화면
  Future<Note?> getNoteId(int id);

  // 노트 추가하기
  Future<void> addNote(Note note);

  // 노트 수정하기
  Future<void> updateNote(Note note);

  // 노트 삭제하기
  Future<void> deleteNote(Note note);
}