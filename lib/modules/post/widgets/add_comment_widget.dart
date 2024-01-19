import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reddit_clone_flutter/modules/post/post_controller.dart';

class AddCommentWidget extends GetView<PostController> {
  AddCommentWidget({
    super.key,
    required this.replyAction,
  });

  final focusNode = FocusNode();
  final RxString comment = ''.obs;

  final ValueChanged<String> replyAction;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Obx(
        () => AnimatedContainer(
          height: MediaQuery.of(context).size.height * (controller.isCommentTyping.value ? 0.18 : 0.1),
          duration: const Duration(milliseconds: 300),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        spreadRadius: 0.4,
                        blurRadius: 2,
                        offset: Offset(-0.5, 0),
                      )
                    ],
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
                child: controller.isCommentTyping.value ? _typingView() : _notTypingView(),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _typingView() {
    return Column(
      children: [
        Container(
          width: 35,
          height: 5,
          color: Colors.grey.shade300,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  //'Please follow community rules when commenting',
                  TextSpan(text: 'Please follow ', style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
                  const TextSpan(text: 'community rules ', style: TextStyle(color: Colors.blueAccent, fontSize: 12)),
                  TextSpan(text: 'when commenting', style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
                ],
              ),
              //style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
            )),
        const SizedBox(
          height: 8.0,
        ),
        TextFormField(
          focusNode: focusNode,
          onTap: () {
            log('on tapped');
          },
          onChanged: (value) {
            comment.value = value;
          },
          decoration: InputDecoration(
            hintText: 'Add a comment',
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            border: InputBorder.none,
          ),
        ),
        const Divider(
          height: 1,
          thickness: 0.1,
          color: Colors.black,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Icon(
                Icons.attach_file_outlined,
                color: Colors.grey.shade500,
              ),
              Icon(
                Icons.image_outlined,
                color: Colors.grey.shade500,
              ),
              const Spacer(),
              ElevatedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  disabledBackgroundColor: Colors.blue.shade50,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
                ),
                onPressed: comment.value.isNotEmpty ? reply : null,
                child: const Text(
                  'Reply',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void reply() {
    controller.isCommentTyping.value = false;
    replyAction(comment.value);
  }

  Widget _notTypingView() {
    return GestureDetector(
      onTap: () {
        controller.isCommentTyping.value = true;
        focusNode.requestFocus();
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Add a Comment',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
            ),
            Icon(
              Icons.image_outlined,
              color: Colors.grey[800],
            )
          ],
        ),
      ),
    );
  }
}
