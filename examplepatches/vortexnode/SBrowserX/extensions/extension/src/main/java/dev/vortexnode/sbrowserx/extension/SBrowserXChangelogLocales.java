package dev.vortexnode.sbrowserx.extension;

/**
 * Full 20-language localization for the One UI frosted-glass "What's New" dialog.
 * Supported: en, ru, uk, es, pt, de, fr, it, pl, tr, ar, fa, hi, zh, ja, ko, id, vi, nl, sw.
 */
final class SBrowserXChangelogLocales {
    private SBrowserXChangelogLocales() {}

    /**
     * Returns 11 localized strings:
     * [0] title, [1] hPromo, [2] promoBody,
     * [3] hAdded, [4] addedBody,
     * [5] hImproved, [6] improvedBody,
     * [7] hRemoved, [8] removedBody,
     * [9] cbText, [10] scrollHint
     */
    static String[] get(String lang) {
        if (lang == null) lang = "en";
        switch (lang) {
            case "ru": return new String[] {
                "Что нового в SBrowserX",
                "★ Рекомендация: подключите Gemini API",
                "Настоятельно рекомендуем открыть «Настройки → Ассистент по просмотру», создать бесплатный ключ Gemini API в Google AI Studio, вставить его в поле ключа и выбрать Gemini 3.5 Flash-Lite основным движком переводчика. Это даст самый быстрый и точный перевод с пониманием контекста и сразу включит ИИ-сводку страниц.",
                "Что добавлено",
                "• Новые движки перевода: Bing (по умолчанию), Яндекс, DeepL API и Gemini 3.5 Flash-Lite (AI).\n"
                + "• Полная поддержка языка приложения (Per-App Language) и локализация на топ-20 мировых языков (включая окно «Что нового»).\n"
                + "• Сетка ярлыков стартовой страницы (4 или 5 колонок) и заполнение плитки иконкой в стиле Quetta.\n"
                + "• Mate Translate добавлен в набор рекомендуемых расширений (теперь их 7).\n"
                + "• Одноразовая памятка переводчика в «Ассистенте по просмотру».",
                "Что улучшено и исправлено",
                "• Обновлён экран «Настройки SBrowserX»: единая верхняя карточка с синими подписями One UI, заголовок «Настройки SBrowserX» и нижняя карточка «О SBrowserX» / «Поддержать автора».\n"
                + "• Умные бирюзовые точки (в стиле Morphe): синхронизированы в главном меню и хабе, исчезают автоматически после просмотра.\n"
                + "• Стартовая страница: повышена стабильность запуска, обои и погода обновляются мгновенно без перезапуска.\n"
                + "• Переводчик: улучшен перевод на таких сайтах, как Google News, Reuters, Le Monde и GSMArena, доработана плавающая панель перевода и исправлена иконка в тёмной теме.",
                "Что удалено и защищено",
                "• Полностью отключён навязчивый промо-баннер «Сделать домашней страницей Samsung» в настройках.\n"
                + "• Скрыты лишние штатные пункты (блок конфиденциальности, «О Samsung Browser», Debug settings).\n"
                + "• Заблокирована установка несовместимых расширений Manifest V2 (.crx/.zip) с понятным предупреждением и рекомендацией uBlock Origin Lite (MV3).\n"
                + "• Удалён устаревший движок Microsoft Edge.",
                "Спасибо, всё понятно",
                "↓ Пролистайте список до конца"
            };
            case "uk": return new String[] {
                "Що нового в SBrowserX",
                "★ Рекомендація: підключіть Gemini API",
                "Наполегливо рекомендуємо відкрити «Налаштування → Асистент перегляду», створити безкоштовний ключ Gemini API в Google AI Studio, вставити його в поле ключа та вибрати Gemini 3.5 Flash-Lite основним перекладачем. Це дасть найшвидший і найточніший переклад із розумінням контексту та одразу ввімкне ШІ-зведення сторінок.",
                "Що додано",
                "• Нові рушії перекладу: Bing (за замовчуванням), Яндекс, DeepL API та Gemini 3.5 Flash-Lite (AI).\n"
                + "• Повна підтримка мови додатка (Per-App Language) та локалізація на 20 світових мов.\n"
                + "• Сітка ярликів стартової сторінки (4 або 5 колонок) і заповнення плитки іконкою у стилі Quetta.\n"
                + "• Mate Translate додано до рекомендованих розширень (тепер їх 7).\n"
                + "• Одноразова пам'ятка перекладача в «Асистенті перегляду».",
                "Що покращено та виправлено",
                "• Оновлено екран «Налаштування SBrowserX»: єдина верхня картка з синіми підписами One UI, заголовок «Налаштування SBrowserX» і нижній блок «Про SBrowserX» / «Підтримати автора».\n"
                + "• Розумні бірюзові крапки (у стилі Morphe): синхронізовані в головному меню та хабі, зникають автоматично після перегляду.\n"
                + "• Стартова сторінка: підвищено стабільність запуску, шпалери й погода оновлюються миттєво без перезапуску.\n"
                + "• Перекладач: покращено переклад на таких сайтах, як Google News, Reuters, Le Monde та GSMArena, доопрацьовано плаваючу панель і виправлено іконку в темній темі.",
                "Що видалено та захищено",
                "• Повністю вимкнено промо-банер «Зробити домашньою сторінкою Samsung» у налаштуваннях.\n"
                + "• Приховано зайві штатні пункти (конфіденційність, «Про Samsung Browser», Debug settings).\n"
                + "• Заблоковано встановлення несумісних розширень Manifest V2 (.crx/.zip) із зрозумілим попередженням та рекомендацією uBlock Origin Lite (MV3).\n"
                + "• Видалено застарілий рушій Microsoft Edge.",
                "Дякую, все зрозуміло",
                "↓ Прогорніть список до кінця"
            };
            case "es": return new String[] {
                "Novedades en SBrowserX",
                "★ Consejo: conecta la API gratuita de Gemini",
                "Recomendamos abrir Ajustes → Asistente de navegación, crear una clave gratuita de Gemini API en Google AI Studio, pegarla en el campo correspondiente y elegir Gemini 3.5 Flash-Lite como traductor principal. Tendrás traducción rápida con contexto y resumen de páginas con IA.",
                "Novedades",
                "• Nuevos motores de traducción: Bing (predeterminado), Yandex, DeepL API y Gemini 3.5 Flash-Lite (IA).\n"
                + "• Soporte completo de idioma por aplicación (Per-App Language) y traducción a 20 idiomas.\n"
                + "• Cuadrícula de accesos directos en la página de inicio (4 o 5 columnas) y mosaicos de iconos completos estilo Quetta.\n"
                + "• Mate Translate añadido al paquete de extensiones recomendadas (ahora son 7).\n"
                + "• Guía rápida del traductor en el Asistente de navegación.",
                "Mejoras y correcciones",
                "• Ajustes de SBrowserX rediseñados con tarjeta superior unificada, acentos azules One UI y tarjeta de apoyo al autor.\n"
                + "• Puntos turquesa inteligentes (estilo Morphe): se sincronizan entre Ajustes y el Hub y desaparecen automáticamente al verlos.\n"
                + "• Página de inicio más estable, con actualización instantánea de fondos y clima sin reiniciar.\n"
                + "• Traductor mejorado en sitios como Google News, Reuters, Le Monde y GSMArena, barra flotante refinada e icono corregido en modo oscuro.",
                "Eliminado y protegido",
                "• Eliminado el banner promocional de la página de inicio de Samsung en Ajustes.\n"
                + "• Ocultados los menús innecesarios de fábrica (Privacidad, Acerca de Samsung Browser, Debug settings).\n"
                + "• Bloqueada la instalación de extensiones Manifest V2 incompatibles (.crx/.zip) con un aviso claro recomendando uBlock Origin Lite (MV3).\n"
                + "• Eliminado el antiguo motor de Microsoft Edge.",
                "Entendido, gracias",
                "↓ Desliza hasta el final para continuar"
            };
            case "pt": return new String[] {
                "Novidades no SBrowserX",
                "★ Dica: conecte a API gratuita do Gemini",
                "Recomendamos abrir Configurações → Assistente de navegação, criar uma chave gratuita da API Gemini no Google AI Studio, colar no campo e selecionar Gemini 3.5 Flash-Lite como tradutor principal. Você terá tradução rápida com contexto e resumo de páginas por IA.",
                "O que há de novo",
                "• Novos mecanismos de tradução: Bing (padrão), Yandex, DeepL API e Gemini 3.5 Flash-Lite (IA).\n"
                + "• Suporte completo ao idioma por aplicativo (Per-App Language) e interface em 20 idiomas.\n"
                + "• Grade de atalhos na página inicial (4 ou 5 colunas) e ícones preenchidos de borda a borda estilo Quetta.\n"
                + "• Mate Translate adicionado ao pacote de extensões recomendadas (agora 7).\n"
                + "• Guia rápido do tradutor no Assistente de navegação.",
                "Melhorias e correções",
                "• Configurações do SBrowserX redesenhadas com cartão superior unificado, destaques em azul One UI e seção Apoiar o autor.\n"
                + "• Pontos azul-turquesa inteligentes (estilo Morphe): sincronizados e limpos automaticamente após visualização.\n"
                + "• Página inicial mais estável, com atualização ao vivo de papel de parede e clima sem reiniciar.\n"
                + "• Tradução aprimorada em sites como Google News, Reuters, Le Monde e GSMArena, barra flutuante ajustada e ícone corrigido no modo escuro.",
                "Removido e protegido",
                "• Removido o banner promocional da página inicial da Samsung nas Configurações.\n"
                + "• Ocultadas opções desnecessárias de fábrica (Privacidade, Sobre o Samsung Browser, Debug settings).\n"
                + "• Bloqueada a instalação de arquivos Manifest V2 incompatíveis (.crx/.zip) com aviso claro recomendando uBlock Origin Lite (MV3).\n"
                + "• Removido o antigo tradutor Microsoft Edge.",
                "Obrigado, entendi",
                "↓ Role até o final para continuar"
            };
            case "de": return new String[] {
                "Neu in SBrowserX",
                "★ Tipp: Kostenlose Gemini-API verbinden",
                "Öffne Einstellungen → Browsing-Assistent, erstelle einen kostenlosen Gemini-API-Schlüssel in Google AI Studio, füge ihn ein und wähle Gemini 3.5 Flash-Lite als Hauptübersetzer. So erhältst du schnelle, kontextbezogene Übersetzungen und KI-Seitenzusammenfassungen.",
                "Neu hinzugefügt",
                "• Neue Übersetzungs-Engines: Bing (Standard), Yandex, DeepL API und Gemini 3.5 Flash-Lite (KI).\n"
                + "• Volle Unterstützung für App-Sprache (Per-App Language) und 20 Sprachen.\n"
                + "• Startseiten-Raster (4 oder 5 Spalten) und randlose Symbol-Kacheln im Quetta-Stil.\n"
                + "• Mate Translate zum Paket empfohlener Erweiterungen hinzugefügt (jetzt 7).\n"
                + "• Kurzanleitung für den Übersetzer im Browsing-Assistenten.",
                "Verbessert & behoben",
                "• Überarbeitete SBrowserX-Einstellungen mit vereinter oberer Karte, One-UI-Blauakzenten und Autor-unterstützen-Bereich.\n"
                + "• Intelligente türkise Punkte (Morphe-Stil): synchronisiert und automatisch entfernt, sobald gesehen.\n"
                + "• Zuverlässigerer Start der Startseite sowie sofortige Live-Aktualisierung von Hintergrundbild und Wetter ohne Neustart.\n"
                + "• Verbesserte Übersetzung auf Seiten wie Google News, Reuters, Le Monde und GSMArena, verfeinerte schwebende Leiste und korrigiertes Dunkelmodus-Symbol.",
                "Entfernt & geschützt",
                "• Samsung-Startseiten-Werbebanner aus den Einstellungen entfernt.\n"
                + "• Unnötige Standardmenüs ausgeblendet (Datenschutzblock, Über Samsung Browser, Debug settings).\n"
                + "• Inkompatible Manifest-V2-Erweiterungen (.crx/.zip) werden mit klarem Hinweis auf uBlock Origin Lite (MV3) blockiert.\n"
                + "• Veralteten Microsoft-Edge-Übersetzer entfernt.",
                "Alles klar, danke",
                "↓ Zum Fortfahren nach unten scrollen"
            };
            case "fr": return new String[] {
                "Nouveautés dans SBrowserX",
                "★ Conseil : connectez l'API gratuite Gemini",
                "Ouvrez Paramètres → Assistant de navigation, créez une clé API Gemini gratuite dans Google AI Studio, collez-la et choisissez Gemini 3.5 Flash-Lite comme traducteur principal. Vous profiterez d'une traduction rapide avec contexte et du résumé IA des pages.",
                "Nouveautés",
                "• Nouveaux moteurs de traduction : Bing (par défaut), Yandex, DeepL API et Gemini 3.5 Flash-Lite (IA).\n"
                + "• Prise en charge complète de la langue par application (Per-App Language) et 20 langues.\n"
                + "• Grille de raccourcis sur la page d'accueil (4 ou 5 colonnes) et tuiles d'icônes bord à bord façon Quetta.\n"
                + "• Mate Translate ajouté au pack d'extensions recommandées (7 au total).\n"
                + "• Guide rapide du traducteur dans l'Assistant de navigation.",
                "Améliorations et corrections",
                "• Paramètres SBrowserX repensés avec carte supérieure unifiée, accents bleus One UI et section Soutenir l'auteur.\n"
                + "• Points turquoise intelligents (style Morphe) : synchronisés et effacés automatiquement après consultation.\n"
                + "• Page d'accueil plus fiable avec mise à jour instantanée du fond d'écran et de la météo sans redémarrer.\n"
                + "• Traduction améliorée sur des sites comme Google News, Reuters, Le Monde et GSMArena, barre flottante affinée et icône corrigée en mode sombre.",
                "Supprimé et protégé",
                "• Suppression de la bannière promotionnelle de la page d'accueil Samsung dans les Paramètres.\n"
                + "• Masquage des menus d'origine inutiles (Confidentialité, À propos de Samsung Browser, Debug settings).\n"
                + "• Blocage des extensions Manifest V2 incompatibles (.crx/.zip) avec un dialogue clair recommandant uBlock Origin Lite (MV3).\n"
                + "• Suppression de l'ancien traducteur Microsoft Edge.",
                "Merci, c'est compris",
                "↓ Faites défiler jusqu'en bas pour continuer"
            };
            case "it": return new String[] {
                "Novità in SBrowserX",
                "★ Consiglio: collega l'API gratuita di Gemini",
                "Ti consigliamo di aprire Impostazioni → Assistente di navigazione, creare una chiave API Gemini gratuita in Google AI Studio, incollarla e scegliere Gemini 3.5 Flash-Lite come traduttore principale. Avrai traduzioni rapide contestuali e riassunti IA delle pagine.",
                "Novità",
                "• Nuovi motori di traduzione: Bing (predefinito), Yandex, DeepL API e Gemini 3.5 Flash-Lite (IA).\n"
                + "• Supporto completo per la lingua dell'app (Per-App Language) e interfaccia in 20 lingue.\n"
                + "• Griglia di collegamenti nella pagina iniziale (4 o 5 colonne) e riquadri con icone a tutto schermo stile Quetta.\n"
                + "• Aggiunto Mate Translate al pacchetto di estensioni consigliate (ora 7).\n"
                + "• Guida rapida al traduttore in Assistente di navigazione.",
                "Miglioramenti e correzioni",
                "• Impostazioni SBrowserX ridisegnate con scheda superiore unificata, accenti blu One UI e sezione Supporta l'autore.\n"
                + "• Indicatori turchesi intelligenti (stile Morphe): sincronizzati e rimossi automaticamente dopo la visualizzazione.\n"
                + "• Pagina iniziale più affidabile con aggiornamento live di sfondo e meteo senza riavviare.\n"
                + "• Traduzione migliorata su siti come Google News, Reuters, Le Monde e GSMArena, barra flottante rifinita e icona corretta in modalità scura.",
                "Rimosso e protetto",
                "• Rimosso il banner promozionale della pagina iniziale Samsung dalle Impostazioni.\n"
                + "• Nascoste voci di sistema inutilizzate (Privacy, Info su Samsung Browser, Debug settings).\n"
                + "• Bloccata l'installazione di estensioni Manifest V2 incompatibili (.crx/.zip) con un avviso chiaro che consiglia uBlock Origin Lite (MV3).\n"
                + "• Rimosso il vecchio traduttore Microsoft Edge.",
                "Grazie, capito",
                "↓ Scorri fino in fondo per continuare"
            };
            case "pl": return new String[] {
                "Nowości w SBrowserX",
                "★ Wskazówka: podłącz darmowe API Gemini",
                "Polecamy otworzyć Ustawienia → Asystent przeglądania, utworzyć darmowy klucz Gemini API w Google AI Studio, wkleić go i wybrać Gemini 3.5 Flash-Lite jako główny tłumacz. Zyskasz szybkie tłumaczenie z kontekstem oraz podsumowania stron AI.",
                "Co nowego",
                "• Nowe silniki tłumaczenia: Bing (domyślny), Yandex, DeepL API oraz Gemini 3.5 Flash-Lite (AI).\n"
                + "• Pełne wsparcie języka aplikacji (Per-App Language) i interfejs w 20 językach.\n"
                + "• Siatka skrótów strony startowej (4 lub 5 kolumn) oraz kafelki wypełnione ikoną w stylu Quetta.\n"
                + "• Dodano Mate Translate do pakietu polecanych rozszerzeń (teraz 7).\n"
                + "• Krótki przewodnik tłumacza w Asystencie przeglądania.",
                "Ulepszenia i poprawki",
                "• Odświeżone Ustawienia SBrowserX ze wspólną górną kartą, niebieskimi akcentami One UI i sekcją Wesprzyj autora.\n"
                + "• Inteligentne turkusowe kropki (w stylu Morphe): zsynchronizowane i znikające automatycznie po obejrzeniu.\n"
                + "• Stabilniejsze uruchamianie strony startowej oraz natychmiastowe odświeżanie tapety i pogody bez restartu.\n"
                + "• Lepsze tłumaczenie na stronach takich jak Google News, Reuters, Le Monde i GSMArena, dopracowany pasek tłumaczenia i naprawiona ikona w trybie ciemnym.",
                "Usunięto i zabezpieczono",
                "• Usunięto baner promocyjny strony głównej Samsung z Ustawień.\n"
                + "• Ukryto zbędne opcje fabryczne (Prywatność, O Samsung Browser, Debug settings).\n"
                + "• Zablokowano instalację niekompatybilnych plików Manifest V2 (.crx/.zip) z czytelnym komunikatem zalecającym uBlock Origin Lite (MV3).\n"
                + "• Usunięto przestarzały tłumacz Microsoft Edge.",
                "Dzięki, rozumiem",
                "↓ Przewiń do końca, aby kontynuować"
            };
            case "tr": return new String[] {
                "SBrowserX Yenilikleri",
                "★ İpucu: Ücretsiz Gemini API bağlayın",
                "Ayarlar → Göz Atma Asistanı'nı açıp Google AI Studio'dan ücretsiz bir Gemini API anahtarı oluşturmanızı, alana yapıştırmanızı ve ana çevirmen olarak Gemini 3.5 Flash-Lite'ı seçmenizi öneririz. Bağlam duyarlı hızlı çeviri ve yapay zeka sayfa özeti hemen açılır.",
                "Yenilikler",
                "• Yeni çeviri motorları: Bing (varsayılan), Yandex, DeepL API ve Gemini 3.5 Flash-Lite (AI).\n"
                + "• Tam Uygulama Dili (Per-App Language) desteği ve 20 dilde arayüz.\n"
                + "• Başlangıç sayfası kısayol ızgarası (4 veya 5 sütun) ve Quetta tarzı tam dolu simge kutucukları.\n"
                + "• Önerilen uzantılar paketine Mate Translate eklendi (artık 7 uzantı).\n"
                + "• Göz Atma Asistanı'nda tek seferlik çevirmen rehberi.",
                "İyileştirmeler ve düzeltmeler",
                "• Tek üst kart, One UI mavi vurgular ve Yazarı Destekle kartıyla yenilenmiş SBrowserX ayarları.\n"
                + "• Akıllı turkuaz noktalar (Morphe tarzı): senkronize çalışır ve görüntülendikten sonra otomatik kaybolur.\n"
                + "• Daha kararlı Başlangıç Sayfası; duvar kağıdı ve hava durumu yeniden başlatmadan anında güncellenir.\n"
                + "• Google News, Reuters, Le Monde ve GSMArena gibi sitelerde gelişmiş çeviri, yenilenen çeviri çubuğu ve karanlık mod simge düzeltmesi.",
                "Kaldırılanlar ve koruma",
                "• Ayarlardaki Samsung ana sayfa tanıtım afişi kaldırıldı.\n"
                + "• Kullanılmayan stok menüler gizlendi (Gizlilik bloğu, Samsung Browser Hakkında, Debug settings).\n"
                + "• Uyumsuz Manifest V2 (.crx/.zip) uzantıları uBlock Origin Lite (MV3) öneren net bir uyarıyla engellendi.\n"
                + "• Kullanımdan kalkan Microsoft Edge çevirmeni kaldırıldı.",
                "Teşekkürler, anladım",
                "↓ Devam etmek için en alta kaydırın"
            };
            case "ar": return new String[] {
                "الجديد في SBrowserX",
                "★ نصيحة: اربط مفتاح Gemini API المجاني",
                "ننصح بشدة بفتح الإعدادات ← مساعد التصفح، وإنشاء مفتاح Gemini API مجاني من Google AI Studio ولصقه، ثم اختيار Gemini 3.5 Flash-Lite كمترجم أساسي للحصول على ترجمة سريعة ودقيقة مع تلخيص الصفحات بالذكاء الاصطناعي.",
                "الميزات الجديدة",
                "• محركات ترجمة جديدة: Bing (افتراضي)، وYandex، وDeepL API، وGemini 3.5 Flash-Lite (AI).\n"
                + "• دعم كامل للغة التطبيق (Per-App Language) وترجمة الواجهة إلى 20 لغة عالمية.\n"
                + "• شبكة اختصارات الصفحة الرئيسية (4 أو 5 أعمدة) وأيقونات تملأ البطاقة بأسلوب Quetta.\n"
                + "• إضافة Mate Translate إلى حزمة الإضافات الموصى بها (أصبحت 7 إضافات).\n"
                + "• دليل سريع للمترجم داخل مساعد التصفح.",
                "التحسينات والإصلاحات",
                "• إعادة تصميم إعدادات SBrowserX ببطاقة علوية موحدة ولمسات One UI الزرقاء وبطاقة دعم المطور.\n"
                + "• نقاط فيروزية ذكية (بأسلوب Morphe): متزامنة وتختفي تلقائياً بعد المشاهدة.\n"
                + "• تشغيل أكثر استقراراً للصفحة الرئيسية مع تحديث فوري للخلفية والطقس دون إعادة تشغيل.\n"
                + "• تحسين الترجمة في مواقع مثل Google News وReuters وLe Monde وGSMArena مع تحسين شريط الترجمة وإصلاح الأيقونة في الوضع الداكن.",
                "ما تم إزالته وحمايته",
                "• إزالة إعلان تعيين صفحة Samsung الرئيسية من الإعدادات.\n"
                + "• إخفاء القوائم الأصلية غير المستخدمة (الخصوصية، حول Samsung Browser، إعدادات التصحيح).\n"
                + "• منع تثبيت إضافات Manifest V2 غير المتوافقة (.crx/.zip) مع رسالة واضحة توصي بـ uBlock Origin Lite (MV3).\n"
                + "• إزالة محرك ترجمة Microsoft Edge المتوقف.",
                "شكراً، فهمت",
                "↓ مرر للأسفل للمتابعة"
            };
            case "fa": return new String[] {
                "تازه‌های SBrowserX",
                "★ پیشنهاد: اتصال کلید رایگان Gemini API",
                "پیشنهاد می‌کنیم به تنظیمات ← دستیار مرور بروید، یک کلید رایگان Gemini API از Google AI Studio بسازید، وارد کنید و Gemini 3.5 Flash-Lite را به‌عنوان مترجم اصلی انتخاب کنید تا هم ترجمه سریع و دقیق و هم خلاصه‌سازی هوشمند صفحات فعال شود.",
                "ویژگی‌های جدید",
                "• موتورهای ترجمه جدید: Bing (پیش‌فرض)، Yandex، DeepL API و Gemini 3.5 Flash-Lite (هوش مصنوعی).\n"
                + "• پشتیبانی کامل از زبان اختصاصی برنامه (Per-App Language) و ترجمه به ۲۰ زبان دنیا.\n"
                + "• چیدمان شبکه میانبرهای صفحه شروع (۴ یا ۵ ستون) و پر شدن کامل کاشی با آیکون به سبک Quetta.\n"
                + "• افزودن Mate Translate به بسته افزونه‌های پیشنهادی (اکنون ۷ افزونه).\n"
                + "• راهنمای سریع مترجم در بخش دستیار مرور.",
                "بهبودها و رفع اشکال‌ها",
                "• بازطراحی تنظیمات SBrowserX با کارت بالایی یکپارچه، رنگ‌آمیزی آبی One UI و کارت حمایت از سازنده.\n"
                + "• نقطه‌های فیروزه‌ای هوشمند (سبک Morphe): همگام‌سازی‌شده و پاک‌شدن خودکار پس از مشاهده.\n"
                + "• پایداری بیشتر صفحه شروع و به‌روزرسانی زنده تصویر زمینه و آب‌وهوا بدون نیاز به راه‌اندازی مجدد.\n"
                + "• بهبود ترجمه در سایت‌هایی مانند Google News، Reuters، Le Monde و GSMArena، بهبود نوار شناور ترجمه و اصلاح آیکون در حالت تیره.",
                "حذف‌شده و محافظت‌شده",
                "• حذف بنر تبلیغاتی صفحه اصلی سامسونگ از تنظیمات.\n"
                + "• مخفی‌سازی گزینه‌های اضافی پیش‌فرض (بخش حریم خصوصی، درباره Samsung Browser، Debug settings).\n"
                + "• مسدودسازی نصب فایل‌های ناسازگار Manifest V2 (.crx/.zip) با پیام واضح و پیشنهاد uBlock Origin Lite (MV3).\n"
                + "• حذف مترجم ازکارافتاده Microsoft Edge.",
                "ممنون، متوجه شدم",
                "↓ برای ادامه تا انتها پیمایش کنید"
            };
            case "hi": return new String[] {
                "SBrowserX में नया क्या है",
                "★ सुझाव: मुफ़्त Gemini API जोड़ें",
                "सेटिंग्स → ब्राउज़िंग असिस्ट खोलें, Google AI Studio में मुफ़्त Gemini API कुंजी बनाएं, उसे पेस्ट करें और मुख्य अनुवादक के रूप में Gemini 3.5 Flash-Lite चुनें। इससे तेज़, सटीक अनुवाद और AI पेज सारांश तुरंत शुरू हो जाएगा।",
                "नया क्या है",
                "• नए अनुवाद इंजन: Bing (डिफ़ॉल्ट), Yandex, DeepL API और Gemini 3.5 Flash-Lite (AI)।\n"
                + "• Android Per-App Language का पूरा समर्थन और 20 विश्व भाषाओं में इंटरफ़ेस।\n"
                + "• स्टार्ट पेज शॉर्टकट ग्रिड (4 या 5 कॉलम) और Quetta-स्टाइल फुल-आइकन टाइल्स।\n"
                + "• अनुशंसित एक्सटेंशन पैक में Mate Translate जोड़ा गया (अब 7 एक्सटेंशन)।\n"
                + "• ब्राउज़िंग असिस्ट में अनुवादक के लिए त्वरित गाइड।",
                "सुधार और फ़िक्स",
                "• One UI नीले एक्सेंट, एकीकृत शीर्ष कार्ड और 'लेखक का समर्थन करें' कार्ड के साथ नया SBrowserX सेटिंग्स डिज़ाइन।\n"
                + "• स्मार्ट फ़िरोज़ी डॉट्स (Morphe शैली): सिंक किए गए और देखने के बाद अपने आप हट जाते हैं।\n"
                + "• स्टार्ट पेज अधिक स्थिर; वॉलपेपर और मौसम बिना रीस्टार्ट के तुरंत अपडेट होते हैं।\n"
                + "• Google News, Reuters, Le Monde और GSMArena जैसी साइटों पर बेहतर अनुवाद, परिष्कृत फ्लोटिंग बार और डार्क मोड आइकन फ़िक्स।",
                "हटाया गया और सुरक्षित",
                "• सेटिंग्स से Samsung होमपेज प्रमोशन बैनर हटाया गया।\n"
                + "• अनावश्यक स्टॉक मेनू छिपाए गए (गोपनीयता ब्लॉक, Samsung Browser के बारे में, Debug settings)।\n"
                + "• असंगत Manifest V2 (.crx/.zip) फ़ाइलों को uBlock Origin Lite (MV3) के सुझाव के साथ सुरक्षित रूप से रोका गया।\n"
                + "• बंद हो चुका Microsoft Edge अनुवादक हटाया गया।",
                "धन्यवाद, समझ गया",
                "↓ जारी रखने के लिए नीचे स्क्रॉल करें"
            };
            case "zh": return new String[] {
                "SBrowserX 更新内容",
                "★ 推荐：接入免费 Gemini API",
                "强烈建议打开「设置 → 浏览助手」，在 Google AI Studio 创建免费的 Gemini API 密钥并填入，将 Gemini 3.5 Flash-Lite 设为默认翻译引擎，即可获得快速准确的上下文翻译与 AI 网页摘要。",
                "新增功能",
                "• 新增翻译引擎：Bing（默认）、Yandex、DeepL API 与 Gemini 3.5 Flash-Lite（AI）。\n"
                + "• 完整支持应用独立语言（Per-App Language）及 20 种全球语言。\n"
                + "• 启动页快捷方式网格（4 列或 5 列）与 Quetta 风格铺满图标磁贴。\n"
                + "• 推荐扩展包新增 Mate Translate（现共 7 款扩展）。\n"
                + "• 在浏览助手中新增一次性翻译使用提示。",
                "优化与修复",
                "• 全新 SBrowserX 设置页：整合顶部卡片、One UI 蓝色摘要与支持作者卡片。\n"
                + "• 智能青色新功能提示点（Morphe 风格）：主设置与中心同步，查看后自动消除。\n"
                + "• 启动页更稳定，壁纸与天气更改即时生效，无需重启。\n"
                + "• 改进了 Google News、Reuters、Le Monde 和 GSMArena 等网站的翻译效果，优化浮动翻译栏并修复深色模式图标。",
                "移除与保护",
                "• 移除设置中的 Samsung 主页推广横幅。\n"
                + "• 隐藏多余的原厂菜单项（隐私区块、关于 Samsung Browser、Debug settings）。\n"
                + "• 拦截不兼容的 Manifest V2（.crx/.zip）扩展安装，并弹出清晰提示推荐使用 uBlock Origin Lite（MV3）。\n"
                + "• 移除已停用的 Microsoft Edge 翻译引擎。",
                "好的，知道了",
                "↓ 请滚动到底部以继续"
            };
            case "ja": return new String[] {
                "SBrowserX の新機能",
                "★ ヒント：無料の Gemini API を連携",
                "「設定 → ブラウジングアシスト」を開き、Google AI Studio で無料の Gemini API キーを作成して貼り付け、メイン翻訳に Gemini 3.5 Flash-Lite を選択するのがおすすめです。高速で自然な文脈翻訳と AI ページ要約が使えます。",
                "新機能",
                "• 新しい翻訳エンジン：Bing（デフォルト）、Yandex、DeepL API、Gemini 3.5 Flash-Lite（AI）。\n"
                + "• アプリごとの言語設定（Per-App Language）と 20 言語のローカライズに完全対応。\n"
                + "• スタートページのショートカットグリッド（4 列 / 5 列）と Quetta 風フルアイコンタイル。\n"
                + "• おすすめ拡張機能パックに Mate Translate を追加（全 7 種類）。\n"
                + "• ブラウジングアシストに翻訳ガイドを追加。",
                "改善と修正",
                "• SBrowserX 設定を刷新：統合トップカード、One UI ブルーアクセント、作者を支援カードを追加。\n"
                + "• スマートなティール色の新機能ドット（Morphe 風）：表示後に自動で消去。\n"
                + "• スタートページの安定性を向上し、壁紙と天気が再起動なしで即時反映。\n"
                + "• Google News、Reuters、Le Monde、GSMArena などの翻訳品質を向上し、フローティングバーとダークモードのアイコンを改善。",
                "削除と保護",
                "• 設定内の Samsung ホームページ宣伝バナーを削除。\n"
                + "• 不要な標準メニュー項目（プライバシー欄、Samsung Browser について、Debug settings）を非表示化。\n"
                + "• 非対応の Manifest V2（.crx/.zip）拡張機能をブロックし、uBlock Origin Lite（MV3）を案内。\n"
                + "• 廃止された Microsoft Edge 翻訳エンジンを削除。",
                "了解しました",
                "↓ 最後までスクロールして続行"
            };
            case "ko": return new String[] {
                "SBrowserX 새로운 기능",
                "★ 팁: 무료 Gemini API 연결하기",
                "설정 → 브라우징 어시스트에서 Google AI Studio의 무료 Gemini API 키를 발급받아 입력하고 기본 번역기로 Gemini 3.5 Flash-Lite를 선택해 보세요. 빠르고 자연스러운 문맥 번역과 AI 페이지 요약이 바로 활성화됩니다.",
                "새로운 기능",
                "• 새 번역 엔진 추가: Bing(기본), Yandex, DeepL API, Gemini 3.5 Flash-Lite(AI).\n"
                + "• 앱별 언어 설정(Per-App Language) 완벽 지원 및 20개 언어 현지화.\n"
                + "• 시작 페이지 바로가기 그리드(4열 또는 5열) 및 Quetta 스타일 아이콘 채우기 타일.\n"
                + "• 추천 확장 프로그램 팩에 Mate Translate 추가(총 7개).\n"
                + "• 브라우징 어시스트에 1회성 번역기 안내 추가.",
                "개선 및 수정",
                "• 통합 상단 카드, One UI 블루 강조, 개발자 후원 카드로 SBrowserX 설정 개편.\n"
                + "• 스마트 청록색 새 기능 점(Morphe 스타일): 확인하면 자동으로 사라짐.\n"
                + "• 시작 페이지 안정성 개선 및 재시작 없이 배경화면·날씨 실시간 반영.\n"
                + "• Google News, Reuters, Le Monde, GSMArena 등의 번역 품질 개선, 플로팅 번역 바 다듬기 및 다크 모드 아이콘 수정.",
                "제거 및 보호",
                "• 설정의 삼성 홈페이지 프로모션 배너 제거.\n"
                + "• 불필요한 기본 설정 항목 숨김(개인정보 블록, Samsung Browser 정보, Debug settings).\n"
                + "• 호환되지 않는 Manifest V2(.crx/.zip) 확장 설치를 차단하고 uBlock Origin Lite(MV3)를 안내.\n"
                + "• 지원 중단된 Microsoft Edge 번역기 제거.",
                "확인했어요",
                "↓ 계속하려면 끝까지 스크롤하세요"
            };
            case "id": return new String[] {
                "Yang Baru di SBrowserX",
                "★ Tips: Hubungkan Gemini API Gratis",
                "Buka Setelan → Asisten Penjelajahan, buat kunci Gemini API gratis di Google AI Studio, tempelkan, lalu pilih Gemini 3.5 Flash-Lite sebagai penerjemah utama. Anda akan mendapatkan terjemahan cepat sesuai konteks dan ringkasan halaman AI.",
                "Fitur Baru",
                "• Mesin terjemahan baru: Bing (default), Yandex, DeepL API, dan Gemini 3.5 Flash-Lite (AI).\n"
                + "• Dukungan penuh Bahasa per Aplikasi (Per-App Language) dan lokalisasi 20 bahasa.\n"
                + "• Kisi pintasan Halaman Awal (4 atau 5 kolom) dan ubin ikon penuh gaya Quetta.\n"
                + "• Mate Translate ditambahkan ke Paket Ekstensi Rekomendasi (kini 7 ekstensi).\n"
                + "• Panduan singkat penerjemah di Asisten Penjelajahan.",
                "Peningkatan & Perbaikan",
                "• Desain ulang Setelan SBrowserX dengan kartu atas terpadu, aksen biru One UI, dan kartu Dukung Penulis.\n"
                + "• Titik pirus pintar (gaya Morphe): tersinkronisasi dan hilang otomatis setelah dilihat.\n"
                + "• Halaman Awal lebih stabil dengan pembaruan wallpaper dan cuaca secara langsung tanpa restart.\n"
                + "• Terjemahan lebih baik di situs seperti Google News, Reuters, Le Monde, dan GSMArena, bilah mengambang diperhalus, dan ikon Mode Gelap diperbaiki.",
                "Dihapus & Dilindungi",
                "• Banner promosi beranda Samsung dihapus dari Setelan.\n"
                + "• Menu bawaan yang tidak terpakai disembunyikan (Privasi, Tentang Samsung Browser, Debug settings).\n"
                + "• Memblokir pemasangan file Manifest V2 (.crx/.zip) yang tidak kompatibel dengan rekomendasi uBlock Origin Lite (MV3).\n"
                + "• Penerjemah Microsoft Edge yang sudah dihentikan telah dihapus.",
                "Terima kasih, mengerti",
                "↓ Gulir ke bawah untuk melanjutkan"
            };
            case "vi": return new String[] {
                "Tính năng mới trên SBrowserX",
                "★ Mẹo: Kết nối Gemini API miễn phí",
                "Hãy mở Cài đặt → Trợ lý duyệt web, tạo khóa Gemini API miễn phí trên Google AI Studio, dán vào và chọn Gemini 3.5 Flash-Lite làm trình dịch chính để có bản dịch ngữ cảnh nhanh và tóm tắt trang bằng AI.",
                "Có gì mới",
                "• Công cụ dịch mới: Bing (mặc định), Yandex, DeepL API và Gemini 3.5 Flash-Lite (AI).\n"
                + "• Hỗ trợ đầy đủ ngôn ngữ riêng cho ứng dụng (Per-App Language) và 20 ngôn ngữ.\n"
                + "• Lưới lối tắt Trang bắt đầu (4 hoặc 5 cột) và ô biểu tượng tràn viền kiểu Quetta.\n"
                + "• Thêm Mate Translate vào Gói tiện ích đề xuất (tổng cộng 7 tiện ích).\n"
                + "• Hướng dẫn nhanh trình dịch trong Trợ lý duyệt web.",
                "Cải thiện & Sửa lỗi",
                "• Thiết kế lại Cài đặt SBrowserX với thẻ trên hợp nhất, điểm nhấn xanh One UI và mục Ủng hộ tác giả.\n"
                + "• Chấm xanh ngọc thông minh (kiểu Morphe): đồng bộ và tự động ẩn sau khi bạn đã xem.\n"
                + "• Trang bắt đầu ổn định hơn, cập nhật hình nền và thời tiết tức thì không cần khởi động lại.\n"
                + "• Cải thiện dịch trên các trang như Google News, Reuters, Le Monde và GSMArena, tinh chỉnh thanh dịch nổi và sửa biểu tượng chế độ tối.",
                "Đã gỡ bỏ & Bảo vệ",
                "• Xóa biểu ngữ quảng cáo trang chủ Samsung trong Cài đặt.\n"
                + "• Ẩn các mục gốc không cần thiết (Quyền riêng tư, Giới thiệu Samsung Browser, Debug settings).\n"
                + "• Chặn cài đặt tiện ích Manifest V2 (.crx/.zip) không tương thích kèm gợi ý uBlock Origin Lite (MV3).\n"
                + "• Gỡ bỏ trình dịch Microsoft Edge đã ngừng hoạt động.",
                "Cảm ơn, đã hiểu",
                "↓ Cuộn xuống cuối để tiếp tục"
            };
            case "nl": return new String[] {
                "Nieuw in SBrowserX",
                "★ Tip: Koppel de gratis Gemini API",
                "Open Instellingen → Browsing-assistent, maak een gratis Gemini API-sleutel aan in Google AI Studio, plak deze en kies Gemini 3.5 Flash-Lite als hoofdvertaler. Je krijgt snelle, contextbewuste vertalingen én AI-paginasamenvattingen.",
                "Nieuw",
                "• Nieuwe vertaalengines: Bing (standaard), Yandex, DeepL API en Gemini 3.5 Flash-Lite (AI).\n"
                + "• Volledige ondersteuning voor app-taal (Per-App Language) en 20 wereldtalen.\n"
                + "• Snelkoppelingsraster op de startpagina (4 of 5 kolommen) en beeldvullende tegels in Quetta-stijl.\n"
                + "• Mate Translate toegevoegd aan de aanbevolen extensies (nu 7 extensies).\n"
                + "• Korte vertaalhandleiding in Browsing-assistent.",
                "Verbeterd & opgelost",
                "• Vernieuwde SBrowserX-instellingen met één bovenkaart, One UI blauwe accenten en Steun de auteur-kaart.\n"
                + "• Slimme turquoise stippen (Morphe-stijl): gesynchroniseerd en automatisch gewist zodra bekeken.\n"
                + "• Stabielere startpagina met directe live-updates voor achtergrond en weer zonder herstart.\n"
                + "• Verbeterde vertaling op sites zoals Google News, Reuters, Le Monde en GSMArena, verfijnde zwevende balk en gefixt donkere-modus-icoon.",
                "Verwijderd & beschermd",
                "• Promotiebanner voor de Samsung-startpagina verwijderd uit Instellingen.\n"
                + "• Overbodige standaardmenu's verborgen (Privacyblok, Over Samsung Browser, Debug settings).\n"
                + "• Incompatibele Manifest V2-bestanden (.crx/.zip) geblokkeerd met duidelijke aanbeveling voor uBlock Origin Lite (MV3).\n"
                + "• Verouderde Microsoft Edge-vertaler verwijderd.",
                "Bedankt, begrepen",
                "↓ Scroll naar beneden om door te gaan"
            };
            case "sw": return new String[] {
                "Mapya katika SBrowserX",
                "★ Kidokezo: Unganisha Gemini API ya Bure",
                "Fungua Mipangilio → Msaidizi wa Kuvinjari, tengeneza ufunguo wa bure wa Gemini API kwenye Google AI Studio, ubandike, kisha uchague Gemini 3.5 Flash-Lite kama mtafsiri mkuu ili kupata tafsiri ya haraka na muhtasari wa AI wa kurasa.",
                "Mapya",
                "• Injini mpya za tafsiri: Bing (chaguo-msingi), Yandex, DeepL API na Gemini 3.5 Flash-Lite (AI).\n"
                + "• Usaidizi kamili wa lugha ya programu (Per-App Language) na tafsiri za lugha 20 duniani.\n"
                + "• Gridi ya njia za mkato kwenye Ukurasa wa Mwanzo (safu 4 au 5) na vigae vya aikoni kamili mtindo wa Quetta.\n"
                + "• Mate Translate imeongezwa kwenye kifurushi cha viendelezi vinavyopendekezwa (sasa ni 7).\n"
                + "• Mwongozo mfupi wa mtafsiri katika Msaidizi wa Kuvinjari.",
                "Maboresho na marekebisho",
                "• Mipangilio ya SBrowserX imeboreshwa kwa kadi moja ya juu, rangi ya buluu ya One UI na sehemu ya Msaada kwa Mwandishi.\n"
                + "• Nukta janja za kijani-buluu (mtindo wa Morphe): husawazishwa na kufutika kiotomatiki baada ya kuonekana.\n"
                + "• Ukurasa wa Mwanzo thabiti zaidi na masasisho ya papo hapo ya mandhari na hali ya hewa bila kuanzisha upya.\n"
                + "• Tafsiri imeboreshwa kwenye tovuti kama Google News, Reuters, Le Monde na GSMArena, upau wa tafsiri umeboreshwa na aikoni ya Hali ya Giza imerekebishwa.",
                "Vilivyoondolewa na kulindwa",
                "• Bango la tangazo la ukurasa wa mwanzo wa Samsung limeondolewa kwenye Mipangilio.\n"
                + "• Menyu zisizohitajika zimefichwa (Faragha, Kuhusu Samsung Browser, Debug settings).\n"
                + "• Usakinishaji wa faili za Manifest V2 (.crx/.zip) zisizooana umezuiwa kwa ujumbe unaopendekeza uBlock Origin Lite (MV3).\n"
                + "• Mtafsiri wa zamani wa Microsoft Edge umeondolewa.",
                "Asante, nimeelewa",
                "↓ Sogeza chini kabisa ili kuendelea"
            };
            default: return new String[] {
                "What's New in SBrowserX",
                "★ Tip: Connect Free Gemini API",
                "We strongly recommend opening Settings → Browsing Assist, creating a free Gemini API key in Google AI Studio, pasting it into the API key field, and selecting Gemini 3.5 Flash-Lite as your primary translator. You'll get fast, context-aware translation plus AI Page Summary.",
                "What's new",
                "• New translation engines: Bing (default), Yandex, DeepL API, and Gemini 3.5 Flash-Lite (AI).\n"
                + "• Full Per-App Language support and natural translations across the top 20 world languages (including this 'What's New' window).\n"
                + "• Start Page shortcut grid (4 or 5 columns) and edge-to-edge Quetta-style icon tiles.\n"
                + "• Added Mate Translate to the Recommended Extensions Pack (now 7 extensions).\n"
                + "• One-time translator guide in Browsing Assist.",
                "Improved & fixed",
                "• Redesigned SBrowserX settings with a unified top card, One UI accent summaries, SBrowserX Settings header, and Support the Author card.\n"
                + "• Visibility-based teal dots (Morphe-style): synced across Main Settings and Hub, clearing automatically once seen.\n"
                + "• Start Page: improved startup reliability and instant live wallpaper & weather updates without restart.\n"
                + "• Translator: improved translation on sites such as Google News, Reuters, Le Monde, and GSMArena, refined the floating translation bar, and fixed the Dark Mode toolbar icon.",
                "Removed & protected",
                "• Removed the Samsung homepage promotion banner from Settings.\n"
                + "• Hid unused stock Settings entries (Privacy block, About Samsung Browser, Debug settings).\n"
                + "• Blocked incompatible Manifest V2 (.crx/.zip) installs with a clear One UI dialog recommending uBlock Origin Lite (MV3).\n"
                + "• Removed the discontinued Microsoft Edge translator.",
                "Thanks, got it",
                "↓ Scroll to the bottom to continue"
            };
        }
    }
}
