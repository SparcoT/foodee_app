import 'dart:io';

void main() {
  final firstCommand = Process.runSync(
    'openapi-generator-cli',
    [
      'generate',
      '-g',
      'dart-dio-next',
      '--additional-properties=prependFormOrBodyParameters=true',
      '-o',
      'api',
      '-i',
      'api.yaml',
    ],
    runInShell: true,
  );
  print(firstCommand.stdout);
  final secondResult = Process.runSync(
    'flutter',
    [
      'pub',
      'get',
    ],
    workingDirectory: 'api',
    runInShell: true,
  );
  print(secondResult.stdout);
  final thirdResult = Process.runSync(
    'flutter',
    [
      'pub',
      'run',
      'build_runner',
      'build',
    ],
    workingDirectory: 'api',
    runInShell: true,
  );
  print(thirdResult.stdout);
}
