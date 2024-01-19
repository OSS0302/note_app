import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

class GetNotes {
  final NoteRepository repository;

  GetNotes({
    required this.repository,
    required this.notes,
  });
  // 모든 데이터 가져오는 기능
  Future<List<Note>> call() async {
    List<Note> notes = await repository.getNotes();
    return notes;
  }
}
