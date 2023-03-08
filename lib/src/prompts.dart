// Forked from melos
import 'dart:io';

import 'package:prompts/prompts.dart' as prompts;

T _promptWithTerminal<T>(
  T Function() runPrompt, {
  required String message,
  T? defaultsTo,
  T? defaultsToWithoutPrompt,
  bool requirePrompt = false,
}) {
  if (stdin.hasTerminal) {
    return runPrompt();
  }

  if (!requirePrompt) {
    if (defaultsToWithoutPrompt is T) {
      return defaultsToWithoutPrompt;
    }

    if (defaultsTo is T) {
      return defaultsTo;
    }
  }

  throw PromptException(message);
}

class PromptException implements Exception {
  PromptException(this.message);

  final String message;

  @override
  String toString() => 'Was unable to prompt for input:\n$message';
}

String promptInput(
  String message, {
  String? defaultsTo,
  String? defaultsToWithoutPrompt,
  bool requirePrompt = false,
}) {
  return _promptWithTerminal(
    () => prompts.get(message, defaultsTo: defaultsTo),
    message: message,
    defaultsTo: defaultsTo,
    defaultsToWithoutPrompt: defaultsToWithoutPrompt,
    requirePrompt: requirePrompt,
  );
}

bool promptBool({
  String message = 'Continue?',
  bool defaultsTo = false,
  bool? defaultsToWithoutPrompt,
  bool requirePrompt = false,
}) {
  return _promptWithTerminal(
    () => prompts.getBool(message, defaultsTo: defaultsTo),
    message: message,
    defaultsTo: defaultsTo,
    defaultsToWithoutPrompt: defaultsToWithoutPrompt,
    requirePrompt: requirePrompt,
  );
}

T promptChoice<T>(
  String message,
  Iterable<T> options, {
  T? defaultsTo,
  T? defaultsToWithoutPrompt,
  String prompt = 'Enter your choice',
  bool interactive = true,
  bool requirePrompt = false,
}) {
  return _promptWithTerminal(
    () => prompts.choose(
      message,
      options,
      defaultsTo: defaultsTo,
      prompt: prompt,
      interactive: interactive,
    )!,
    message: message,
    defaultsTo: defaultsTo,
    defaultsToWithoutPrompt: defaultsToWithoutPrompt,
    requirePrompt: requirePrompt,
  );
}
