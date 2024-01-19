import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AddCommentWidget extends StatelessWidget {
  AddCommentWidget({
    super.key,
  });

  RxBool isTyping = false.obs;
  var focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Obx(
        () => Container(
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
          child: isTyping.value ? _typingView() : _notTypingView(),
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
            child: Text(
              'Please follow community rules when commenting',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
            )),
        const SizedBox(
          height: 8.0,
        ),
        TextFormField(
          //focusNode: focusNode,
          onTap: () {
            log('on tapped');
          },
          decoration: InputDecoration(
            hintText: 'Add a comment',
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            border: InputBorder.none,
          ),
        )
      ],
    );
  }

  Widget _notTypingView() {
    return GestureDetector(
      onTap: () {

        log(isTyping.value.toString());
        isTyping.value = true;
        log(isTyping.value.toString());
        //focusNode.requestFocus();
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Text(
          'Add a Comment',
          style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
        ),
      ),
    );
  }
}
