import 'package:block_pattern_flutter_app/apisHandling/api_services.dart';
import 'package:block_pattern_flutter_app/apisHandling/model.dart';
import 'package:flutter/cupertino.dart';

class NotesProvider with ChangeNotifier {
  bool isLoading = true;
  List<Note> notes = [];

  NotesProvider() {
    fetchNotes();
  }

  List<Note> getFilteredNotes(String searchQuery) {
    return notes
        .where((element) =>
            element.title!.toLowerCase().contains(searchQuery.toLowerCase()) ||
            element.content!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  void sortNotes() {
    notes.sort((a, b) => b.dateadded!.compareTo(a.dateadded!));
  }

  void addNote(Note note) {
    notes.add(note);
    sortNotes();
    notifyListeners();
    ApiService.addNote(note);
  }

  void updateNote(Note note) {
    int indexOfNote =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes[indexOfNote] = note;
    sortNotes();
    notifyListeners();
    ApiService.addNote(note);
  }

  void deleteNote(Note note) {
    int indexOfNote =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes.removeAt(indexOfNote);
    sortNotes();
    notifyListeners();
    ApiService.deleteNote(note);
  }

  void fetchNotes() async {
    notes = await ApiService.fetchNotes();
    sortNotes();
    isLoading = false;
    notifyListeners();
  }
}
