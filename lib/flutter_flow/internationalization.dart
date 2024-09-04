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
    'nsjylwtr': {
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
    'e302v1f8': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'tinb2knd': {
      'ru': 'Имя',
      'en': 'Name',
      'tr': 'İsim',
    },
    'h731mfmj': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'tdhszuqh': {
      'ru': 'Фамилия',
      'en': 'Surname',
      'tr': 'Soyadı',
    },
    'owq1740x': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    'i3et8kkl': {
      'ru': 'Телефон',
      'en': 'Telephone',
      'tr': 'Telefon',
    },
    'psrxjv68': {
      'ru': 'Field is required',
      'en': 'Field is required',
      'tr': 'Alan gerekli',
    },
    'rwb34txh': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'n3wlgvro': {
      'ru': 'Field is required',
      'en': 'Field is required',
      'tr': 'Alan gerekli',
    },
    '37p2k85y': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'enltalc2': {
      'ru': 'Field is required',
      'en': 'Field is required',
      'tr': 'Alan gerekli',
    },
    'zca3szqv': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
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
    'be666lbf': {
      'ru': '',
      'en': '',
      'tr': '',
    },
    '0tjh1bf9': {
      'ru': 'Номер',
      'en': 'Number',
      'tr': 'Sayı',
    },
    'p31t3nkr': {
      'ru': 'Field is required',
      'en': 'Field is required',
      'tr': 'Alan gerekli',
    },
    'euxccjrz': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'lgd5pkda': {
      'ru': 'Field is required',
      'en': 'Field is required',
      'tr': 'Alan gerekli',
    },
    'snerw7ox': {
      'ru': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'an435hgu': {
      'ru': 'Field is required',
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
    'ivag97eg': {
      'ru': 'Неверный адрес поездки',
      'en': 'Invalid travel address',
      'tr': 'Geçersiz seyahat adresi',
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
    '99kct668': {
      'ru': 'Отмена',
      'en': 'Cancel',
      'tr': 'İptal etmek',
    },
    'j5fww5ko': {
      'ru': 'A',
      'en': 'A',
      'tr': 'A',
    },
    'swzqjuh4': {
      'ru': 'B',
      'en': 'B',
      'tr': 'B',
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
    'lmgvn2hf': {
      'ru': 'Пополнить',
      'en': 'Top up',
      'tr': 'Yükleme',
    },
    'h8ck0ntc': {
      'ru': 'История операций',
      'en': 'Operation history',
      'tr': 'Operasyon geçmişi',
    },
    'dxh3u81n': {
      'ru': 'Пополнение',
      'en': 'Replenishment',
      'tr': 'Yenileme',
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
      'ru': 'Lorem ipsum',
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
      'ru': 'Lorem ipsum',
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
      'ru': 'Lorem ipsum',
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
      'ru': 'Lorem ipsum',
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
      'ru': 'Lorem ipsum',
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
      'ru': 'Lorem ipsum',
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
      'ru': 'Lorem ipsum',
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
      'ru': 'Lorem ipsum',
      'en': 'Lorem ipsum',
      'tr': 'Lorem ipsum',
    },
    '9d56d6eo': {
      'ru': 'Помощь',
      'en': '',
      'tr': '',
    },
    'xzu39tt2': {
      'ru': 'Попал в аварию',
      'en': '',
      'tr': '',
    },
    'he0zmrg9': {
      'ru': 'Я оставил предмет в машине',
      'en': '',
      'tr': '',
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
    'xvdyqwlh': {
      'ru': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // Client2
  {
    'bjlff6bq': {
      'ru': 'Поиск такси',
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
    '3drkf7li': {
      'ru': 'Написать водителю',
      'en': 'Write to the driver',
      'tr': 'Sürücüye yaz',
    },
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
      'en': '',
      'tr': '',
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
      'en': '',
      'tr': '',
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
      'ru': 'Nothing found',
      'en': '',
      'tr': '',
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
