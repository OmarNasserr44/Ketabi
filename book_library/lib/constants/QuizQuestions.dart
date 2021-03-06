import 'package:book_library/GetX/GetX.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class QuestionsController extends GetxController {
  List<Map<String, Object>> questions = [
    {"": ''}
  ].obs;
  final categoryController = Get.find<ControllerGetX>();

  int increase = 1;

  assignQuestions() {
    if (categoryController.bookNameForQuiz == 'تلخيص أحكام الجنائز') {
      questions = [
        {
          'questionText':
              'يجب على المريض أن يوصي للأقربين الذين لا يرثون منه بمقدار',
          'answers': [
            {'text': 'بثلثي ماله', 'score': 0},
            {'text': 'ثلث أمواله', 'score': increase},
            {'text': 'شطر أمواله', 'score': 0},
            {'text': 'بكل أمواله', 'score': 0},
          ],
        },
        {
          'questionText': 'من الأمور الواجب عملها عند تلقين المحتضر؟',
          'answers': [
            {'text': 'قراءة سورة (يس) عنده', 'score': 0},
            {'text': 'توجيهه نحو القبلة', 'score': 0},
            {'text': 'التلقين ذكر الشهادة بحضرة الميت', 'score': 0},
            {'text': 'يلقنوه الشهادة', 'score': increase},
          ],
        },
        {
          'questionText': 'عند زيارة القبور؟',
          'answers': [
            {'text': 'لا يستحب زيارة النساء للقبور', 'score': 0},
            {
              'text': 'يجوز للنساء الإكثار من زيارة القبور والتردد عليها',
              'score': 0
            },
            {'text': 'لا يجوز زيارة قبر من مات على غير الإسلام', 'score': 0},
            {
              'text': 'تشرع زيارة القبور للاتعاظ بها وتذكر الآخرة',
              'score': increase
            },
          ],
        },
      ];
    } else if (categoryController.bookNameForQuiz == 'جلباب المرأة المسلمة') {
      questions = [
        {
          'questionText':
              'إذا كان بعض العلماء يرون أن في كشف المرأة عن وجهها مع سترها لما سواه من بدنها خطراً عليها فأن عليهم أمرين اثنين لا بد لهم من القيام بهما (أحدهما هو)',
          'answers': [
            {
              'text':
                  'أن يكتفوا من المسألة بإظهار الإنكار الشديد على من يخالفهم في الرأي',
              'score': 0
            },
            {'text': 'اتخاذ قرار بمنع دخول الكتاب إلى بلادهم', 'score': 0},
            {
              'text':
                  'أن يبتعدوا عن تربية هؤلاء الفتيات المسلمات بالتربية الإسلامية',
              'score': 0
            },
            {
              'text':
                  'أن يبينوا للناس حكم الله فيها مستدلين عليه بالكتاب والسنة',
              'score': increase
            },
          ],
        },
        {
          'questionText': 'من شروط الجلباب',
          'answers': [
            {'text': 'استيعاب جميع البدن مع ما استثني', 'score': 0},
            {'text': 'أن يكون زينة في نفسه', 'score': 0},
            {'text': 'ان يكون مبخراً مطيباً', 'score': 0},
            {'text': 'ألا يشبه لباس الكافرات', 'score': increase},
          ],
        },
        {
          'questionText': 'المقصود من شرط أن يكون لباس شهرة هو كل ثوب',
          'answers': [
            {'text': 'يقصد به الملابس النفيسة فقط', 'score': 0},
            {'text': 'يقصد به كل ثوب خسيس فقط', 'score': 0},
            {
              'text': 'هو كل ثوب يقصد به الاشتهار سواء كان نفيساً أو خسيساً',
              'score': increase
            },
            {
              'text': 'يقصد به الأثواب التي ألوانها تخالف ألوان ثياب الناس',
              'score': 0
            },
          ],
        },
      ];
    } else if (categoryController.bookNameForQuiz ==
        'جوع أبي هريرة رضي الله عنه دروس وفوائد') {
      questions = [
        {
          'questionText':
              'قال عمر والله لأن أكون أدخلتك أحب إلى من أن يكون لي حمر النعم. وفيه',
          'answers': [
            {
              'text':
                  'أسف عمر على ما فاته من حمل أبي ذر الغفاري إلى بيته وإطعامه',
              'score': 0
            },
            {
              'text':
                  'أسف عمر على ما فاته من حمل عثمان بن عفان إلى بيته وإطعامه',
              'score': 0
            },
            {'text': 'الحمر لون مذموم في الأبل فهي أقلها جلداً', 'score': 0},
            {'text': 'الحرص على أفعال البر', 'score': increase},
          ],
        },
        {
          'questionText':
              'قول أبي هريرة رضي الله عنه في الحديث (فاستقرأته آية) قيل هي من سورة؟',
          'answers': [
            {'text': 'البقرة', 'score': 0},
            {'text': 'النساءه', 'score': 0},
            {'text': 'آل عمران', 'score': increase},
            {'text': 'التوبة', 'score': 0},
          ],
        },
        {
          'questionText': 'اصطبغ الحديث بمبدأ الحوار',
          'answers': [
            {
              'text':
                  'من أوله مع عمر رضي الله عنه ثم انتهى مع النبي صلى الله عليه وسلم',
              'score': 0
            },
            {'text': 'من أوله مع النبي ثم انتهى مع عمر', 'score': 0},
            {
              'text': 'من أوله مع النبي ثم مع عمر وانتهى بالحوار مع النبيً',
              'score': 0
            },
            {
              'text': 'من أوله مع عمر ثم مع النبي وانتهى بالحوار مع عمر',
              'score': increase
            },
          ],
        },
      ];
    } else if (categoryController.bookNameForQuiz == 'صفة صلاة النبي') {
      questions = [
        {
          'questionText': 'عن ماذا كان يتحدث منهج الكتاب؟',
          'answers': [
            {'text': 'الكتاب تقيد بمذهب معين', 'score': 0},
            {'text': 'الكتاب هو بيان هدي النبي في الصلاة', 'score': increase},
            {
              'text': 'الكتاب هو بيان هدي النبي في الصلاة والصيام والحجً',
              'score': 0
            },
            {'text': 'الكتاب يشرح حياة الرسول', 'score': 0},
          ],
        },
        {
          'questionText': 'كان الرسول عليه الصلاة والسلام يصلي في السفر؟',
          'answers': [
            {'text': 'قائماً في الفرض والتطوع', 'score': 0},
            {'text': 'يصلي على راحلته النافلة', 'score': increase},
            {'text': 'يصلي جالساً', 'score': 0},
            {'text': 'يصلي على أقدامه حافياً', 'score': 0},
          ],
        },
        {
          'questionText': 'كل ما تقدم من صفة صلاته صلى الله عليه وسلم كان؟',
          'answers': [
            {'text': 'للرجال فقط', 'score': 0},
            {'text': 'يستوي فيه الرجال والنساء', 'score': increase},
            {'text': 'للرجال والأطفال دون سن البلوغ', 'score': 0},
            {
              'text': 'للرجال والذكور البالغين والفتيات دون سن البلوغ فقط',
              'score': 0
            },
          ],
        },
      ];
    } else if (categoryController.bookNameForQuiz ==
        'عشرون موقفا إيجابيا من الأحاديث النبوية الشريفة') {
      questions = [
        {
          'questionText':
              "عن أبي هريرة رضي الله عنه قال رسول الله صلى الله عليه وسلم:\nمن شهد الجنازة حتى يصلى عليها فله قيراط ومن شهدها حتى تدفن فله قيراطان قيل وما القيراطان؟ قال: مثل الجبلين العظيمين. من فوائد الحديث ",
          'answers': [
            {'text': 'الحث على فعل الخيرات', 'score': increase},
            {'text': 'السلام أعقبته البشرى العظيمة', 'score': 0},
            {
              'text': 'فضل من شهد الغزو مع النبي صلى الله عليه وسلمً',
              'score': 0
            },
            {
              'text': 'تقدير وإكرام عمر رضي الله عنه لأبناء السابقين الأولين',
              'score': 0
            },
          ],
        },
        {
          'questionText': '– الموقف الإيجابي الأول ينص على',
          'answers': [
            {'text': 'حرص أبي هريرة رضي الله عنه على تقديم الخير', 'score': 0},
            {'text': 'حرص عمر رضي الله عنه على تقديم الخير', 'score': 0},
            {
              'text': 'حرص أبي بكر الصديق رضي الله عنه على تقديم الخير',
              'score': 0
            },
            {
              'text': 'حرص أبي طلحة رضي الله عنه على تقديم الخيرً',
              'score': increase
            },
          ],
        },
        {
          'questionText':
              'عن محمد بن سيرين عن أبي هريرة رضي الله عنه قال: قال النبي صلى الله عليه وسلم:\nبينما كلب يطيف بركية كاد يقتله العطش إذ رأته بغي من بغايا بني إسرائيل فترعت موقها فسقته فغفر لها به. من فوائد الحديث',
          'answers': [
            {
              'text': 'وجوب نفقة البهائم المملوكة على مالكها',
              'score': increase
            },
            {'text': 'كان هم الصحابة السباق فيما يقربهم إلى االله', 'score': 0},
            {'text': 'المال عصب الحياة ومحبوب إلى النفس', 'score': 0},
            {
              'text': 'ضع لك هدفاً أو مجموعة من الأهداف لتحققها في حياتك',
              'score': 0
            },
          ],
        },
      ];
    } else if (categoryController.bookNameForQuiz ==
        'البنات والفيس قصص حقيقية') {
      questions = [
        {
          'questionText': 'ما هو تعريف السيبرسكس؟ ',
          'answers': [
            {'text': 'هي جمعية النهوض بالصحة الجنسية', 'score': 0},
            {'text': 'هي لقاء ثقافي سياسي عبر شبكة الكمبيوتر', 'score': 0},
            {
              'text': 'لقاء جنسي بين شخصين عبر شبكة الكمبيوتر',
              'score': increase
            },
            {
              'text':
                  'هو خليط من الصداقة والحب والدراسة عبر شبكة الكمبيوتر وبين الواقع',
              'score': 0
            },
          ],
        },
        {
          'questionText': 'من قواعد العلاقات العشرة؟ ',
          'answers': [
            {'text': 'كل العلاقات قابلة للتصنيف', 'score': 0},
            {'text': 'على الطرفين إن يحبان بعضهما قد بعض', 'score': 0},
            {'text': 'لا يمكن أن تتحول العلاقات القصيرة لحب', 'score': 0},
            {'text': 'الشغف هو الرابط الأقوى بين العلاقات', 'score': increase},
          ],
        },
        {
          'questionText':
              'هي في أواخر العشرينات خريجة آداب الإسكندرية وابنة مسؤولة كبيرة في جهاز رقابي، والدها طبيب بيطري فمن هي؟',
          'answers': [
            {'text': 'ه. أ', 'score': 0},
            {'text': 'س. ع', 'score': 0},
            {'text': 'م. ع', 'score': increase},
            {'text': 'أ. أ', 'score': 0},
          ],
        },
      ];
    } else if (categoryController.bookNameForQuiz == 'بنات الرياض') {
      questions = [
        {
          'questionText':
              '– تحدثت الكاتبة في مقدمة روايتها أن الرواية تتحدث عن؟',
          'answers': [
            {'text': 'عن الكاتبات والأديبات من الرياض', 'score': 0},
            {'text': 'قصة كفاح ونضال بنات الرياض', 'score': 0},
            {
              'text': 'عن الفضائح المحلية وأصخب السهرات الشبابية',
              'score': increase
            },
            {'text': 'قصص حب إسلامية ملتزمة', 'score': 0},
          ],
        },
        {
          'questionText':
              'وجدت ميشيل في فيصل كل ما كانت تبحث عنه في الرجل وأكبر دليل على ذلك',
          'answers': [
            {'text': 'سفرهما معاً إلى جزر القمر وزواجهما', 'score': 0},
            {
              'text': 'استمرار العلاقة بينهما لما يقارب العام',
              'score': increase
            },
            {'text': 'اعتناق ميشيل الإسلام لتستطيع الزواج من فيصل', 'score': 0},
            {
              'text': 'استمرار العلاقة بينهما لما يقارب الخمس سنوات',
              'score': 0
            },
          ],
        },
        {
          'questionText':
              'ماهي النهاية التي ظلت سديم تغمض عينيها عنها لثلاث سنوات ونصف السنة؟',
          'answers': [
            {'text': 'زواجها من فراس', 'score': 0},
            {'text': 'سفر فراس إلى أوروبا ليتابع دراسته العليا', 'score': 0},
            {
              'text': 'وفاة فراس بعد معاناته مع المرض منذ أربع سنوات',
              'score': 0
            },
            {'text': 'خطبة فراس لفتاة أخرى', 'score': increase},
          ],
        },
      ];
    } else if (categoryController.bookNameForQuiz ==
        'ذات الرداء الأخضر بالعربية') {
      questions = [
        {
          'questionText': 'بماذا أمرت الأم ابنتها الصغيرة؟',
          'answers': [
            {'text': 'أن تكف عن اللعب وتذهب للنوم', 'score': 0},
            {'text': 'أن تبدأ بدراستها', 'score': 0},
            {'text': 'أن تحمل الغداء وتذهب إلى جدتها', 'score': increase},
            {'text': 'أن تحمل الغداء وتذهب إلى أبيها', 'score': 0},
          ],
        },
        {
          'questionText':
              'ما هو الصوت الذي سمعته ذات الرداء الأخضر من داخل الحظيرة؟',
          'answers': [
            {'text': 'صوت حصان أبيها', 'score': 0},
            {'text': 'صوت صاحباتها', 'score': 0},
            {'text': 'لصان غريبان', 'score': increase},
            {'text': 'الفلاح صاحب الحظيرة', 'score': 0},
          ],
        },
        {
          'questionText': 'ماهي الهدية التي قدمها العمدة لذات الرداء الأخضر؟',
          'answers': [
            {'text': 'صندوق من الألعاب والدمى', 'score': 0},
            {'text': 'مجموعة من الثياب الحريرية', 'score': increase},
            {'text': 'مجموعة قصصية للأطفال', 'score': 0},
            {'text': 'حصان صغير (مهر)', 'score': 0},
          ],
        },
      ];
    } else if (categoryController.bookNameForQuiz == 'قصص البنات') {
      questions = [
        {
          'questionText':
              'في القصة الأولى كانت لبنت جامعية تبحث عن السعادة في الحب بدأت مصيبتها في؟',
          'answers': [
            {'text': 'التحاقها بالجامعة', 'score': 0},
            {'text': 'تقرب بعض الشباب منها', 'score': 0},
            {'text': 'اهتمامها بملابسها', 'score': 0},
            {
              'text': 'تكلمها مع شاب على الهاتف لساعات متأخرة من الليل',
              'score': increase
            },
          ],
        },
        {
          'questionText':
              'في القصة الثانية لبنت عفيفة تعرفت على صديقة متحررة كيف كان مدخل الشيطان في القصة؟',
          'answers': [
            {
              'text':
                  'اقناع الفتاة المتحررة للفتاة العفيفة بالسهر بالنوادي الليلية',
              'score': 0
            },
            {
              'text':
                  'اقناع الفتاة المتحررة للفتاة العفيفة بإنشاء حساب على الفيسبوك',
              'score': 0
            },
            {
              'text':
                  'إخبارها أنها ستكون عانس لأن هذه العلاقات مع الشباب هي سبب الزواج',
              'score': increase
            },
            {
              'text': 'اقناعها أن السعادة الحقيقية تكون في المعاكسات',
              'score': 0
            },
          ],
        },
        {
          'questionText': 'ما هو الطريق للسعادة الحقيقية لا الوهمية؟',
          'answers': [
            {'text': 'انتظري فتى أحلامك', 'score': 0},
            {'text': 'مشاهدة شاشات التلفاز والمسرحيات', 'score': 0},
            {'text': 'قراءة الكتب الغرامية', 'score': 0},
            {
              'text':
                  'تطهير شريحة محمولك من الشخصيات التي لا ترضي الله تعالى صحبتهن',
              'score': increase
            },
          ],
        },
      ];
    } else if (categoryController.bookNameForQuiz == 'يسمعون حسيسها') {
      questions = [
        {
          'questionText':
              'كان الطفل يجد مساحة للركض الساذج تعبيراً عن انطلاقات عفوية بين أشجار',
          'answers': [
            {'text': 'النخيل', 'score': 0},
            {'text': 'الصفصاف والسرو', 'score': increase},
            {'text': 'الكرز والتفاح', 'score': 0},
            {'text': 'التين والزيتون', 'score': 0},
          ],
        },
        {
          'questionText':
              'قسطنطين صروف الرجل العجيب العالم بالنحو كأنه سيبويه كان',
          'answers': [
            {'text': 'رأسمالي مسيحي', 'score': 0},
            {'text': 'شيوعي مسيحي', 'score': increase},
            {'text': 'بعثي إسلامي', 'score': 0},
            {'text': 'شيوعي إسلامي', 'score': 0},
          ],
        },
        {
          'questionText': 'كان خشان المسلمي زعيم عصابة في؟',
          'answers': [
            {'text': 'غسيل (تبيض) الأموال', 'score': 0},
            {'text': 'تجارة السلاح', 'score': 0},
            {'text': 'تجارة المخدرات', 'score': increase},
            {'text': 'تجارة الأعضاء البشرية', 'score': 0},
          ],
        },
      ];
    } else if (categoryController.bookNameForQuiz ==
        'كيفية الربح من الانترنت بطرق مجربة مجانية') {
      questions = [
        {
          'questionText': 'تعريف المدونة',
          'answers': [
            {'text': 'عبارة عن شبكة اجتماعية يستخدمها الشباب', 'score': 0},
            {
              'text': 'أداة تسويقية قوية تستخدمها الشركات والأفراد',
              'score': increase
            },
            {
              'text': 'عبارة عن سجلات لتدوين البيانات الإلكترونية الشخصية',
              'score': 0
            },
            {'text': 'موقع إلكتروني لتصفح الكتب العلمية', 'score': 0},
          ],
        },
        {
          'questionText': 'لتؤسس مملكتك في التدوين يجب',
          'answers': [
            {'text': 'ابتعد عن تثبيت إضافة مواضيع مشابهة', 'score': 0},
            {'text': 'ابتعد عن سؤال زوارك', 'score': 0},
            {
              'text':
                  'ان كنت صاحب مدونة جديدة يجب أن تبتعد وتحذر من تقديم نفسك لأصحاب المدونات الأقدم منك',
              'score': 0
            },
            {'text': 'وفر زر في المدونة وهو زر rss', 'score': increase},
          ],
        },
        {
          'questionText': 'ما هو برنامج جوجل أدسنس للناشرين',
          'answers': [
            {'text': 'برنامج عالمي يحقق أهداف إنسانية لا ربحية', 'score': 0},
            {'text': 'هو برنامج عالمي للتعامل مع الإعلانات', 'score': increase},
            {
              'text':
                  'برنامج يسمح باستخدام برامج البروكسي لتزويد الضغطات لتكسب المال الوفير أنت والشركة',
              'score': 0
            },
            {
              'text':
                  'برنامج يسمح لك بإنشاء ونقل وبيع موقعك وحسابك بمقابل مادي',
              'score': 0
            },
          ],
        },
      ];
    } else if (categoryController.bookNameForQuiz ==
        'كيفية انشاء مدونة على بلوجر وبدء التدوين') {
      questions = [
        {
          'questionText': 'لبدء مشروع ربحي على الأنترنت يفضل في البداية',
          'answers': [
            {'text': 'انشاء مدونة بلوجر مجانية', 'score': increase},
            {
              'text': 'إنشاء اميل على الجميل وحساب على جوجل بنفس الوقت',
              'score': 0
            },
            {'text': 'إنشاء حساب على غوغل كروم', 'score': 0},
            {'text': 'إنشاء حساب على تيك توك', 'score': 0},
          ],
        },
        {
          'questionText': 'الخطوة الأولى في انشاء مدونة مجانية على بلوجر هي',
          'answers': [
            {
              'text': 'ادخل على رابط مدونة بلوجر ثم اتبع التعليمات',
              'score': increase
            },
            {
              'text': 'ادخل اميلك الجديد وكلمة المرور في الخانة المخصصة',
              'score': 0
            },
            {'text': 'ابحث عن عبارة Create A Blog', 'score': 0},
            {'text': 'كتابة مقال في مدونة بلوجر ونشره', 'score': 0},
          ],
        },
        {
          'questionText':
              'عند إنشاء مدونة في بلوجر تتكلم عن هاتف أندرويد فأن عنوان المدونة',
          'answers': [
            {
              'text': 'يجب أن يكون رابط المدونة شبيه بأسماء الشركات الكبرى',
              'score': 0
            },
            {'text': 'Androidarabe.blogspot.com', 'score': increase},
            {'text': 'لا يمكن أضافة بعض اللواحق للرابط', 'score': 0},
            {'text': 'Android.blogspot.co', 'score': 0},
          ],
        },
      ];
    } else if (categoryController.bookNameForQuiz ==
        'عشرون قاعدة لتطوير ذاتك') {
      questions = [
        {
          'questionText':
              'أهم القواعد لبناء الذات وتغيير النفس والسمو بالروح إلى درجات عالية',
          'answers': [
            {'text': 'حدد هدفك', 'score': 0},
            {'text': 'اتصل بالله وجدد العلاقة معه', 'score': increase},
            {'text': 'استثمر وقتك', 'score': 0},
            {'text': 'لا تلتفت إلى الوراء', 'score': 0},
          ],
        },
        {
          'questionText':
              'تنص القاعدة السابعة على مبدأ استفد من أخطائك وفشلك وهذا يعني',
          'answers': [
            {
              'text':
                  'أن تجربة الخطأ هي بداية تصحيح المسار وأول درجة على سلم النجاح',
              'score': increase
            },
            {
              'text':
                  'تعني ان من أصيب بمصيبة فينبغي له أن ينظر إلى مصائب الاخرين فعندها تهون عليه مصيبته',
              'score': 0
            },
            {'text': 'انه غير مباح لك الفشل فهذا أمر غير مشروع', 'score': 0},
            {
              'text':
                  'تعني ان الإخفاق حقيقة من حقائق الحياة كما قال توماس إديسون',
              'score': 0
            },
          ],
        },
        {
          'questionText':
              'إذا نزل بلاء وحلت مصيبة فماذا يجب أن يكون تصرفك السليم اتجاه المشكلة؟',
          'answers': [
            {'text': 'تحاسب نفسك', 'score': 0},
            {'text': 'تحاول التكيف مع واقعك', 'score': increase},
            {'text': 'تنتظر من أحد أن ينتشلك', 'score': 0},
            {'text': 'تتأمل فيما حققه الآخرون وكيف وصلوا', 'score': 0},
          ],
        },
      ];
    } else if (categoryController.bookNameForQuiz ==
        'فقدان الثقة بالنفس -الاسباب- العلاج') {
      questions = [
        {
          'questionText': 'من أسباب فقدان الثقة بالنفس؟',
          'answers': [
            {'text': 'الانشغال بالنفس وترك الانشغال بالآخرين', 'score': 0},
            {'text': 'الصبر وتحمل الشدائد والصعاب', 'score': 0},
            {'text': 'الرضا بما كتبه الله تعالى على الإنسان', 'score': 0},
            {
              'text': 'البيئة المحيطة وأخطاء في التربية',
              'score': increase,
            }
          ],
        },
        {
          'questionText':
              'لتصبح إنساناً واثقاً من نفسك لا بد لك من تطبيق عدة أمور منها',
          'answers': [
            {'text': 'الانصياع والذوبان في الآخرين', 'score': 0},
            {'text': 'الانقياد إلى الآخرين', 'score': 0},
            {
              'text': 'حاول أن تصنع من الشراب المر شراباً حلو',
              'score': increase
            },
            {
              'text': 'ابتعد عن قراءة قصص العظماء وقراءة تاريخهم وسيرهم',
              'score': 0
            },
          ],
        },
        {
          'questionText': 'لعلاج فقدان الثقة بالنفس عليك؟',
          'answers': [
            {'text': 'غير من قناعاتك وأعد برمجة ذاتك', 'score': increase},
            {'text': 'لا تنشغل بإيقاظ قواك الخفية', 'score': 0},
            {
              'text': 'الحزن واليأس يصنعان فرص النجاح كما قال القرني',
              'score': 0
            },
            {
              'text':
                  'تذكر دائماً أن الحياة هي التي تتحكم فيك ولست أنت من يتحكم في حياتك',
              'score': 0
            },
          ],
        },
      ];
    } else if (categoryController.bookNameForQuiz ==
        'الدرعية نشأة وتطورا في عهد الدولة السعودية الأولى') {
      questions = [
        {
          'questionText':
              'بلغت الدولة السعودية وعاصمتها الدرعية أوج عظمتها في عهد؟',
          'answers': [
            {'text': 'الشيخ محمد بن عبد الوهاب', 'score': 0},
            {'text': 'الملك عبد العزيز بن متعب', 'score': 0},
            {'text': 'العالم سليمان بن علي', 'score': 0},
            {
              'text': 'الإمام سعود بن عبد العزيز',
              'score': increase,
            }
          ],
        },
        {
          'questionText':
              'كان موقف أشراف الحجاز من الحركة الإصلاحية النجدية منذ ظهورها؟',
          'answers': [
            {'text': 'كانوا حلفاء لهم', 'score': 0},
            {'text': 'سجنوا أتباعهم', 'score': increase},
            {'text': 'أفتى علماء بلادهم بإيمان صاحبها وصدقه', 'score': 0},
            {
              'text': 'كانوا أنصاراً لهم وساعدوهم على أداء الحج لسنين طويلة',
              'score': 0
            },
          ],
        },
        {
          'questionText': 'مسيرة الملك عبد العزيز لتوحيد البلاد كانت',
          'answers': [
            {'text': 'قصيرة وسهلة', 'score': 0},
            {'text': 'بدأ مسيرته بإمكانيات مادية كبيرة', 'score': 0},
            {'text': 'كانت طويلة ولكنها بدأت من فراغ', 'score': 0},
            {'text': 'استغرقت ربع قرن من الكفاح المستمر', 'score': increase},
          ],
        },
        {
          'questionText': 'انطلقت الدعوة الإصلاحية من',
          'answers': [
            {'text': 'مكة', 'score': 0},
            {'text': 'نجد', 'score': increase},
            {'text': 'القطيف', 'score': 0},
            {'text': 'الحجاز', 'score': 0},
          ],
        },
      ];
    } else if (categoryController.bookNameForQuiz == 'مدائن إسلامية سراييفو') {
      questions = [
        {
          'questionText': 'من سيزور المخيم؟',
          'answers': [
            {'text': 'وفداً من سكان سراييفو المغتربين', 'score': 0},
            {'text': 'وفداً من لجنة الإغاثة الإنسانية', 'score': increase},
            {'text': ' وفداً من مسجد عيسى بك إسحاقوفتش', 'score': 0},
            {
              'text': 'وفداً من قلعة فيشغراد',
              'score': 0,
            }
          ],
        },
        {
          'questionText': 'سراييفو هي عاصمة',
          'answers': [
            {'text': 'صربيا', 'score': 0},
            {'text': 'كرواتيا', 'score': 0},
            {'text': ' كوالالمبور', 'score': 0},
            {'text': 'البوسنة والهرسك', 'score': increase},
          ],
        },
        {
          'questionText':
              'ما هي إصابة زهيروفيتش بعد إصابته بإحدى طلقات الرصاص الوحشية؟',
          'answers': [
            {'text': 'فقد قدمه اليسرى', 'score': 0},
            {'text': 'فقد عينه اليسرى', 'score': 0},
            {'text': 'فقد كفه اليسرى', 'score': increase},
            {'text': 'فقد عينه اليمنى', 'score': 0},
          ],
        },
        {
          'questionText': 'ماهي الوثيقة العجيبة التي أخرجها زهيروفيتش للضيوف؟',
          'answers': [
            {'text': 'ورقة من نسخة قديمة للقرآن الكريم', 'score': 0},
            {'text': 'ورقة من ملحمة شعرية تسمى إكليل الجبل', 'score': increase},
            {'text': 'ورقة من دستور يوغسلافيا', 'score': 0},
            {
              'text': 'ورقة من بقايا الصحيفة التي تتحدث عن مسابقة للأطفال',
              'score': 0
            },
          ],
        },
      ];
    } else if (categoryController.bookNameForQuiz == 'التدخين قاتل الملايين') {
      questions = [
        {
          'questionText': 'تتألف أوراق التبغ اليابسة من عدة مكونات منها',
          'answers': [
            {
              'text': 'النيكوتين الذي يسبب النشوة التي تنسب للتدخين',
              'score': 0
            },
            {
              'text': 'أول أكسد الفحم الذي يؤدي إلى العقم عند الرجال',
              'score': 0
            },
            {
              'text': 'المواد البكتنية التي تؤثر على العينين واحمرارهما',
              'score': 0
            },
            {
              'text': 'الميوزين والأناباسين',
              'score': increase,
            }
          ],
        },
        {
          'questionText': 'من أضرار التدخين على القلب والجهاز الدوري',
          'answers': [
            {'text': 'ضعف الأعصاب', 'score': 0},
            {'text': 'الالتهاب الشعبي المزمن', 'score': 0},
            {'text': 'الإصابة بسرطان الرئة', 'score': 0},
            {'text': 'التهاب الشريان التاجي', 'score': increase},
          ],
        },
        {
          'questionText': 'كيف نواجه التدخين على المستوى الرسمي؟',
          'answers': [
            {'text': 'عدم تأجير المحلات التجارية لمن يبيع الدخان', 'score': 0},
            {
              'text':
                  'على أصحاب الأعمال أن يأمروا موظفيهم وعمالهم بترك التدخين',
              'score': 0
            },
            {
              'text': 'أقلل من التدخين يوماً بعد يوم حتى تقطعه بالكلية',
              'score': 0
            },
            {
              'text': 'السعي لمنع استيراد الدخان بشتى أنواعه',
              'score': increase
            },
          ],
        },
      ];
    } else if (categoryController.bookNameForQuiz ==
        'بحث عن المخدرات وأضرارها على الشباب والمجتمع') {
      questions = [
        {
          'questionText': 'من مراحل إدمان المخدرات مرحلة التحمل وهي',
          'answers': [
            {
              'text':
                  'المرحلة التي يتم فيها تناول المخدرات بقصد التعود بدون تحقيق نتائج نفسية أو عضوية',
              'score': 0
            },
            {
              'text':
                  'وهي المرحلة التي يتم فيها زيادة كبيرة في الجرعات التي يتم تناولها وذلك للوصول للنشوة المرجوة',
              'score': increase
            },
            {
              'text':
                  'وهي المرحلة التي يكون فيها المدمن قد وصل إلى مرحلة الاعتماد الكامل على المخدرات جسدياً ونفسياً',
              'score': 0
            },
            {
              'text': 'وهي مرحلة لا يستطيع المدمن أبداً الاستغناء عنها',
              'score': 0,
            }
          ],
        },
        {
          'questionText': 'من الأعراض الانسحابية للكوكايين',
          'answers': [
            {'text': 'أعراض تشبه البرد لمدة تتراوح إلى 5 أيام', 'score': 0},
            {
              'text':
                  'الاكتئاب والارتباك العصبي لمدة تتراوح من أسبوع على 10 أيام',
              'score': increase,
            },
            {'text': 'الانزعاج العصبي والارتباك واضطرابات النوم', 'score': 0},
            {'text': 'الارتعاش أو التشنجاتي', 'score': 0},
          ],
        },
        {
          'questionText':
              'المرحلة الأولى من خطوات العلاج من إصرار إدمان المخدرات',
          'answers': [
            {'text': 'مرحلة سحب السموم من الجسم', 'score': 0},
            {'text': 'مرحلة العلاج والتأهيل النفسي', 'score': 0},
            {'text': 'مرحلة المتابعة وعدم حدوث انتكاسة', 'score': 0},
            {'text': 'مرحلة التقييم', 'score': increase},
          ],
        },
      ];
    } else if (categoryController.bookNameForQuiz ==
        'تذكير البشر بفوائد النوم المبكر وأضرار السهر') {
      questions = [
        {
          'questionText': '– من أضرار السهر؟',
          'answers': [
            {'text': 'بالسهر تتجدد الخلايا الدماغية', 'score': 0},
            {
              'text': 'جعل الله النوم سباتاً يدركهم فيقطعهم عن الإدراك والنشاط',
              'score': 0
            },
            {'text': 'على المسلم أن يقوم أول الليل وينام آخرهً', 'score': 0},
            {
              'text': 'مخالفة السنة',
              'score': increase,
            }
          ],
        },
        {
          'questionText': 'من فوائد النوم؟',
          'answers': [
            {
              'text': 'سكون الجوارح وهضم الغذاء',
              'score': increase,
            },
            {
              'text': 'يورث الطحال',
              'score': 0,
            },
            {
              'text': 'يورث الأمراض الرطوبية والنوازل',
              'score': 0,
            },
            {
              'text': 'يفسد اللون',
              'score': 0,
            },
          ],
        },
        {
          'questionText': 'قيل في نوم النهار ثلاثة خلق وحرق وحمق. فالخلق هو',
          'answers': [
            {'text': 'نوم الضحى', 'score': 0},
            {'text': 'نومة الهاجرة', 'score': increase},
            {'text': 'نومة العصر', 'score': 0},
            {'text': 'ليس لها وقت محدد', 'score': 0},
          ],
        },
      ];
    }
  }
}
