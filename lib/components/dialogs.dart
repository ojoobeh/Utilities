part of 'components.dart';

void customDialog({required List<Widget> items}) {
  dialog(SizedBox(
    height: Get.height,
    child: Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffe2e9f1),
        ),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => items[index].marginSymmetric(vertical: 8, horizontal: 8),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: items.length,
        ),
      ).marginSymmetric(horizontal: 32),
    ),
  ));
}
