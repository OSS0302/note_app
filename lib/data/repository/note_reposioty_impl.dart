import 'package:note_app/data/data_source/note_db_helper.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDbHelper db;

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
  // 테스트5
  @override
  Future<void> updateNote(Note note) async {
    await db.updateNote(note);
  }
}
