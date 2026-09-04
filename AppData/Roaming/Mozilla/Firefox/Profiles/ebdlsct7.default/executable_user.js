/*
XefirY's custom user.js

Last update : 11/09/2025

Profiles directory : %AppData%\Mozilla\Firefox\Profiles
Documentation      : https://kb.mozillazine.org/About:config_entries
*/


//---------- Personnal preferences ----------//

user_pref("_xefiry_user.js.parrot", "The parrot sets the personnal preferences");

// Don't show "about:config" warning
user_pref("browser.aboutConfig.showWarning", false);

// Enable use of userChrome.css
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Enable Windows SSO (Single Sign-On)
// Source : https://support.mozilla.org/en-US/kb/windows-sso
user_pref("network.http.windows-sso.enabled", true);

// Preferred language for web pages
user_pref("intl.accept_languages", "en-gb,en");

// Sane URL bar
user_pref("browser.urlbar.trimURLs", false);
user_pref("browser.urlbar.decodeURLsOnCopy", true);

// Spell checker disabled - use LanguageTool extension instead
user_pref("layout.spellcheckDefault", 0);

// FIX - disable download "improvements"
//user_pref("browser.download.improvements_to_download_panel", false);

// FIX - allow selection of compact view
//user_pref("browser.compactmode.show", true);

// FIX - disable seperate private browsing window
user_pref("browser.privateWindowSeparation.enabled", false);


//---------- Downloads ----------//

// Don't forget to set Downloads > "Save files to" to Temp

// Always ask you where to save files
user_pref("browser.download.useDownloadDir", false);

// Ask whether to open or save files
user_pref("browser.download.always_ask_before_handling_new_types", true);


//---------- Security ----------//

user_pref("_xefiry_user.js.parrot", "The parrot increases security");

// Strict tracking protection
user_pref("browser.contentblocking.category", "strict");

// Enable HTTPS-Only mode in all windows
user_pref("dom.security.https_only_mode", true);

//user_pref("dom.event.clipboardevents.enabled", false);
user_pref("network.IDN_show_punycode", true);

// DNS over HTTPS (0 = Default, 2 = TRR-first, 3 = TRR-only, 5 = Disabled)
user_pref("network.trr.mode", 2);
// Set custom provider for DNS over HTTPS (quad 9)
user_pref("network.trr.uri", "https://dns.quad9.net/dns-query");
user_pref("network.trr.custom_uri", "https://dns.quad9.net/dns-query");
user_pref("network.trr.bootstrapAddress", "9.9.9.9");


//---------- Things to disable ----------//

user_pref("_xefiry_user.js.parrot", "The parrot disables some stuff");

// Disable "Always check if firefox is your default browser"
user_pref("browser.shell.checkDefaultBrowser", false);

// Disable "Recommend extensions as you browse"
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);

// Disable "Recommend features as you browse"
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

// Disable addons recommendations
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);

// Don't suggest strong password
user_pref("signon.generation.enabled", false);

// Disable peer connection
//user_pref("media.peerconnection.enabled", false);  // Disable for Discord calls

// Disable media controls overlay
//user_pref("media.hardwaremediakeys.enabled", false);

// Better autoplay blocking
// Source : https://support.mozilla.org/en-US/questions/1425872
user_pref("media.autoplay.default", 5);
user_pref("media.autoplay.blocking_policy", 2);

// Disable search suggestion
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.urlbar.suggest.searches", false);

// Disable Captive Portal test connection on startup
user_pref("network.captive-portal-service.enabled", false);

// Disable Network Connectivity checks
user_pref("network.connectivity-service.enabled", false);

// Disable mailto link management
user_pref("network.protocol-handler.external.mailto", false);

// Disable AI
user_pref("browser.ml.enable", false);
user_pref("browser.ml.chat.enabled", false);
user_pref("browser.ml.chat.menu", false);
user_pref("browser.ml.chat.page", false);
user_pref("browser.ml.chat.shortcuts", false);


//---------- Garbage to disable ----------//

user_pref("_xefiry_user.js.parrot", "The parrot disable some more stuff, mostly junk");

// Disable Pocket
user_pref("extensions.pocket.enabled", false);

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

// Disable studies (source : https://github.com/arkenfox/user.js/blob/master/user.js)
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");

// Disable crash reports (source : https://github.com/arkenfox/user.js/blob/master/user.js)
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);

// Disable Sponsored Top Sites
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned", "amazon,google");
user_pref("browser.newtabpage.blocked", "{\"BRX66S9KVyZQ1z3AIk0A7w==\":1,\"26UbzFJ7qT9/4DhodHKA1Q==\":1,\"4gPpjkxgZzXPVtuEoAL9Ig==\":1,\"eV8/WsSLxHadrTL1gAxhug==\":1,\"OPjKsY2+nKYne5FGvFanPA==\":1,\"T9nJot5PurhJSy8n038xGA==\":1}");
user_pref("browser.newtabpage.pinned", "[]");


//---------- The end ----------//

user_pref("_xefiry_user.js.parrot", "The parrot is done");
