#!/bin/bash

# Add your commands here
# For example:

dart fix --apply lib
flutter pub run import_sorter:main
dart format lib
dart run build_runner build --delete-conflicting-outputs