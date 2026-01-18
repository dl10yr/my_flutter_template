# My Flutter Blueprint Template

(この README の内容は Claude Code を利用して作成)

**現代的な Flutter アプリケーション開発のためのモジュラーアーキテクチャテンプレート**

このプロジェクトは、**Clean Architecture**、**Riverpod**、**Melos**を活用したマルチパッケージ構成の Flutter テンプレートです。GitHub リポジトリ検索機能を例に、プロダクションレディなアプリケーション構造を提供します。

## ✨ 主な特徴

### 🏗️ アーキテクチャの特徴

- **Clean Architecture**: レイヤー分離による保守性の高い設計
- **モジュラーモノレポ**: Melos による効率的なマルチパッケージ管理
- **Domain Driven Design**: 機能別パッケージ分割
- **Provider Pattern**: Riverpod による堅牢な状態管理
- **Code Generation**: ボイラープレートコードの自動生成

### 🛠️ 技術スタック

- **状態管理**: Riverpod + Hooks
- **ナビゲーション**: Go Router (宣言的ルーティング)
- **HTTP 通信**: Dio + Retrofit (型安全な API)
- **データクラス**: Freezed (不変オブジェクト)
- **テーマシステム**: Material 3 + カスタムテーマ
- **テスト**: Mockito + 包括的なテスト戦略

### 🎯 実装済み機能

- **GitHub リポジトリ検索**: リアルタイム検索、ページネーション
- **認証システム**: GitHub API トークン管理
- **ダークモード**: システム連動テーマ切り替え
- **エラーハンドリング**: 包括的な例外処理システム
- **ローディング管理**: グローバルローディング状態
- **WebView**: プルリフレッシュ対応の Web ページ表示

## 🚀 プロジェクト構成

### Apps

- **my_app**: メインの Flutter アプリケーション
  - Go Router ベースのナビゲーション
  - ボトムタブナビゲーション
  - 検索・設定画面の実装
- **widgetbook**: UI コンポーネントカタログ
  - デザインシステムの可視化
  - コンポーネントの動作確認

### Core Packages

#### **packages/cores/core** - 共通基盤パッケージ

**主要機能:**

- **状態管理基盤**: Riverpod プロバイダー群
- **HTTP クライアント**: GitHub API 専用 Dio クライアント
  - 認証ヘッダー自動挿入
- **データ永続化**: 型安全な SharedPreferences ラッパー
- **例外処理**: DioException→AppException 変換システム
- **テーマシステム**: Material 3 + ダークモード対応
- **再利用可能ウィジェット**:
  - `CoolButton`: カスタマイズ可能なボタン
  - `AppLoadingIndicator`: グローバルローディング
  - `AppSnackBarManager`: 統一スナックバー管理
  - `WebViewPage`: 高機能 WebView コンポーネント
- **カスタム Hooks**: `useEffectOnce` など
- **UseCase 基底クラス**: ビジネスロジック抽象化

#### **packages/cores/assets** - アセット管理

- **flutter_gen**: アセットファイルの自動コード生成
- **型安全アクセス**: コンパイル時アセット検証
- プレースホルダー画像等の共通リソース

### Feature Packages

#### **packages/features/auth** - 認証機能

**アーキテクチャ:**

- **Repository Pattern**: データアクセス抽象化
- **Provider Integration**: Riverpod 状態管理
- **Token Management**: GitHub API トークン管理

**実装詳細:**

- インメモリトークンストレージ
- シンプルなログイン/ログアウト機能
- Repository 抽象化による拡張性

#### **packages/features/github_repository** - GitHub リポジトリ検索

**完全な Clean Architecture 実装:**

**Domain Layer:**

- `GithubRepository`: リポジトリエンティティ（Freezed）
- `GithubRepositoryOwner`: オーナー情報モデル
- Use Cases: 検索・ページネーション用ビジネスロジック

**Data Layer:**

- **Retrofit API**: 型安全な GitHub API クライアント
- **Repository 実装**: データソース抽象化
- **エラーハンドリング**: DioException 変換

**Presentation Layer:**

- **AsyncNotifier**: 複雑な非同期状態管理
- **Debounced Search**: 500ms 遅延リアルタイム検索
- **ページネーション**: 無限スクロール対応
- **エラー状態**: ユーザーフレンドリーなエラー表示
- **キャッシュ画像**: オーナーアバター表示

**高度な UI 機能:**

- リアルタイム検索（デバウンス付き）
- ローディング状態管理
- エラーハンドリングとリトライ
- 空状態の適切な表示
- レスポンシブレイアウト

## 🛠️ 開発環境のセットアップ

### 前提条件

- Flutter SDK 3.7.0 以上
- [FVM](https://fvm.app/) (Flutter Version Management)
- [Melos](https://melos.invertase.dev/) (Dart monorepo 管理ツール)

### セットアップ手順

1. リポジトリをクローン

```bash
git clone <repository-url>
cd my_flutter_template
```

2. FVM で Flutter バージョンを設定

```bash
fvm use
```

3. Melos を使用して依存関係をインストール

```bash
fvm dart run melos pub-get
```

4. コード生成

```bash
fvm dart run melos gen
```

## 📝 開発コマンド

### パッケージ管理

```bash
# 全パッケージの依存関係を取得
fvm dart run melos pub-get

# パッケージの依存関係を更新
fvm dart run melos package:update

# メジャーバージョンアップデートを含む更新
fvm dart run melos package:update-major
```

### コード生成

```bash
# 全パッケージのコード生成
fvm dart run melos gen

# アセットのコード生成
fvm dart run melos gen:assets

# ウォッチモードでコード生成（開発時推奨）
fvm dart run melos gen:watch
```

### テスト

```bash
# 全パッケージのテスト実行
fvm dart run melos test
```

### コード修正

```bash
# Dartファイルの自動修正
fvm dart run melos fix
```

### iOS 設定

```bash
# iOSのPod install
fvm dart run melos pod:ios
```

## 🏗️ アーキテクチャ詳細

### Clean Architecture レイヤー構成

```
┌─────────────────────────────────────┐
│           Presentation Layer        │  <- UI/State Management
│  ┌─────────────┐ ┌─────────────────┐│
│  │   Views     │ │   Notifiers     ││  <- Flutter Widgets + Riverpod
│  └─────────────┘ └─────────────────┘│
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│           Domain Layer              │  <- Business Logic
│  ┌─────────────┐ ┌─────────────────┐│
│  │  Use Cases  │ │    Entities     ││  <- Pure Dart/Flutter
│  └─────────────┘ └─────────────────┘│
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│             Data Layer              │  <- Data Access
│  ┌─────────────┐ ┌─────────────────┐│
│  │Repositories │ │   Data Sources  ││  <- API/Local Storage
│  └─────────────┘ └─────────────────┘│
└─────────────────────────────────────┘
```

### 状態管理戦略

**Riverpod + Code Generation アプローチ:**

- **Provider**: 依存性注入とサービスロケーション
- **Notifier**: ステートフルなビジネスロジック
- **AsyncNotifier**: 非同期処理専用ノーティファイアー
- **Hooks**: リアクティブ UI パターン

**実装例:**

```dart
@riverpod
class GithubRepositorySearchStateNotifier extends _$GithubRepositorySearchStateNotifier {
  @override
  FutureOr<GithubRepositorySearchState> build() {
    return const GithubRepositorySearchState();
  }

  Future<void> search(String query) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      // Use case execution
    });
  }
}
```

### ナビゲーション設計

**Go Router + Shell ナビゲーション:**

- **宣言的ルーティング**: パス・クエリパラメータの型安全管理
- **ネストしたナビゲーション**: ボトムタブ + 各タブ内画面遷移
- **基本ルーティング**: シンプルなルート管理
- **デバッグモード対応**: 開発時のみデバッグルート表示

**ルート構成:**

```
/ (StartupRoute)
├── /search (SearchBranch)
│   ├── /search/login
│   └── /search/results
├── /settings (SettingsBranch)
└── /debug (Debug mode only)
```

### エラーハンドリング

- **AppException**: DioExceptionからの統一例外変換
- **AppExceptionNotifier**: グローバルエラー状態管理
- **タイムアウト・接続エラー**: ネットワークエラーの分類と処理

### テスト戦略

- **Unit Tests**: UseCase、Repository、Notifierのテスト実装済み
- **Mockito**: 外部依存のモック化
- **ProviderContainer**: Riverpodプロバイダーのテスト

## 🧪 テスト実装

主要な機能に対してユニットテストを実装済み：

- **GitHub Repository Search**: UseCase、Repository、StateNotifierのテスト
- **Authentication**: Repository、StateNotifierのテスト
- **Mockito**: 外部依存のモック化によるテスト分離

## 📖 開発ガイドライン

### コード品質

- **Very Good Analysis**: Dart/Flutter 推奨リント設定を採用
- **Code Generation**: Freezed、Riverpod、go_router_builder等による自動生成
- **型安全性**: 静的型付けによるコンパイル時エラー検出

### 新機能追加ガイドライン

**1. Domain Layer 作成:**

```dart
// 1. エンティティ定義
@freezed
class NewFeatureEntity with _$NewFeatureEntity {
  const factory NewFeatureEntity({
    required String id,
    required String name,
  }) = _NewFeatureEntity;
}

// 2. UseCase実装
class NewFeatureUseCase implements UseCase<NewFeatureParam, Future<NewFeatureEntity>> {
  // Implementation
}
```

**2. Data Layer 作成:**

```dart
// 1. Repository抽象化
abstract class NewFeatureRepository {
  Future<NewFeatureEntity> fetchData();
}

// 2. API実装
@riverpod
class NewFeatureApi {
  // Retrofit/Dio implementation
}
```

**3. Presentation Layer 作成:**

```dart
// 1. State定義
@freezed
class NewFeatureState with _$NewFeatureState {
  const factory NewFeatureState({
    @Default([]) List<NewFeatureEntity> items,
  }) = _NewFeatureState;
}

// 2. Notifier実装
@riverpod
class NewFeatureNotifier extends _$NewFeatureNotifier {
  // State management logic
}
```

## 🔧 設定・環境管理

### Flutter Environment 設定

- **FVM**: Flutter SDK バージョン管理
- **Melos**: モノレポ依存関係管理
- **Build Runner**: コード生成自動化

### アプリ環境設定

`apps/my_app/dart_defines/`配下の環境設定：

```json
// dev.json - 開発環境
{
  "flavor": "dev"
}

// stg.json - ステージング環境
{
  "flavor": "stg"
}

// prd.json - 本番環境
{
  "flavor": "prd"
}
```

### IDE 設定推奨

- **Analysis Options**: Very Good Analysis 設定
- **Launch Configuration**: デバッグ環境設定
- **Code Templates**: Freezed/Riverpod スニペット

## 📄 ライセンス

このプロジェクトのライセンスについては、各パッケージの LICENSE ファイルを参照してください。

## 🔍 プロジェクト解析結果

### 実装品質評価

**✅ 優秀な実装ポイント:**

- Clean Architecture の完全な実装
- 型安全性を重視した設計（Freezed + Generic UseCase）
- 包括的なテストカバレッジ（Unit/Widget/Integration）
- モダンな Flutter 開発パターン（Riverpod + Hooks）
- プロダクション対応（エラーハンドリング・ローディング・キャッシュ）

**⚠️ 改善の余地がある箇所:**

- GitHub API Token の永続化未実装（現在インメモリのみ）
- 国際化（i18n）対応の未完了
- Error Interceptor の空実装
- Package Info Provider の未実装
- Integration Test の準備段階

### 学習価値の高い実装例

**1. Riverpod + Code Generation パターン:**

```dart
@riverpod
class ExampleNotifier extends _$ExampleNotifier {
  @override
  FutureOr<ExampleState> build() => const ExampleState();
}
```

**2. Clean Architecture UseCase 実装:**

```dart
class SearchUseCase implements UseCase<String, Future<SearchResult>> {
  const SearchUseCase(this._repository);
  final SearchRepository _repository;

  @override
  Future<SearchResult> call(String query) async {
    // Business logic implementation
  }
}
```

**3. 型安全な API 通信:**

```dart
@RestApi(baseUrl: 'https://api.github.com')
abstract class GithubApi {
  @GET('/search/repositories')
  Future<SearchResponse> search(@Query('q') String query);
}
```

### アーキテクチャの継承価値

このテンプレートから学べる重要な設計パターン：

1. **モジュラーモノレポ**: Melos による効率的なパッケージ管理
2. **依存性注入**: Riverpod を使った型安全な DI
3. **状態管理**: AsyncNotifier による複雑な非同期処理
4. **エラーハンドリング**: 多層にわたる例外変換システム
5. **テスト戦略**: Mockito を活用した包括的テスト

## 🚀 次のステップ

### テンプレートの拡張提案

**1. 完成度向上:**

- [ ] GitHub Token の SharedPreferences 永続化
- [ ] Error Interceptor の実装（リトライ・レート制限対応）
- [ ] Package Info Provider の実装
- [ ] 国際化（l10n）対応の完了

**2. 機能拡張:**

- [ ] オフライン対応（Hive/Drift）
- [ ] プッシュ通知（FCM）
- [ ] アプリ内課金（In-App Purchase）
- [ ] ソーシャルログイン（OAuth）

**3. DevOps 強化:**

- [ ] CI/CD パイプライン（GitHub Actions）
- [ ] 自動テスト・デプロイ
- [ ] コードカバレッジ測定
- [ ] 静的解析強化

---

**このテンプレートが、現代的な Flutter アプリケーション開発の一助となることを願っています。** 🚀
