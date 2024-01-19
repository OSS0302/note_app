import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

class GetNote {
  final NoteRepository repository;

  const GetNote({
    required this.repository,
  });

  Future<Note?>  call(int id) async {
    return  await repository.getNoteId(id);
  }
}