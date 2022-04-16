import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_catalog/features/movie_catalog/presentation/bloc/dark_mode_cubit.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: BlocBuilder<DarkModeCubit, DarkModeState>(
          builder: (context, state) {
            return Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        const Text("Dark Mode"),
                        Switch(value: state.isSwitched, onChanged: (value) {
                          context.read<DarkModeCubit>().switchThemeMode(value);
                        }
                        ),
                      ]
                  )
                ],
              ),
            );
          },
        )
    );
  }
}
