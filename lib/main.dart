import 'package:block_pattern_flutter_app/ToDoList/to_do_list_bloc.dart';
import 'package:block_pattern_flutter_app/ToDoList/to_do_list_screen.dart';
import 'package:block_pattern_flutter_app/apisHandling/noteProvider.dart';
import 'package:block_pattern_flutter_app/apisHandling/view/homePage.dart';
import 'package:block_pattern_flutter_app/imagePicker/imagePicker_bloc.dart';
import 'package:block_pattern_flutter_app/imagePicker/imagePicker_screen.dart';
import 'package:block_pattern_flutter_app/switch/switch_bloc.dart';
import 'package:block_pattern_flutter_app/switch/switch_screen.dart';
import 'package:block_pattern_flutter_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'counter/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NotesProvider(),
        ),
      ],
      // MultiBlocProvider(
      // providers: [
      //   BlocProvider<ImagePickerBloc>(
      //       create: (context) => ImagePickerBloc(ImagePickerUtils())),
      //   BlocProvider<SwitchBlock>(create: (context) => SwitchBlock()),
      //   BlocProvider<ToDoBloc>(create: (context) => ToDoBloc()),
      //   BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
      //   BlocProvider<CounterBloc>(create: (context) => CounterBloc()), // Adding CounterBloc
      // ],



      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        // home: ToDoScreen(),
        // home: SwitchWidget(),
        // home: CounterScreen(),
      ),
    );
  }
}
