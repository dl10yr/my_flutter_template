import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    required Uri initialUrl,
    required VoidCallback pop,
    super.key,
  }) : _pop = pop,
       _initialUrl = initialUrl;

  final Uri _initialUrl;
  final VoidCallback _pop;

  @override
  State<WebViewPage> createState() => _WebViewState();
}

class _WebViewState extends State<WebViewPage> {
  static const _pullToRefreshTriggerDistance = 80.0;

  late final WebViewController _webViewController;
  bool _isLoading = false;
  bool _canPop = false;
  bool _hasError = false;
  bool _isPullRefreshing = false;
  double _pullDistance = 0;
  double _scrollY = 0;
  double? _pointerDownY;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController();
    unawaited(_configureWebView());
  }

  Future<void> _configureWebView() async {
    await _webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    await _webViewController.setOnScrollPositionChange((change) {
      _scrollY = change.y;
      if (_scrollY > 0 && _pullDistance > 0 && mounted) {
        setState(() {
          _pullDistance = 0;
        });
      }
    });
    await _webViewController.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (_) {
          if (!mounted) {
            return;
          }
          setState(() {
            _isLoading = true;
            _hasError = false;
          });
        },
        onProgress: (progress) {
          if (progress == 100 && mounted) {
            setState(() {
              _isLoading = false;
            });
          }
          unawaited(_syncCanPop());
        },
        onPageFinished: (_) {
          if (!mounted) {
            return;
          }
          setState(() {
            _isLoading = false;
            _isPullRefreshing = false;
          });
          unawaited(_syncCanPop());
        },
        onUrlChange: (_) {
          unawaited(_syncCanPop());
        },
        onWebResourceError: (error) {
          if (!(error.isForMainFrame ?? true) || !mounted) {
            return;
          }
          setState(() {
            _isLoading = false;
            _hasError = true;
            _isPullRefreshing = false;
          });
        },
      ),
    );

    if (_webViewController.platform is WebKitWebViewController) {
      await (_webViewController.platform as WebKitWebViewController)
          .setAllowsBackForwardNavigationGestures(true);
    }

    await _webViewController.loadRequest(widget._initialUrl);
  }

  Future<void> _syncCanPop() async {
    final canGoBack = await _webViewController.canGoBack();
    final canPop = !canGoBack;

    if (!mounted || _canPop == canPop) {
      return;
    }

    setState(() {
      _canPop = canPop;
    });
  }

  Future<void> _reload() async {
    if (mounted) {
      setState(() {
        _hasError = false;
        _isLoading = true;
        _isPullRefreshing = false;
      });
    }
    await _webViewController.reload();
  }

  Future<void> _reloadFromPullToRefresh() async {
    if (mounted) {
      setState(() {
        _hasError = false;
        _isLoading = true;
        _isPullRefreshing = true;
      });
    }
    await _webViewController.reload();
  }

  void _handlePointerDown(PointerDownEvent event) {
    _pointerDownY = event.position.dy;
  }

  void _handlePointerMove(PointerMoveEvent event) {
    final pointerDownY = _pointerDownY;
    if (pointerDownY == null || _scrollY > 0 || _hasError) {
      return;
    }

    final nextPullDistance = event.position.dy - pointerDownY;
    final clampedPullDistance = math
        .max(0, math.min(nextPullDistance, _pullToRefreshTriggerDistance * 1.5))
        .toDouble();

    if (_pullDistance == clampedPullDistance) {
      return;
    }

    setState(() {
      _pullDistance = clampedPullDistance;
    });
  }

  Future<void> _handlePointerEnd() async {
    final shouldRefresh = _pullDistance >= _pullToRefreshTriggerDistance;

    _pointerDownY = null;

    if (mounted && _pullDistance > 0) {
      setState(() {
        _pullDistance = 0;
      });
    }

    if (shouldRefresh) {
      await _reloadFromPullToRefresh();
    }
  }

  void _handlePointerCancel(PointerCancelEvent _) {
    _pointerDownY = null;

    if (_pullDistance == 0 || !mounted) {
      return;
    }

    setState(() {
      _pullDistance = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _canPop,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) {
          return;
        }
        if (await _webViewController.canGoBack()) {
          await _webViewController.goBack();
        } else {
          widget._pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('WebView')),
        body: Listener(
          behavior: HitTestBehavior.translucent,
          onPointerDown: _handlePointerDown,
          onPointerMove: _handlePointerMove,
          onPointerUp: (_) {
            unawaited(_handlePointerEnd());
          },
          onPointerCancel: _handlePointerCancel,
          child: Stack(
            children: [
              Visibility(
                visible: !_hasError,
                child: WebViewWidget(controller: _webViewController),
              ),
              if (_hasError)
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('エラーが発生しました'),
                      TextButton(
                        onPressed: _reload,
                        child: const Text('再読み込み'),
                      ),
                    ],
                  ),
                ),
              if (_pullDistance > 0 || _isPullRefreshing)
                Positioned(
                  top: 16,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: RefreshProgressIndicator(
                      value: _isPullRefreshing
                          ? null
                          : (_pullDistance / _pullToRefreshTriggerDistance)
                                .clamp(0.0, 1.0),
                    ),
                  ),
                ),
              if (_isLoading)
                const Center(child: CircularProgressIndicator.adaptive()),
            ],
          ),
        ),
      ),
    );
  }
}
