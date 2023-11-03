import 'package:everestcamp_task/features/home/logic/home_view_provider.dart';
import 'package:everestcamp_task/ui/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../ui/src/app_text_styles.dart';

class SearchTextField extends ConsumerWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(moodViewModelProvider.notifier);
    return TextFormField(
      controller: viewModel.searchTextController,
      keyboardType: TextInputType.text,
      onChanged: viewModel.onChangedSearch,
      style: AppTextStyles.body,
      enabled: true,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 12.w),
        fillColor: const Color(0xff211F30),
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        hintText: 'What movie are you searching?',
        hintStyle: AppTextStyles.title,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Color(0xff211F30),
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        prefixIcon: const Icon(
          CupertinoIcons.search,
        ),
        suffixIcon: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final state = ref.watch(moodViewModelProvider);
            return IconButton(
              icon: state.isTextFieldEmpty
                  ? gap0
                  : const Icon(
                      CupertinoIcons.multiply,
                      color: Colors.white,
                    ),
              onPressed: viewModel.onClearSearch,
            );
          },
        ),
      ),
      onFieldSubmitted: viewModel.searchMovie,
    );
  }
}
