import 'dart:io' if (dart.library.html) 'dart:html'; // Import dart:html for web platform
import 'package:flutter/material.dart';
import 'package:nzinga/default_settings/app_text/app_text.dart';
import 'package:nzinga/view_models/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: const AppText(text: 'Home'),
        ),
        body: Center(
          child: viewModel.image == null
              ? const AppText(text: 'No image selected.')
              : Image.network(viewModel.image!.path),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: viewModel.pickImage,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
