//@license magnet:?xt=urn:btih:0b31508aeb0634b347b8270c7bee4d411b5d4109&dn=agpl-3.0.txt AGPL-v3

/**
 * Applies the colour theme picked with the theme chooser in the header.
 *
 * "auto" (the default) follows the operating system via prefers-color-scheme,
 * while "light" and "dark" set data-theme on <html> to force one of them.
 *
 * This is loaded synchronously from <head>, so the theme is applied before the
 * page is first painted. It is an external file because of the strict CSP.
 *
 * search.f-droid.org can't read this site's localStorage, so a forced theme is
 * also passed to it as the "theme" parameter of the search forms.
 */
(function() {
    var storageKey = 'theme';
    var root = document.documentElement;

    function getStoredTheme() {
        try {
            var theme = localStorage.getItem(storageKey);
            return theme === 'light' || theme === 'dark' ? theme : 'auto';
        } catch (e) {
            return 'auto';
        }
    }

    function applyTheme(theme) {
        if (theme === 'light' || theme === 'dark') {
            root.setAttribute('data-theme', theme);
        } else {
            root.removeAttribute('data-theme');
        }
    }

    function updateSearchForms(theme) {
        var inputs = document.querySelectorAll('input.search-theme');
        for (var i = 0; i < inputs.length; i++) {
            inputs[i].value = theme;
            // Disabled inputs are not submitted, so "auto" adds nothing to the URL.
            inputs[i].disabled = theme !== 'light' && theme !== 'dark';
        }
    }

    applyTheme(getStoredTheme());

    document.addEventListener('DOMContentLoaded', function() {
        updateSearchForms(getStoredTheme());

        var chooser = document.getElementById('theme-chooser-select');
        if (!chooser) {
            return;
        }

        chooser.value = getStoredTheme();
        // Hidden by default, as it can't do anything without JavaScript.
        chooser.hidden = false;

        chooser.onchange = function() {
            var theme = this.value;
            try {
                if (theme === 'auto') {
                    localStorage.removeItem(storageKey);
                } else {
                    localStorage.setItem(storageKey, theme);
                }
            } catch (e) {
                // Storage is unavailable, so the choice only lasts for this page.
            }
            applyTheme(theme);
            updateSearchForms(theme);
        };
    });
})();
// @license-end
