#!/bin/bash

# オプションのチェック
CLEAN=false

for arg in "$@"; do
  if [ "$arg" == "--clean" ]; then
    CLEAN=true
    break
  fi
done

# コードのフォーマットや整理
dart fix --apply lib
dart format lib

# --clean オプションが指定された場合、キャッシュをクリア
if [ "$CLEAN" == "true" ]; then
  dart run build_runner clean
fi

# build_runner のビルドを実行
dart run build_runner build --delete-conflicting-outputs
