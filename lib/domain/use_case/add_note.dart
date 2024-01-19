import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

class AddNote {
  final NoteRepository repository;

  const AddNote({
    required this.repository,
  });

  Future<void> call(Note note)  async {
    await repository.addNote(note);
  }
}