import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';
import 'package:scaning/onboarding/widget/descriptio.dart';
import 'package:scaning/scaning/ui/screens/home.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Поехали',
      onFinish: () {
        Get.to(const HomeScreen());
      },
      finishButtonColor: kDarkBlueColor,
      skipTextButton: Text(
        'Скипнуть',
        style: TextStyle(
          fontSize: 16,
          color: kDarkBlueColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      controllerColor: kDarkBlueColor,
      totalPage: 5,
      headerBackgroundColor: boxColor,
      pageBackgroundColor: boxColor,
      background: [
        Image.asset(
          'assets/images/chel.png',
          height: 400,
        ),
        Image.asset(
          'assets/images/1.png',
          height: 400,
        ),
        const Icon(
          Icons.scanner,
          size: 400,
        ),
        const Icon(
          Icons.list_alt,
          size: 400,
        ),
        const Icon(
          Icons.delete_forever_outlined,
          size: 400,
        ),
      ],
      speed: 1.8,
      pageBodies: const [
        DescriptionOnboar(
            title1: 'Здравствуйте',
            title2:
                'Вас приветсвует flutter разработчик Адика и мини приложение для скана штрих-кода)'),
        DescriptionOnboar(
            title1: 'Штрих-код',
            title2:
                'Для сканирования штрих-кода, на главном экране нажмите на соотв-щую кнопку.После скана штрих-кода, заполните название товара и сохраните данные.'),
        DescriptionOnboar(
            title1: 'Сканирование',
            title2:
                'Сканирование подразумевает собой сканирование баркода который хранит в себе только целое число (количество товара), на все остальные данные стоит ограничение.'),
        DescriptionOnboar(
            title1: 'История',
            title2:
                'Для просмотра истории штрих-кода, на главном экране нажмите на соотв-щую кнопку.'),
        DescriptionOnboar(
            title1: 'Важно',
            title2:
                'Для удаления товара, в окне иcтория нажмите на соотв-щий товар, и выберите удалить. Так же можно удалить все товары нажав на корзинку. Удачи)'),
      ],
    );
  }
}
