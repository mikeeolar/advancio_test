// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:advancio_test/core/base/base_view_model.dart';
import 'package:advancio_test/app/app_locator.dart';

/// Creates a binding between the ViewModel and the UI by providing a builder function that
/// gets called when the viewmodel changes has occured.
class BaseView<T extends BaseViewModel> extends StatefulWidget {
  /// A function that builds the UI to be shown from the ViewModel - Required
  ///
  /// [viewModel] is the ViewModel passed in and [child] is the [staticChildBuilder] result
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  /// Fires when the ViewModel is first created or re-created
  final Function(T)? onModelReady;

  /// Fires when the ViewModel is disposed
  final Function(T)? onModelDisposed;

  const BaseView({
    Key? key,
    required this.builder,
    this.onModelReady,
    this.onModelDisposed,
  }) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) widget.onModelReady!(model);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onModelDisposed != null) widget.onModelDisposed!(model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
