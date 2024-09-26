import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'en', 'tr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ruText = '',
    String? enText = '',
    String? trText = '',
  }) =>
      [ruText, enText, trText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // OnboardingPage
  {
    '2y90169t': {
      'ru': 'Закажите поездку',
      'en': 'Book a ride',
      'tr': 'Seyahat rezervasyonu yapın',
    },
    '5gzzengp': {
      'ru': 'Быстрая подача машины от ближайшего водителя',
      'en': 'Fast delivery of a car from the nearest driver',
      'tr': 'En yakın sürücüden arabanın hızlı teslimatı',
    },
    'qnw2fiez': {
      'ru': 'Оплата USDT ',
      'en': 'USDT payment',
      'tr': 'Ödeme USDT\'si',
    },
    'obyl3gat': {
      'ru': 'Оплачивайте криптовалютой, быстро, надёжно и безопасно',
      'en': 'Pay with cryptocurrency, fast, reliable and safe',
      'tr':
          'Kripto para birimiyle hızlı, güvenilir ve güvenli bir şekilde ödeme yapın',
    },
    'd4hyh5er': {
      'ru': 'Легкий заказ',
      'en': 'Easy order',
      'tr': 'Kolay sipariş',
    },
    'r1t620oo': {
      'ru': 'Выберите машину и наслаждайтесь поездкой',
      'en': 'Choose a car and enjoy the ride',
      'tr': 'Bir araba seçin ve yolculuğun tadını çıkarın',
    },
    'sleodliv': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // HomePage
  {
    '4794zlzn': {
      'ru': 'Поиск нового заказа',
      'en': 'Search for a new order',
      'tr': 'Yeni bir sipariş arayın',
    },
    'cn6pktba': {
      'ru': 'Заказать такси',
      'en': 'Order a taxi',
      'tr': 'Taksi sipariş et',
    },
    'ztjzdawy': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // LanguagePage
  {
    'dy0xtuss': {
      'ru': 'Выберите язык',
      'en': 'Select language',
      'tr': 'Dil seçin',
    },
    's965m96i': {
      'ru': 'English',
      'en': 'English',
      'tr': 'English',
    },
    '0dbd9r0q': {
      'ru': 'Русский',
      'en': 'Русский',
      'tr': 'Русский',
    },
    '6vp47e4v': {
      'ru': 'Türkçe',
      'en': 'Türkçe',
      'tr': 'Türkçe',
    },
    'htkq4kba': {
      'ru': 'Далее',
      'en': 'Continue',
      'tr': 'Sonraki',
    },
    'abrk07pj': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // ChooseRolePage
  {
    'nqg9899d': {
      'ru': 'Кто Вы',
      'en': 'Who are you?',
      'tr': 'Sen kimsin',
    },
    'rwpdw9yo': {
      'ru': 'Определите вашу роль в приложении',
      'en': 'Define your role in the application',
      'tr': 'Uygulamadaki rolünüzü tanımlayın',
    },
    'h15osykw': {
      'ru': 'Я - Водитель',
      'en': 'I am a Driver',
      'tr': 'Ben Sürücüyüm',
    },
    'ib9w1nto': {
      'ru': 'Я - Пассажир',
      'en': 'I am a Passenger',
      'tr': 'Ben bir yolcuyum',
    },
    'hxctnvlp': {
      'ru': 'Уже есть учетная запись? ',
      'en': 'Already have an account?',
      'tr': 'Zaten bir hesabınız var mı?',
    },
    'no3vw06a': {
      'ru': 'Войти',
      'en': 'Login',
      'tr': 'Giriş yapmak',
    },
    '9t7zq7hg': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // RegistrationPage
  {
    'q43pzxjz': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'utyhm480': {
      'ru': 'E-mail',
      'en': 'E-mail',
      'tr': 'E-posta',
    },
    '1tp08tf7': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'udt25rgo': {
      'ru': 'Пароль',
      'en': 'Password',
      'tr': 'Şifre',
    },
    'izlglp18': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'v3qsup8f': {
      'ru': 'Повторить пароль',
      'en': 'Repeat password',
      'tr': 'Şifreyi tekrar girin',
    },
    'u79blbjy': {
      'ru': 'Подтверить e-mail',
      'en': 'Confirm email',
      'tr': 'E-posta Onayla',
    },
    'djpf697v': {
      'ru': 'Уже есть учетная запись? ',
      'en': 'Already have an account?',
      'tr': 'Zaten bir hesabınız var mı?',
    },
    'uowbfmgn': {
      'ru': 'Войти',
      'en': 'Login',
      'tr': 'Giriş yapmak',
    },
    '7gu2ndv4': {
      'ru': 'Регистрация',
      'en': 'Registration',
      'tr': 'Kayıt',
    },
    'etilj8ke': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // ConfirmEmailPage
  {
    'qugipkwl': {
      'ru': 'На ваш e-mail был отправлен код подтверждения',
      'en': 'A confirmation code has been sent to your e-mail.',
      'tr': 'E-postanıza bir onay kodu gönderildi',
    },
    'pzqs908m': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'ye93du14': {
      'ru': 'Введите код ',
      'en': 'Enter the code',
      'tr': 'Kodu girin',
    },
    '3rg5i50x': {
      'ru': 'Не получили код подтверждения? ',
      'en': 'Didn\'t receive your confirmation code?',
      'tr': 'Onay kodunuzu almadınız mı?',
    },
    '34w03y72': {
      'ru': 'Повторить',
      'en': 'Repeat',
      'tr': 'Tekrarlamak',
    },
    'lqm1d1j1': {
      'ru': '1',
      'en': '1',
      'tr': '1',
    },
    'nzedu6f5': {
      'ru': '2',
      'en': '2',
      'tr': '2',
    },
    'c2f80cql': {
      'ru': '3',
      'en': '3',
      'tr': '3',
    },
    'aso6t83j': {
      'ru': '4',
      'en': '4',
      'tr': '4',
    },
    '1n697cgj': {
      'ru': '5',
      'en': '5',
      'tr': '5',
    },
    't3soyfzb': {
      'ru': '6',
      'en': '6',
      'tr': '6',
    },
    '6vre76pf': {
      'ru': '7',
      'en': '7',
      'tr': '7',
    },
    '0uept2aq': {
      'ru': '8',
      'en': '8',
      'tr': '8',
    },
    'ls2zx8lp': {
      'ru': '9',
      'en': '9',
      'tr': '9',
    },
    'l1gxoixa': {
      'ru': '0',
      'en': '0',
      'tr': '0',
    },
    'fl7f14f8': {
      'ru': 'Код подтверждения',
      'en': 'Verification code',
      'tr': 'Doğrulama kodu',
    },
    'scnqd0d3': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // RegistrationTwoPage
  {
    'z33rtv2z': {
      'ru': 'Заполните личные данные',
      'en': 'Fill in your personal details',
      'tr': 'Kişisel bilgilerinizi girin',
    },
    'ek7q9oye': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    '0sgzenzc': {
      'ru': 'Имя',
      'en': '',
      'tr': '',
    },
    'k3bif3ie': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'ddp9cce5': {
      'ru': 'Фамилия',
      'en': '',
      'tr': '',
    },
    'yd79ehv7': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'glh2afdm': {
      'ru': 'Телефон',
      'en': '',
      'tr': '',
    },
    'mxm0r9bd': {
      'ru': 'Обязательное поле',
      'en': '',
      'tr': '',
    },
    '8cbifvt0': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
      'tr': '',
    },
    '9kxxd43c': {
      'ru': 'Обязательное поле',
      'en': '',
      'tr': '',
    },
    'kqd4ify1': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
      'tr': '',
    },
    'r9ie9q5s': {
      'ru': 'Обязательное поле',
      'en': '',
      'tr': '',
    },
    'yb6jyojz': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
      'tr': '',
    },
    'gafjcivv': {
      'ru': 'Далее',
      'en': 'Next',
      'tr': 'Sonraki',
    },
    'g3ntrkwq': {
      'ru': 'Личные данные',
      'en': 'Personal data',
      'tr': 'Kişisel bilgiler',
    },
    'bmdammez': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // RegistrationThreePage
  {
    'zq49mkbw': {
      'ru': 'Заполните данные авто',
      'en': 'Fill in the car details',
      'tr': 'Araç bilgilerinizi girin',
    },
    'fgijh3lx': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'rneks1ay': {
      'ru': 'Марка',
      'en': 'Brand',
      'tr': 'Marka',
    },
    'jlifqptx': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'fd2w14p6': {
      'ru': 'Модель',
      'en': 'Model',
      'tr': 'Modeli',
    },
    '1mdbwptk': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    '7i70la5a': {
      'ru': 'Год выпуска',
      'en': '',
      'tr': '',
    },
    'be666lbf': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    '0tjh1bf9': {
      'ru': 'Государственный номер',
      'en': 'Number',
      'tr': 'Sayı',
    },
    'p31t3nkr': {
      'ru': 'Обязательное поле',
      'en': 'Field is required',
      'tr': 'Alan gerekli',
    },
    'euxccjrz': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'lgd5pkda': {
      'ru': 'Обязательное поле',
      'en': 'Field is required',
      'tr': 'Alan gerekli',
    },
    'snerw7ox': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'an435hgu': {
      'ru': 'Обязательное поле',
      'en': 'Field is required',
      'tr': 'Alan gerekli',
    },
    '61w0oxgu': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'r3cdny1t': {
      'ru': 'Далее',
      'en': 'Next',
      'tr': 'Sonraki',
    },
    'vzhvo1hh': {
      'ru': 'Данные авто',
      'en': 'Car details',
      'tr': 'Araba verileri',
    },
    'grc54qai': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // LoginPage
  {
    'mkgcls4f': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    '8f5fd1sx': {
      'ru': 'E-mail',
      'en': 'E-mail',
      'tr': 'E-posta',
    },
    '4uwa8wye': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'xw4ygjs3': {
      'ru': 'Пароль',
      'en': 'Password',
      'tr': 'Şifre',
    },
    '4ewuv112': {
      'ru': 'Войти',
      'en': 'Login',
      'tr': 'Giriş yapmak',
    },
    'f5rltntk': {
      'ru': 'Нет учетной записи? ',
      'en': 'Don\'t have an account?',
      'tr': 'Hesabınız yok mu?',
    },
    'qgg351mw': {
      'ru': 'Создать аккаунт',
      'en': 'Create an account',
      'tr': 'Bir hesap oluşturun',
    },
    '2l36o4zy': {
      'ru': 'Войти',
      'en': 'Login',
      'tr': 'Giriş yapmak',
    },
    'tp88tjf6': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // Client8
  {
    '5lsxmev6': {
      'ru': 'Пожалуйста, выберите\nпричину отмены:',
      'en': 'Please select a reason for cancellation:',
      'tr': 'Lütfen seçin\niptal nedeni:',
    },
    'ln7nbyjh': {
      'ru': 'Попал в аварию',
      'en': 'Got into an accident',
      'tr': 'Bir kaza geçirdim',
    },
    'f95fqbvq': {
      'ru': 'Не могу связаться с водителем',
      'en': 'I can\'t contact the driver',
      'tr': 'Sürücüyle iletişim kuramıyorum',
    },
    '4gle58td': {
      'ru': 'Водитель опаздывает',
      'en': 'The driver is late',
      'tr': 'Sürücü geç kaldı',
    },
    'pgvsh8q4': {
      'ru': 'Цена не является разумной',
      'en': 'The price is not reasonable',
      'tr': 'Bu fiyat uygun değil',
    },
    'igk6x3b1': {
      'ru': 'Отправить',
      'en': 'Send',
      'tr': 'Göndermek',
    },
    'vhjk28fo': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // ChatPage
  {
    'wpf61r78': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'qh3lop0h': {
      'ru': 'Сообщение',
      'en': 'Message',
      'tr': 'Mesaj',
    },
    'd0b6l7ns': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // ProfilePage
  {
    'xj722yhu': {
      'ru': 'Уведомления',
      'en': 'Notifications',
      'tr': 'Bildirimler',
    },
    '7rewonap': {
      'ru': 'Для получения сообщений',
      'en': 'To receive messages',
      'tr': 'Mesaj almak için',
    },
    'ua9xfpbe': {
      'ru': 'Удалить аккаунт',
      'en': 'Delete account',
      'tr': 'Hesabı sil',
    },
    'cvqfyrmw': {
      'ru': 'Профиль',
      'en': 'Profile',
      'tr': 'Profil',
    },
    'p1oaslam': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // HistoryPage
  {
    '44yjhba9': {
      'ru': 'История поездок',
      'en': 'Travel history',
      'tr': 'Seyahat geçmişi',
    },
    '9rnvuwi4': {
      'ru': 'Отменена',
      'en': 'Cancelled',
      'tr': 'İptal edildi',
    },
    '4tsqh3j2': {
      'ru': 'A',
      'en': 'A',
      'tr': 'A',
    },
    '7h9jo930': {
      'ru': 'B',
      'en': 'B',
      'tr': 'B',
    },
    'bcytl0dv': {
      'ru': 'Отменена',
      'en': '',
      'tr': '',
    },
    'lck3ez2z': {
      'ru': 'A',
      'en': '',
      'tr': '',
    },
    '0cockyq2': {
      'ru': 'B',
      'en': '',
      'tr': '',
    },
    'qrfnuo24': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // BalancePage
  {
    'tllr0z7z': {
      'ru': 'Баланс и оплата',
      'en': 'Balance and payment',
      'tr': 'Bakiye ve ödeme',
    },
    'kz8q4tkn': {
      'ru': 'Баланс',
      'en': 'Balance',
      'tr': 'Denge',
    },
    'fs2ysyu7': {
      'ru': 'USDT',
      'en': 'USDT',
      'tr': 'USDT',
    },
    'h8ck0ntc': {
      'ru': 'История операций',
      'en': 'Operation history',
      'tr': 'Operasyon geçmişi',
    },
    '1vft3rxr': {
      'ru': 'Оплата поездок',
      'en': 'Payment for trips',
      'tr': 'Seyahat için ödeme',
    },
    'rpisvu9e': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // FundRequestPage
  {
    'aemdgfs0': {
      'ru': 'Заявка на вывод',
      'en': 'Withdrawal request',
      'tr': 'Para çekme talebi',
    },
    'htuj4niq': {
      'ru': 'Сумма:',
      'en': 'Sum:',
      'tr': 'Toplam:',
    },
    'weut1s4h': {
      'ru': 'Сеть:',
      'en': 'Net:',
      'tr': 'Açık:',
    },
    'et41qpgm': {
      'ru': 'Кошелек:',
      'en': 'Wallet:',
      'tr': 'Cüzdan:',
    },
    'jc8u4vkv': {
      'ru': 'Заявки на снятие',
      'en': 'Withdrawal requests',
      'tr': 'Para çekme talepleri',
    },
    'n1t49fvp': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // FaqPage
  {
    'rtoqcms4': {
      'ru': 'Аккаунт',
      'en': 'Account',
      'tr': 'Hesap',
    },
    'm3ix8s9l': {
      'ru': 'Разблокировать учетную запись',
      'en': 'Unlock account',
      'tr': 'Hesabın engellemesini kaldır',
    },
    'iwi8mtlp': {
      'ru': 'Разблокировать учетную запись',
      'en': 'Unlock account',
      'tr': 'Hesabın engellemesini kaldır',
    },
    '74utwbl0': {
      'ru':
          'Для консультации и заказа услуги по разблокировке аккаунта в GeoTax i -  свяжитесь с нами через раздел Обратная связь. ',
      'en': 'Lorem ipsum',
      'tr': 'Lorem ipsum',
    },
    'dbxneesr': {
      'ru': 'Сменить номер телефона',
      'en': 'Change phone number',
      'tr': 'Telefon numarasını değiştir',
    },
    'ez2kjs1l': {
      'ru': 'Сменить номер телефона',
      'en': 'Change phone number',
      'tr': 'Telefon numarasını değiştir',
    },
    'lxp0ihnz': {
      'ru':
          'Чтобы сменить номер телефона в вашем аккаунте, выполните следующие шаги:\n\n1. Войдите в приложение: Откройте приложение и войдите в свой аккаунт.\n\n2. Перейдите в настройки: Нажмите на иконку профиля или на меню, чтобы открыть настройки.\n\n3. Выберите \"Сменить номер телефона\": Найдите опцию \"Сменить номер телефона\" и выберите её.\n\n4. Введите новый номер: Введите свой новый номер телефона и подтвердите его.\n\n5. Подтверждение: Вам будет отправлено SMS с кодом подтверждения. Введите этот код, чтобы завершить процесс смены номера.\n\nЕсли у вас возникли проблемы с изменением номера телефона, пожалуйста, \nсвяжитесь с нашей службой поддержки По имейлу адресу infogeotaxi24@gmail.com для получения дополнительной помощи. ',
      'en': 'Lorem ipsum',
      'tr': 'Lorem ipsum',
    },
    'wun8up70': {
      'ru': 'Конфиденциальность',
      'en': 'Confidentiality',
      'tr': 'Gizlilik',
    },
    'tjynlicv': {
      'ru': 'Конфиденциальность',
      'en': 'Change phone number',
      'tr': 'Telefon numarasını değiştir',
    },
    'qtkbspgt': {
      'ru':
          'Мы понимаем, насколько важна конфиденциальность ваших данных, и принимаем все необходимые меры для их защиты. Вот как мы обеспечиваем безопасность вашей информации:\n\n1. Шифрование данных: Все ваши личные данные и транзакции шифруются с использованием современных технологий шифрования, что предотвращает несанкционированный доступ.\n\n2. Сбор минимально необходимых данных: Мы собираем только те данные, которые необходимы для предоставления наших услуг. Например, мы можем запрашивать ваше имя, номер телефона и адрес, чтобы обеспечить корректную работу приложения.\n\n3. Защита от утечек: Мы регулярно проводим проверки безопасности и обновляем наши системы, чтобы защитить вашу информацию от утечек и атак.\n\n4. Политика конфиденциальности: Ознакомьтесь с нашей Политикой конфиденциальности, чтобы узнать больше о том, какие данные мы собираем, как мы их используем и как вы можете управлять своей информацией.\n\n5. Доступ к данным: Вы имеете право на доступ к своим данным и можете запросить их изменение или удаление в любое время через раздел \"Настройки\" вашего аккаунта.\n\n6. Обучение сотрудников: Все наши сотрудники проходят обучение по вопросам конфиденциальности и безопасности данных, чтобы гарантировать, что ваша информация обрабатывается корректно и безопасно.\n\nЕсли у вас есть дополнительные вопросы или опасения по поводу конфиденциальности ваших данных, пожалуйста, свяжитесь с нашей службой поддержки по имейлу адресу infogeotaxi24@gmail.com для получения дополнительной помощи.',
      'en': 'Lorem ipsum',
      'tr': 'Lorem ipsum',
    },
    'kxu2vq2q': {
      'ru': 'Оплата',
      'en': 'Payment',
      'tr': 'Ödeme',
    },
    'ux3dk2t3': {
      'ru': 'Способ оплаты',
      'en': 'Payment method',
      'tr': 'Ödeme yöntemi',
    },
    'dgkw0vyw': {
      'ru': 'Способ оплаты',
      'en': 'Change phone number',
      'tr': 'Telefon numarasını değiştir',
    },
    '2kxpi0k6': {
      'ru':
          'В настоящее время наше такси приложение принимает только оплату в криптовалюте USDT (Tether). Вот несколько деталей, которые вам стоит знать:\n\n1. Удобство использования: USDT — это стейблкоин, привязанный к доллару США, что позволяет избежать резких колебаний цен, характерных для других криптовалют.\n\n2. Как произвести оплату: При заказе такси сумма будет автоматически рассчитана в USDT. Вы можете отправить нужное количество USDT на указанный адрес кошелька, который будет отображен в приложении во время оплаты.\n\n3. Комиссии: Обратите внимание, что могут применяться комиссии за транзакции в USDT, в зависимости от вашего провайдера кошелька или биржи. Пожалуйста, ознакомьтесь с условиями вашего сервиса для получения точной информации.\n\n4. Безопасность транзакций: Мы используем современные технологии для обеспечения безопасности всех транзакций в нашем приложении. Ваши средства и личные данные будут защищены.\n\n5. Планируемое расширение: Мы рассматриваем возможность добавления других способов оплаты в будущем. Следите за обновлениями в приложении, чтобы быть в курсе новых функций.\n\nЕсли у вас есть дополнительные вопросы по поводу оплаты или вы столкнулись с проблемами, не стесняйтесь обращаться в нашу службу поддержки по имейлу адресу infogeotaxi24@gmail.com для получения дополнительной помощи.',
      'en': 'Lorem ipsum',
      'tr': 'Lorem ipsum',
    },
    'sr48nyg2': {
      'ru': 'Оценка поездки',
      'en': 'Rating of the trip',
      'tr': 'Seyahat puanı',
    },
    'lk6oqcjg': {
      'ru': 'Оценка поездки',
      'en': 'Change phone number',
      'tr': 'Telefon numarasını değiştir',
    },
    'xd0mewul': {
      'ru':
          'После завершения поездки вы можете оценить качество сервиса и оставить отзыв о вашем опыте. Вот как это сделать:\n\n1. Завершение поездки: Когда ваша поездка завершится, вы увидите экран с информацией о поездке.\n\n2. Оценка: На этом экране будет предложено оценить поездку по шкале от 1 до 5 звезд. Выберите количество звезд, которое соответствует вашему опыту.\n\n3. Оставить отзыв: Под шкалой оценки вы можете оставить текстовый отзыв. Поделитесь своими впечатлениями о поездке, водителе и качестве обслуживания.\n\n4. Отправка оценки: После того как вы выберете оценку и, при желании, напишете отзыв, нажмите кнопку \"Отправить\". Ваш отзыв будет учтен и поможет нам улучшить качество сервиса.\n\n5. Анонимность: Ваши отзывы анонимны, и они используются исключительно для анализа качества обслуживания, поэтому не стесняйтесь быть честными.\n\nЕсли у вас возникли проблемы с оценкой поездки или если вы хотите сообщить о каком-либо инциденте, пожалуйста, свяжитесь с нашей службой поддержки по имейлу адресу infogeotaxi24@gmail.com для получения дополнительной помощи.',
      'en': 'Lorem ipsum',
      'tr': 'Lorem ipsum',
    },
    'ycg5zvgi': {
      'ru': 'Оплата за отмену поездки',
      'en': 'Trip Cancellation Fee',
      'tr': 'Gezi iptal ücreti',
    },
    'kv8joo1j': {
      'ru': 'Отмена поездки',
      'en': 'Change phone number',
      'tr': 'Telefon numarasını değiştir',
    },
    'l94zp1e6': {
      'ru':
          'Оплата за отмену поездки:\n\n1.Как я могу отменить поездку?\n *Вы можете отменить поездку в любое время до того, как водитель приедет.\n *В зависимости от времени отмены может взиматься комиссия.\n2.Когда я должен платить за отмену заказа?\n *Вы будете платить за отмену заказа, если вы отменяете его после того, как водитель принял ваш заказ.\n *Время, которое вам дается для отмены заказа бесплатно, может варьироваться в зависимости от вашего региона.\n3.Как рассчитывается плата за отмену заказа?\n *Размер платы за отмену заказа зависит от нескольких факторов, таких как местоположение, тип автомобиля и время ожидания водителя.\n4.Как я могу избежать платы за отмену заказа?\n *Вы можете избежать платы за отмену заказа, отменив его до того, как водитель примет ваш заказ.\n *Также, вы можете отменить заказ до истечения времени, которое вам дается для отмены заказа бесплатно.\n Если у вас есть дополнительные вопросы по поводу оплаты или вы столкнулись с проблемами, не стесняйтесь обращаться в нашу службу поддержки по имейлу адресу infogeotaxi24@gmail.com для получения дополнительной помощи.',
      'en': 'Lorem ipsum',
      'tr': 'Lorem ipsum',
    },
    'xd21cs79': {
      'ru': 'Оплата за повреждение',
      'en': 'Payment for damage',
      'tr': 'Hasar ödemesi',
    },
    '9n1t4hgu': {
      'ru': 'Повреждение',
      'en': 'Change phone number',
      'tr': 'Telefon numarasını değiştir',
    },
    'k9ljqhi0': {
      'ru':
          '1. В каких случаях я должен платить за повреждение?\n\n *Вы можете быть обязаны оплатить за повреждение, если вы повредили автомобиль во время поездки.\n *Например, если вы случайно пролили напиток на сиденье или разбили стекло. \n\n2. Как я могу избежать оплаты за повреждение?\n\n *Чтобы избежать оплаты за повреждение, старайтесь быть аккуратными во время поездки и не оставлять мусор в автомобиле.\n *Также, важно сообщать водителю о любом повреждении, которое вы заметили до начала поездки. \n\n3. Как рассчитывается плата за повреждение?\n\n *Плата за повреждение зависит от типа и степени повреждения. \n *В приложении вы можете найти информацию о конкретных тарифах.\n *Если вы не уверены в том, сколько вам нужно заплатить, вы можете обратиться в службу поддержки клиентов.\n\n4. Как я могу оплатить за повреждение?\n\n *Вы можете оплатить за повреждение с помощью USDT через приложение. \n *Инструкции по оплате будут предоставлены вам после завершения поездки. \n\nВажно: Если вы повредили автомобиль, вам необходимо связаться с водителем и с нашей службой поддержки клиентов по имейлу адресу infogeotaxi24@gmail.com, чтобы сообщить о повреждении.',
      'en': 'Lorem ipsum',
      'tr': 'Lorem ipsum',
    },
    'q4p8z9ms': {
      'ru': 'Цена выше, чем ожидалось',
      'en': 'The price is higher than expected',
      'tr': 'Fiyat beklenenden yüksek',
    },
    'wgdii5os': {
      'ru': 'Цены выше, чем ожидалось',
      'en': 'Change phone number',
      'tr': 'Telefon numarasını değiştir',
    },
    'dpuqz9mn': {
      'ru':
          '1. Почему цена моей поездки оказалась выше, чем я ожидал?\n\n *Стоимость поездки рассчитывается автоматически на основе нескольких факторов, таких как:\n *Расстояние: чем длиннее маршрут, тем дороже поездка.\n *Время: поездка в часы пик или в ночное время может быть дороже.\n *Тип автомобиля: выбор более комфортабельного автомобиля может увеличить стоимость поездки.\n *Дополнительные опции: например, если вы заказали детское кресло или помощь с багажом.\n *В редких случаях, может возникнуть ошибка в системе расчета стоимости.\n\n2. Как я могу проверить стоимость поездки до ее заказа?\n\n *Вы можете проверить предварительную стоимость поездки в приложении перед ее заказом.\n *Введите место назначения и выберите тип автомобиля, чтобы увидеть цену.\n\n3. Как я могу получить информацию о ценах на поездки?\n\n *В приложении вы можете найти подробную информацию о ценах на поездки, включая тарифы, основные факторы, влияющие на стоимость, и информацию о дополнительных опциях.\n\n4. Что делать, если я считаю, что цена моей поездки была завышена?\n\n*Если вы считаете, что цена вашей поездки была завышена, свяжитесь со службой поддержки клиентов. \n *Мы проверим информацию и, при необходимости, внесем коррективы в счет.',
      'en': 'Lorem ipsum',
      'tr': 'Lorem ipsum',
    },
    '9d56d6eo': {
      'ru': 'Помощь',
      'en': 'Help',
      'tr': 'Yardım',
    },
    'xzu39tt2': {
      'ru': 'Попал в аварию',
      'en': 'Got into an accident',
      'tr': 'Bir kaza geçirdim',
    },
    'he0zmrg9': {
      'ru': 'Я оставил предмет в машине',
      'en': 'I left the item in the car',
      'tr': 'Arabada bir eşya bıraktım',
    },
    '2dr0rh6v': {
      'ru': 'Частые вопросы',
      'en': 'Frequently asked questions',
      'tr': 'Sık sorulan sorular',
    },
    'prnj6m1q': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // FaqDetailPage
  {
    'rt92ee32': {
      'ru': 'Я оставил предмет в машине',
      'en': 'I left the item in the car',
      'tr': 'Arabada bir eşya bıraktım',
    },
    'op0hoghh': {
      'ru':
          'Если вы потеряли товар, вам нужно будет немедленно отправить нам сообщение, пожалуйста, не забудьте предоставить нам как можно больше подробностей о вашем потерянном товаре. Если мы его найдем, мы свяжем вас напрямую с водителем, чтобы вернуть его.',
      'en':
          'If you have lost an item, you will need to message us immediately, please be sure to give us as much detail as possible about your lost item. If we find it, we will contact you directly with the driver to return it.',
      'tr':
          'Bir eşyanızı kaybettiyseniz hemen bize mesaj göndermeniz gerekecektir; lütfen bize kayıp eşyanızla ilgili mümkün olduğunca fazla ayrıntı verdiğinizden emin olun. Eğer bulursak, iade etmek için sizinle doğrudan sürücüyle iletişime geçeceğiz.',
    },
    '40fr3ogy': {
      'ru': 'Расскажите нам',
      'en': 'Tell us',
      'tr': 'Bize söyle',
    },
    '3hv2b2wo': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'l2yog43x': {
      'ru': 'Сообщение...',
      'en': 'Message...',
      'tr': 'Mesaj...',
    },
    '8qf1xt8i': {
      'ru': 'Отправить',
      'en': 'Send',
      'tr': 'Göndermek',
    },
    'e15y5oo1': {
      'ru': 'Частые вопросы',
      'en': 'Frequently asked questions',
      'tr': 'Sık sorulan sorular',
    },
    'fz320yow': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // CarAccidentPage
  {
    '8dnazyhn': {
      'ru': 'Попал в аварию',
      'en': 'Got into an accident',
      'tr': 'Bir kaza geçirdim',
    },
    'xfpxb18r': {
      'ru':
          'Если вы попали в аварию, укажите данные поездки, и мы вернем вам деньги.',
      'en':
          'If you have an accident, please provide your trip details and we will refund your money.',
      'tr':
          'Bir kaza geçirirseniz seyahat bilgilerinizi verin, paranızı iade edelim.',
    },
    'eh49cg6a': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    '5u6jsx1x': {
      'ru': 'Дата',
      'en': 'Date',
      'tr': 'Tarih',
    },
    'yzgorvt3': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    '784mr6qy': {
      'ru': 'Время',
      'en': 'Time',
      'tr': 'Zaman',
    },
    '4o1k5jmh': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'ielvk9g5': {
      'ru': 'Место аварии',
      'en': 'Accident location',
      'tr': 'Kazanın yeri',
    },
    '390qb8q1': {
      'ru': 'Я получил травму',
      'en': 'I got injured',
      'tr': 'Yaralandım',
    },
    'lmjls6dg': {
      'ru': 'Я не пострадал',
      'en': 'I was not hurt',
      'tr': 'Yaralanmadım',
    },
    'ix1b0stn': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'somwnkxy': {
      'ru': 'Описание',
      'en': 'Description',
      'tr': 'Tanım',
    },
    'sijqb920': {
      'ru': 'Отправить',
      'en': 'Send',
      'tr': 'Göndermek',
    },
    'lsqysaa7': {
      'ru': 'Частые вопросы',
      'en': 'Frequently asked questions',
      'tr': 'Sık sorulan sorular',
    },
    'vvbafv3z': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // SupportPage
  {
    'oty343v4': {
      'ru': 'Поддержка',
      'en': 'Support',
      'tr': 'Destek',
    },
    'j0jzz2yb': {
      'ru': 'Часто задаваемые вопросы',
      'en': 'Frequently asked questions',
      'tr': 'Sıkça Sorulan Sorular',
    },
    'ak4z0oyz': {
      'ru': 'Предыдущие обращения',
      'en': 'Previous appeals',
      'tr': 'Önceki istekler',
    },
    '6fqhbzce': {
      'ru': 'Контакты',
      'en': 'Contacts',
      'tr': 'Kişiler',
    },
    'x7b5kefg': {
      'ru': 'Написать в поддержку',
      'en': 'Write to support',
      'tr': 'Desteğe yazın',
    },
    '8nhucpv3': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // NotificationsPage
  {
    '5h4ave2x': {
      'ru': 'Уведомления',
      'en': 'Notifications',
      'tr': 'Bildirimler',
    },
    'wa2v2kdw': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // HistoryDetailPage
  {
    '859iqv74': {
      'ru': 'История поездки',
      'en': 'Trip history',
      'tr': 'Seyahat geçmişi',
    },
    'ofo00dj4': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // SupportChat
  {
    'n6y98u6f': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'rw27pfd3': {
      'ru': 'Сообщение',
      'en': 'Message',
      'tr': 'Mesaj',
    },
    'igkdochn': {
      'ru': 'Поддержка',
      'en': 'Support',
      'tr': 'Destek',
    },
    'j9l0uwbz': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // FaqQuestionPage
  {
    'md0p1mv8': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // Client1
  {
    'i2qwaq2n': {
      'ru': 'Стандарт',
      'en': 'Standard',
      'tr': 'Standart',
    },
    '47gr4y9l': {
      'ru': '3 мин',
      'en': '3 min',
      'tr': '3 dakika',
    },
    '6x8jcbrc': {
      'ru': '1 USDT',
      'en': '1 USDT',
      'tr': '1 USDT',
    },
    '5x20xont': {
      'ru': 'Комфорт',
      'en': 'Comfort',
      'tr': 'Konfor',
    },
    '6g97qk05': {
      'ru': '5 мин',
      'en': '5 min',
      'tr': '5 dakika',
    },
    '7ldgnlrh': {
      'ru': '1 USDT',
      'en': '1 USDT',
      'tr': '1 USDT',
    },
    '5kl9k8tv': {
      'ru': 'VIP',
      'en': 'VIP',
      'tr': 'VIP',
    },
    'nt4sbw0g': {
      'ru': '13 мин',
      'en': '13 min',
      'tr': '13 dakika',
    },
    'wj4xob17': {
      'ru': '1 USDT',
      'en': '1 USDT',
      'tr': '1 USDT',
    },
    'xvdyqwlh': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // Client2
  {
    'bjlff6bq': {
      'ru': 'Поиск такси..',
      'en': 'Search for taxi',
      'tr': 'Taksi arama',
    },
    'fydrw0cz': {
      'ru': 'Отмена',
      'en': 'Cancel',
      'tr': 'İptal etmek',
    },
    'rla1k6f2': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // Client3
  {
    '5coj0bvh': {
      'ru': 'Написать водителю',
      'en': 'Write to the driver',
      'tr': 'Sürücüye yaz',
    },
    '3xvzn0k0': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // Client5
  {
    'yjxwi588': {
      'ru': 'Поездка закончена',
      'en': 'The trip is over',
      'tr': 'yolculuk bitti',
    },
    'axn8vvgq': {
      'ru': 'A',
      'en': 'A',
      'tr': 'A',
    },
    '45hp6kab': {
      'ru': 'B',
      'en': 'B',
      'tr': 'B',
    },
    'dsujn1pt': {
      'ru': 'Готово',
      'en': 'Ready',
      'tr': 'Hazır',
    },
    'e9mqjfnh': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // Client6
  {
    'hzzget8h': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // Client7
  {
    'jgvh0zjo': {
      'ru': 'Что-то пошло не так...',
      'en': 'Something went wrong...',
      'tr': 'Bir şeyler ters gitti...',
    },
    'dt6xmida': {
      'ru': 'К сожалению, в этом районе нет \nсвободных такси.',
      'en': 'Unfortunately, there are no taxis available in this area.',
      'tr': 'Maalesef yok \nücretsiz taksiler.',
    },
    'o0zmiq81': {
      'ru': 'Повторить поиск',
      'en': 'Repeat search',
      'tr': 'Aramayı tekrarla',
    },
    'r6641m3w': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // Driver1
  {
    '6w12c0tp': {
      'ru': 'Поиск заказов',
      'en': 'Search for orders',
      'tr': 'Siparişleri ara',
    },
    '0djj512e': {
      'ru': 'Отмена',
      'en': 'Cancel',
      'tr': 'İptal etmek',
    },
    'i1qr69br': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // Driver2
  {
    '42zqrz5l': {
      'ru': '1.2',
      'en': '1.2',
      'tr': '1.2',
    },
    'r5tibrmh': {
      'ru': 'A',
      'en': 'A',
      'tr': 'A',
    },
    'k4kjwzqe': {
      'ru': 'B',
      'en': 'B',
      'tr': 'B',
    },
    '3tz7v2nn': {
      'ru': 'Принять',
      'en': 'Accept',
      'tr': 'Kabul etmek',
    },
    'redpqhr0': {
      'ru': 'Пропустить',
      'en': 'Skip',
      'tr': 'Atlamak',
    },
    'o9nlzam0': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // Driver3
  {
    '9w5nrrqn': {
      'ru': 'У вас новое сообщение от клиента',
      'en': 'You have a new message from a client.',
      'tr': 'Bir müşteriden yeni bir mesajınız var',
    },
    'xb1q404z': {
      'ru': 'Ответить',
      'en': '',
      'tr': '',
    },
    'ho8kca2q': {
      'ru': 'A',
      'en': 'A',
      'tr': 'A',
    },
    'jcvxxymr': {
      'ru': 'Жду пассажира',
      'en': 'Waiting for a passenger',
      'tr': 'Bir yolcuyu bekliyorum',
    },
    'v2evww1c': {
      'ru': 'Забрал пассажира',
      'en': 'Picked up a passenger',
      'tr': 'Bir yolcu aldı',
    },
    '2yqw9efp': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // Driver6
  {
    '225st90t': {
      'ru': 'Вы уверены что хотите отменить заказ?',
      'en': 'Are you sure you want to cancel your order?',
      'tr': 'Siparişinizi iptal etmek istediğinizden emin misiniz?',
    },
    'vhdh844r': {
      'ru': 'Да',
      'en': 'Yes',
      'tr': 'Evet',
    },
    'ff24c6hf': {
      'ru': 'Нет',
      'en': 'No',
      'tr': 'HAYIR',
    },
    'aj6kmcya': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // Driver4
  {
    'jbz8moic': {
      'ru': 'B',
      'en': 'B',
      'tr': 'B',
    },
    'msf9fww1': {
      'ru': 'Завершить заказ',
      'en': 'Complete the order',
      'tr': 'Siparişi tamamla',
    },
    'i6nbpgbd': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // Driver5
  {
    'ac3fhg2c': {
      'ru': 'Заказ отменен пассажиром',
      'en': 'Order cancelled by passenger',
      'tr': 'Sipariş yolcu tarafından iptal edildi',
    },
    '14epaq1g': {
      'ru': 'Поиск нового заказа',
      'en': 'Search for a new order',
      'tr': 'Yeni bir sipariş arayın',
    },
    'arriftdc': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // Client4
  {
    'burb6pdp': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // ProfileEditPage
  {
    '6dez3rla': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'tny5vtfr': {
      'ru': 'E-mail',
      'en': 'E-mail',
      'tr': 'E-mail',
    },
    'bqogj24m': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    '2suniw33': {
      'ru': 'Телефон',
      'en': 'Telephone',
      'tr': 'Telefon',
    },
    'psrxjv68': {
      'ru': 'Field is required',
      'en': '',
      'tr': '',
    },
    'rwb34txh': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
      'tr': '',
    },
    'ixe8js0m': {
      'ru': 'Field is required',
      'en': 'Required field',
      'tr': 'Gerekli alan',
    },
    'f7ewmgao': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
      'tr': '',
    },
    '0h12thyb': {
      'ru': 'Обновить',
      'en': 'Refresh',
      'tr': 'Güncelleme',
    },
    '225tirmy': {
      'ru': 'Редактировать профиль',
      'en': 'Edit profile',
      'tr': 'Profili düzenle',
    },
    '4y0yrrv7': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // SupportRequestsPage
  {
    'w4ag8t8g': {
      'ru': 'Помощь',
      'en': 'Help',
      'tr': 'Yardım',
    },
    'dals1dsg': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // SupportRequestsPageCopy
  {
    'rcix4co2': {
      'ru': 'Тел.: +9876543211',
      'en': 'Phone: +9876543211',
      'tr': 'Telefon: +9876543211',
    },
    '4ivhw4ac': {
      'ru': 'E-mail: support@geodrive.com',
      'en': 'E-mail: support@geodrive.com',
      'tr': 'E-posta: support@geodrive.com',
    },
    'a0q25k4q': {
      'ru': 'Контакты',
      'en': 'Contacts',
      'tr': 'Kişiler',
    },
    'icnqu863': {
      'ru': 'Home',
      'en': '',
      'tr': '',
    },
  },
  // OnBoardingComponent
  {
    'fydzxjly': {
      'ru': 'Дальше',
      'en': 'Continue',
      'tr': 'Daha öte',
    },
  },
  // GetLocation
  {
    'tlchzek0': {
      'ru': 'Установите свое местоположение',
      'en': 'Set your location',
      'tr': 'Konumunuzu ayarlayın',
    },
    'q5qbmmp8': {
      'ru':
          'Включите общий доступ к местоположению, чтобы ваш водитель мог видеть, где вы находитесь',
      'en': 'Turn on location sharing so your driver can see where you are.',
      'tr':
          'Sürücünüzün nerede olduğunuzu görebilmesi için konum paylaşımını açın',
    },
    'lywgypga': {
      'ru': 'Определить',
      'en': 'Define',
      'tr': 'Tanımlamak',
    },
  },
  // CarArrivalModal
  {
    '7vpsx1be': {
      'ru': 'Такси ожидает вас',
      'en': 'Taxi is waiting for you',
      'tr': 'Taksi seni bekliyor',
    },
    'lp4t735n': {
      'ru': 'Выхожу',
      'en': 'I\'m going out',
      'tr': 'dışarı çıkıyorum',
    },
    'l9wrd71o': {
      'ru': 'Написать',
      'en': 'Write',
      'tr': 'Yazmak',
    },
  },
  // NoMessages
  {
    'ettqdgbd': {
      'ru': 'Нет сообщений',
      'en': 'No messages',
      'tr': 'Mesaj yok',
    },
  },
  // SideBar
  {
    'pvrgsl7m': {
      'ru': 'История поездок',
      'en': 'Travel history',
      'tr': 'Seyahat geçmişi',
    },
    'ejqgds74': {
      'ru': 'Уведомления',
      'en': 'Notifications',
      'tr': 'Bildirimler',
    },
    'qqwfy843': {
      'ru': 'Поддержка',
      'en': 'Support',
      'tr': 'Destek',
    },
    'oni92hdq': {
      'ru': 'Открыть смену',
      'en': 'Open shift',
      'tr': 'Açık vardiya',
    },
    'k6fdz4e1': {
      'ru': 'Закрыть смену',
      'en': 'Close shift',
      'tr': 'Vardiyayı kapat',
    },
    'jwpqcg85': {
      'ru': 'сменить роль',
      'en': 'change role',
      'tr': 'rolü değiştir',
    },
    '5qvsxtuk': {
      'ru': 'Выйти',
      'en': 'Log out',
      'tr': 'Oturumu kapat',
    },
  },
  // SingleHistoryRide
  {
    'e2dx0fqy': {
      'ru': 'A',
      'en': 'A',
      'tr': 'A',
    },
    'w9uq847e': {
      'ru': 'B',
      'en': 'B',
      'tr': 'B',
    },
    'i16718zs': {
      'ru': 'С кошелька',
      'en': 'From the wallet',
      'tr': 'Cüzdandan',
    },
    'g7y8fk63': {
      'ru': 'Написать в поддержку',
      'en': 'Write to support',
      'tr': 'Desteğe yazın',
    },
  },
  // MapToPageComponent
  {
    'esq6522z': {
      'ru': 'Отметить на карте',
      'en': '',
      'tr': '',
    },
  },
  // MapFromPageComponent
  {
    'u18t9xgi': {
      'ru': 'Отметить на карте',
      'en': '',
      'tr': '',
    },
  },
  // ClientBottomSheet
  {
    '3gjgjddg': {
      'ru': 'A',
      'en': 'A',
      'tr': 'A',
    },
    'v7oppyx9': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'nnyl1zmq': {
      'ru': 'Откуда поедем?',
      'en': 'Where are we going from?',
      'tr': 'Nereden gideceğiz?',
    },
    'ledi4zn4': {
      'ru': 'Карта',
      'en': 'Map',
      'tr': 'Harita',
    },
    'ggtm18hc': {
      'ru': 'B',
      'en': 'B',
      'tr': 'B',
    },
    'liyqlcd7': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'qj26n0uk': {
      'ru': 'Куда поедем?',
      'en': 'Where are we going?',
      'tr': 'Nereye gideceğiz?',
    },
    '63q8ctha': {
      'ru': 'Карта',
      'en': 'Map',
      'tr': 'Harita',
    },
    'smursx0f': {
      'ru': 'Заказать такси',
      'en': 'Find taxi',
      'tr': 'Taksi sipariş et',
    },
    '4ir99ck1': {
      'ru': 'Обязательное поле',
      'en': '',
      'tr': '',
    },
    '5zxo31k8': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
      'tr': '',
    },
    'kc7a9mog': {
      'ru': 'Обязательное поле',
      'en': '',
      'tr': '',
    },
    '0aaqppoy': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
      'tr': '',
    },
  },
  // LeaveReviewComponent
  {
    'ia4w98ae': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    '1swwv7bw': {
      'ru': 'Оставить комментарий',
      'en': 'Leave a comment',
      'tr': 'Yorum bırakın',
    },
    'urg37hap': {
      'ru': 'Обязательное поле',
      'en': 'Required field',
      'tr': 'Gerekli alan',
    },
    'ddg6teie': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
      'tr': '',
    },
    'j9ngoxm8': {
      'ru': 'Оценить поездку',
      'en': 'Rate this trip',
      'tr': 'Fiyat gezisi',
    },
  },
  // NothingFound
  {
    'gkzpavwe': {
      'ru': 'Ничего не найдено',
      'en': 'The list is empty',
      'tr': 'Liste boş',
    },
  },
  // LanguageAlert
  {
    'y9ybucn1': {
      'ru': 'Выберите язык',
      'en': '',
      'tr': '',
    },
    'qyi4daca': {
      'ru': 'English',
      'en': 'English',
      'tr': 'English',
    },
    'oygebwdk': {
      'ru': 'Русский',
      'en': 'Русский',
      'tr': 'Русский',
    },
    'gt4ya4ec': {
      'ru': 'Türkçe',
      'en': 'Türkçe',
      'tr': 'Türkçe',
    },
    'orttrxvx': {
      'ru': 'Закрыть',
      'en': 'Close',
      'tr': 'Kapalı',
    },
  },
  // Miscellaneous
  {
    'tkg8kmvy': {
      'ru': 'Label here...',
      'en': 'Label here...',
      'tr': 'Burayı etiketleyin...',
    },
    'u1ubn6nh': {
      'ru': 'Button',
      'en': 'Button',
      'tr': 'Düğme',
    },
    'e4uvjxzr': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'wq5qgktd': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    '0mqposq1': {
      'ru': 'Требуется доступ к вашей геолокации для  маршрутов',
      'en': '',
      'tr': '',
    },
    '2e9k5k3o': {
      'ru': 'Show your current location to the driver',
      'en': 'Show your current location to the driver',
      'tr': 'Mevcut konumunuzu sürücüye gösterin',
    },
    '6sc3e6bo': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'hnhl5ucw': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'pgsvbrn4': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'rmlflmee': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'sldx0ycx': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'fu40ecjy': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'rgtcrj29': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'xon9t3r8': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    '7em1i693': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    '5qw18tj1': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'st472ici': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'k45359nc': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    '6qulf3jo': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'kq9es4gn': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    '1tz1squp': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    '91wsxq0a': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'wo80vr4l': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    '608a5xft': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'yyta0hle': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'j7oecz8l': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'p1l1ujgz': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    '5sgyazwm': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'wtst26e6': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'fjc1pzf7': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    '0tgylqok': {
      'ru': '',
      'en': '',
      'tr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
