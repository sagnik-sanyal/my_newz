import 'app/app.dart';
import 'app/bootstrap.dart';
import 'environment/app_env.dart';

void main() => bootstrap(() => const App(), AppEnv.dev);
