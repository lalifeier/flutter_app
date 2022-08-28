export 'response/login_response.dart';
export 'response/get_super_category_response.dart';
export 'response/get_carouse_list_response.dart';
export 'user_info.dart';
export 'request/login_request.dart';
import 'package:quiver/core.dart';

T? checkOptional<T>(Optional<T?>? optional, T? Function()? def) {
  // No value given, just take default value
  if (optional == null) return def?.call();

  // We have an input value
  if (optional.isPresent) return optional.value;

  // We have a null inside the optional
  return null;
}
