import 'package:paynowuz/export.dart';
import 'model.dart';

class OnboardingInfo{
  final List<OnboardingModel> _items = [
    OnboardingModel(svgPicture: Assets.imagesIllustration, title: "add_all_accounts_manage".tr()),
    OnboardingModel(svgPicture: Assets.imagesIllustration1, title: "track_your_activity".tr()),
    OnboardingModel(svgPicture: Assets.imagesWalletRafiki, title: "send_request_payments".tr()),
  ];
  List<OnboardingModel> get items => _items;
}