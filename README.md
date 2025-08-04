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
cd flutter_my_blueproof
```

2. FVM で Flutter バージョンを設定

```bash
fvm use
```

3. Melos を使用して依存関係をインストール

```bash
melos pub-get
```

4. コード生成

```bash
melos gen
```

## 📝 開発コマンド

### パッケージ管理

```bash
# 全パッケージの依存関係を取得
melos pub-get

# パッケージの依存関係を更新
melos package:update

# メジャーバージョンアップデートを含む更新
melos package:update-major
```

### コード生成

```bash
# 全パッケージのコード生成
melos gen

# アセットのコード生成
melos gen:assets

# ウォッチモードでコード生成（開発時推奨）
melos gen:watch
```

### テスト

```bash
# 全パッケージのテスト実行
melos test
```

### コード修正

```bash
# Dartファイルの自動修正
melos fix
```

### iOS 設定

```bash
# iOSのPod install
melos pod:ios
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
- **認証フロー**: 条件付きリダイレクト
- **ディープリンク対応**: URL 直接アクセス

**ルート構成:**

```
/ (StartupRoute)
├── /search (SearchBranch)
│   ├── /search/login
│   └── /search/results
├── /settings (SettingsBranch)
└── /debug (Debug mode only)
```

### エラーハンドリング戦略

**多層エラー処理システム:**

1. **API 層**: DioException → AppException 変換
2. **Repository 層**: ビジネス例外ハンドリング
3. **UseCase 層**: 入力値検証・ビジネスルール
4. **UI 層**: ユーザーフレンドリーなエラー表示

### テスト戦略

**包括的テストピラミッド:**

- **Unit Tests**: UseCase, Repository, Notifier
- **Widget Tests**: 個別コンポーネント
- **Integration Tests**: エンドツーエンドフロー

**Mockito 活用:**

- API 応答のモック化
- 複雑な依存関係の分離
- エラーケーステスト

## 🎯 プロダクション対応機能

### パフォーマンス最適化

- **画像キャッシュ**: `cached_network_image`によるメモリ効率化
- **デバウンス検索**: 不要な API 呼び出し削減
- **遅延ローディング**: 必要時のみリソース読み込み
- **Keep Alive Provider**: 重要な状態の永続化

### ユーザビリティ

- **ローディング状態**: 操作フィードバックの明確化
- **エラー回復**: リトライ機能付きエラー表示
- **空状態処理**: 適切なプレースホルダー表示
- **アクセシビリティ**: セマンティクス対応

### 開発者体験

- **Hot Reload**: 状態保持しながらの開発
- **型安全性**: コンパイル時エラー検出
- **コード生成**: ボイラープレート削減
- **静的解析**: Very Good Analysis 使用

### セキュリティ

- **トークン管理**: メモリ内での安全な認証情報保持
- **HTTPS 通信**: 暗号化された API 通信
- **入力値検証**: XSS/インジェクション対策

## 🧪 テスト実装詳細

### テスト構成

```
test/
├── unit/                    # ユニットテスト
│   ├── use_cases/          # ビジネスロジックテスト
│   ├── repositories/       # データアクセステスト
│   └── notifiers/          # 状態管理テスト
├── widget/                 # ウィジェットテスト
└── integration/            # 統合テスト（準備中）
```

### 実装済みテスト

**GitHub Repository Search Feature:**

- `GithubRepositorySearchUseCase`: 検索ロジックテスト
- `GithubRepositorySearchLoadMoreUseCase`: ページネーションテスト
- `RemoteGithubRepositorySearchRepository`: API 通信テスト
- `GithubRepositorySearchStateNotifier`: 状態管理テスト

**Authentication Feature:**

- `RemoteAuthRepository`: 認証データアクセステスト
- `AuthNotifier`: 認証状態管理テスト

### テスト戦略

- **Mockito 使用**: 外部依存をモック化
- **ProviderContainer**: Riverpod プロバイダーテスト
- **AsyncValue**: 非同期状態のテスト
- **Edge Case**: エラー・境界値テスト

## 📖 開発ガイドライン

### コーディング規約

- **Very Good Analysis**: Dart/Flutter 推奨リント設定
- **Code Generation**: 手動コード記述の最小化
- **型安全性**: nullable 型の適切な使用
- **関数型プログラミング**: 不変オブジェクト・純粋関数
- **SOLID 原則**: 単一責任・依存性逆転

### アーキテクチャ原則

1. **Clean Architecture 準拠**: レイヤー境界の厳格な管理
2. **Dependency Injection**: コンストラクタ注入・Provider パターン
3. **Single Source of Truth**: 状態の一元管理
4. **Separation of Concerns**: 責務の明確な分離
5. **Testability First**: テスト容易性を最優先

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

### ブランチ戦略

- **main**: 本番用ブランチ（保護対象）
- **develop**: 開発統合ブランチ
- **feature/\***: 新機能開発用ブランチ
- **fix/\***: バグ修正用ブランチ
- **release/\***: リリース準備用ブランチ

### コミット規約

```
feat(scope): 新機能追加
fix(scope): バグ修正
docs(scope): ドキュメント更新
style(scope): コードフォーマット
refactor(scope): リファクタリング
test(scope): テスト追加・修正
chore(scope): ビルドプロセス・補助ツール
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
  "API_BASE_URL": "https://api.github.com",
  "LOG_LEVEL": "debug"
}

// stg.json - ステージング環境
{
  "API_BASE_URL": "https://api.github.com",
  "LOG_LEVEL": "info"
}

// prd.json - 本番環境
{
  "API_BASE_URL": "https://api.github.com",
  "LOG_LEVEL": "error"
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
