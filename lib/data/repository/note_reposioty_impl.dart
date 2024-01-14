import 'package:note_app/data/data_source/note_db.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDB db;

  const NoteRepositoryImpl({
    required this.db,
  });

  @override
  Future<void> addNote(Note note) async {
    await db.addNote(note);
  }

  @override
  Future<void> deleteNote(Note note) async {
    await db.deleteNote(note);
  }

  @override
  Future<Note?> getNoteId(int id) async {
    return await db.getNoteById(id);
  }

  @override
  Future<List<Note>> getNotes() async {
    return await db.getNotes();
  }

  @override
  Future<void> updateNote(Note note) async {
    await db.updateNote(note);
  }
}
