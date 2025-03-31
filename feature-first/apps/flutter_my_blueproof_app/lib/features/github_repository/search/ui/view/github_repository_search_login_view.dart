import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_my_blueprint/features/auth/ui/provider/auth_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GithubRepositorySearchLoginView extends HookConsumerWidget {
  const GithubRepositorySearchLoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final isLoading = useState(false);
    final obscureText = useState(true);

    return Scaffold(
      appBar: AppBar(title: const Text('GitHub Login'), elevation: 0),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.code, size: 80, color: Colors.blueGrey),
              const SizedBox(height: 32),
              const Text(
                'Welcome to GitHub Repository Explorer',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Please enter your GitHub token to continue',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              TextField(
                controller: controller,
                obscureText: obscureText.value,
                decoration: InputDecoration(
                  labelText: 'GitHub Token',
                  hintText: 'Enter your GitHub personal access token',
                  prefixIcon: const Icon(Icons.vpn_key),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureText.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () => obscureText.value = !obscureText.value,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '''You can create a token in GitHub Settings > Developer settings > Personal access tokens''',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed:
                      isLoading.value
                          ? null
                          : () async {
                            if (controller.text.isEmpty) return;

                            FocusManager.instance.primaryFocus?.unfocus();
                            isLoading.value = true;

                            try {
                              ref
                                  .read(authNotifierProvider.notifier)
                                  .login(controller.text);
                            } finally {
                              isLoading.value = false;
                            }
                          },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child:
                      isLoading.value
                          ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                          : const Text('Login', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
