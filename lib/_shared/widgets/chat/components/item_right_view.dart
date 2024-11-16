import 'package:flutter/material.dart';
import 'package:public_chat/_shared/widgets/chat/components/avatar_view.dart';
import 'package:public_chat/_shared/widgets/chat/components/view_translation.dart';
import 'package:public_chat/features/genai_setting/data/user_message_model.dart';
import 'package:public_chat/utils/locale_support.dart';

class ItemRightView extends StatelessWidget {
  const ItemRightView({
    super.key,
    required this.model,
  });
  final UserMessageModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.black26),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // display name
                Text(
                  model.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                ),
                // original language
                Text(
                  model.message,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
                ),
                // english version (if there is)
                ViewTranslation(
                  translations: model.translations,
                  message: model.message,
                  currentLocale: context.locale.localeName,
                  messageId: model.messageId,
                ),
              ],
            ),
          ),
          AvatarView(photoUrl: model.photoUrl, iconSize: model.iconSize),
        ],
      ),
    );
  }
}