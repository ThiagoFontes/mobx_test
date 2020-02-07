# mobx_test

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

## Configuring your project

- Adding dependencies at `pubspec.yaml`
```
dependencies:
  mobx: ^0.4.0
  flutter_mobx: ^0.3.4

dev_dependencies:
  build_runner: ^1.3.1
  mobx_codegen: ^0.3.11
```

- Get packages via the following command `flutter packages get`
- To generate code for the mobx `.g.dart` files `flutter packages pub run build_runner build`
- Watching for changes and generating code on the go `flutter packages pub run build_runner watch`
- To *clean* generated code `flutter packages pub run build_runner watch --delete-conflicting-outputs`

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Git hooks example
```
#!/bin/sh
# Template from https://gist.github.com/miquelbeltran/56b7e276f8209c46bc39644b82018587
# To use add to `.git/hooks/`
# Should be named `pre-push`
# Make executable with `chmod +x`

# stash any unstaged changes
git stash -q --keep-index

# run Flutter analyze + test
flutter analyze

if [ $? -ne 0 ]; then
        # unstash the unstashed changes
        git stash pop -q
        exit 1
fi

flutter test


if [ $? -ne 0 ]; then
        # unstash the unstashed changes
        git stash pop -q
        exit 1
fi

# unstash the unstashed changes
git stash pop -q
exit 0
```