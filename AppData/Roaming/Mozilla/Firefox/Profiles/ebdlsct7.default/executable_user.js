/*
Profiles directory : %AppData%\Mozilla\Firefox\Profiles
Documentation      : https://kb.mozillazine.org/About:config_entries
*/


//---------- Personnal preferences ----------//

// Don't show "about:config" warning
user_pref("browser.aboutConfig.showWarning", false);

// Open previous windows and tabs on start
user_pref("browser.startup.page", 3);

// Vertical tabs
user_pref("sidebar.verticalTabs", true);

// Show bookmark tab
user_pref("browser.toolbars.bookmarks.visibility", "always");

// Backup
user_pref("browser.backup.location", "D:\\Documents\\etc\\Restore Firefox");
user_pref("browser.backup.scheduled.enabled", true);

// Enable use of userChrome.css
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Enable Windows SSO (Single Sign-On)
// Source : https://support.mozilla.org/en-US/kb/windows-sso
user_pref("network.http.windows-sso.enabled", true);

// Languages
user_pref("intl.locale.requested", "en-GB,fr"); // UI
user_pref("intl.accept_languages", "en-gb,en,fr-fr,fr"); // web pages
user_pref("intl.regional_prefs.use_os_locales", true);

// Sane URL bar
user_pref("browser.urlbar.trimURLs", false);
user_pref("browser.urlbar.decodeURLsOnCopy", true);

// Spell checker disabled - use LanguageTool extension instead
user_pref("layout.spellcheckDefault", 0);

// FIX - disable seperate private browsing window
user_pref("browser.privateWindowSeparation.enabled", false);

//---------- Search ----------//

// Default search engine
user_pref("browser.urlbar.placeholderName", "DuckDuckGo");
user_pref("browser.urlbar.placeholderName.private", "DuckDuckGo");

// Search engine suggestions
user_pref("browser.search.suggest.enabled", false);

// Firefox Suggest
user_pref("browser.urlbar.suggest.engines", false);
user_pref("browser.urlbar.suggest.quickactions", false);
user_pref("browser.urlbar.suggest.recentsearches", false);
user_pref("browser.urlbar.suggest.quicksuggest.all", false);
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);

//---------- Downloads ----------//

// Don't forget to set Downloads > "Save files to" to Temp

// Always ask you where to save files
user_pref("browser.download.useDownloadDir", false);

// Save files to
user_pref("browser.download.folderList", 2);
user_pref("browser.download.dir", "C:\\Users\\xefiry\\AppData\\Local\\Temp");

// Ask whether to open or save files
user_pref("browser.download.always_ask_before_handling_new_types", true);


//---------- Security ----------//

// Strict tracking protection
user_pref("browser.contentblocking.category", "strict");

// Enable HTTPS-Only mode in all windows
user_pref("dom.security.https_only_mode", true);

user_pref("network.IDN_show_punycode", true);

// DNS over HTTPS (0 = Default, 2 = TRR-first, 3 = TRR-only, 5 = Disabled)
user_pref("network.trr.mode", 2);
// Set custom provider for DNS over HTTPS (quad 9)
user_pref("network.trr.uri", "https://dns.quad9.net/dns-query");
user_pref("network.trr.custom_uri", "https://dns.quad9.net/dns-query");
user_pref("network.trr.bootstrapAddress", "9.9.9.9");


//---------- Things to disable ----------//

// Disable "Always check if firefox is your default browser"
user_pref("browser.shell.checkDefaultBrowser", false);

// Disable recommendations
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);

// Disable Firefox Home items
user_pref("browser.newtabpage.activity-stream.widgets.weather.enabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredCheckboxes", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.widgets.sportsWidget.enabled", false);

// Don't suggest strong password
user_pref("signon.generation.enabled", false);

// Disable peer connection
user_pref("media.peerconnection.enabled", false);

// Better autoplay blocking
// Source : https://support.mozilla.org/en-US/questions/1425872
user_pref("media.autoplay.default", 5);
user_pref("media.autoplay.blocking_policy", 2);

// Disable Captive Portal test connection on startup
user_pref("network.captive-portal-service.enabled", false);

// Disable Network Connectivity checks
user_pref("network.connectivity-service.enabled", false);

// Disable mailto link management
user_pref("network.protocol-handler.external.mailto", false);

// Disable AI
user_pref("browser.ai.control.default", "blocked");
user_pref("browser.ml.enable", false);
user_pref("browser.ml.chat.enabled", false);
user_pref("browser.ml.chat.menu", false);
user_pref("browser.ml.chat.page", false);
user_pref("browser.ml.chat.shortcuts", false);
user_pref("browser.ml.linkPreview.enabled", false);
user_pref("browser.tabs.groups.smart.enabled", false);
user_pref("browser.translations.enable", false);
user_pref("extensions.ml.enabled", false);
user_pref("pdfjs.enableAltText", false);

// Disable autofill
user_pref("extensions.formautofill.creditCards.enabled", false);
user_pref("extensions.formautofill.addresses.enabled", false);

//---------- Garbage to disable ----------//

// Disable firefox relay
user_pref("signon.firefoxRelay.feature", false);

// Disable telemetry (source : https://github.com/arkenfox/user.js/blob/master/user.js)
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.coverage.endpoint.base", "");
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("datareporting.usage.uploadEnabled", false);

// Disable studies (source : https://github.com/arkenfox/user.js/blob/master/user.js)
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");

// Disable crash reports (source : https://github.com/arkenfox/user.js/blob/master/user.js)
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);
