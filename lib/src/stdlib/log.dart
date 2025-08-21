// coverage:ignore-file

// ignore_for_file: unnecessary_question_mark necessary for the source gen to pick it up

import 'package:dscript_annotations/dscript_annotations.dart';
import 'package:logging/logging.dart';
import 'package:dscript_dart/dscript_dart.dart';

part 'log.g.dart';

/// Provides basic logging utitlities.
///
/// !> Log messages will not be visible when using [IsolateRuntime].
@namespace
class LogBindings extends _$LogBindings {
  /// The logger instance for this script.
  late final Logger logger;

  /// Bindings for the logging standard library.
  LogBindings(ScriptMetadata metadata) {
    logger = Logger(
      '[Dscript] ${metadata.author}.${metadata.name}@${metadata.version}',
    );
  }

  /// Logs general informational messages that highlight the progress of the application at a coarse level.
  @override
  void info(dynamic message, {dynamic? error}) {
    logger.info(message, error);
  }

  /// Logs potential problems that are not yet errors but might require attention or could lead to issues.
  @override
  void warning(dynamic message, {dynamic? error}) {
    logger.warning(message, error);
  }

  /// Logs serious failures or errors that will likely prevent normal program execution.
  @override
  void severe(dynamic message, {dynamic? error}) {
    logger.severe(message, error);
  }

  /// Logs tracing information for debugging purposes.
  /// Less verbose than [finer] or [finest].
  @override
  void fine(dynamic message, {dynamic? error}) {
    logger.fine(message, error);
  }

  /// Logs fairly detailed tracing information.
  /// Useful when debugging complex flows with more granularity than [fine].
  @override
  void finer(dynamic message, {dynamic? error}) {
    logger.finer(message, error);
  }

  /// Logs highly detailed tracing information.
  /// Intended for deep debugging, usually too verbose for normal use.
  @override
  void finest(dynamic message, {dynamic? error}) {
    logger.finest(message, error);
  }

  /// Logs static configuration messages.
  /// Typically used to record startup settings or environment details.
  @override
  void config(dynamic message, {dynamic? error}) {
    logger.config(message, error);
  }

  /// Logs messages at the shout level.
  /// Louder than [severe]; use sparingly for attention-grabbing events.
  @override
  void shout(dynamic message, {dynamic? error}) {
    logger.shout(message, error);
  }
}
