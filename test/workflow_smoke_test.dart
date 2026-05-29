import 'package:flutter_test/flutter_test.dart';
import 'package:tiny_computer/workflow.dart';

void main() {
  test('default boot command starts the proot Debian rootfs', () {
    expect(D.boot, contains('proot'));
    expect(D.boot, contains(r'--rootfs=$CONTAINER_DIR'));
    expect(D.boot, contains('/bin/bash -l'));
  });

  test('default command list keeps Debian maintenance commands', () {
    expect(D.commands, isNotEmpty);
    expect(
      D.commands.any((item) => item['command']!.contains('apt update')),
      isTrue,
    );
    expect(
      D.commands.any((item) => item['command']!.contains('clear')),
      isTrue,
    );
  });
}
