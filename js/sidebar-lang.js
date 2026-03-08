//@license magnet:?xt=urn:btih:0b31508aeb0634b347b8270c7bee4d411b5d4109&dn=agpl-3.0.txt AGPL-v3

/**
 * When the user changes the language via the language drop down, redirect the user to the relevant translation.
 */
(function() {
    const chooser = document.getElementsByClassName("language-chooser-select")
    if (!chooser || chooser.length <= 0) { return; }

    // Fallback to English if none is selected
    let activeLang = chooser[0].value || 'en';
    const langExp = new RegExp(`^/${activeLang}(/|$)`);
   
    /*
     * If we are already on "/fr" and select "es", we don't want to redirect to
     * "/fr/es".  The apache docs website achieves this via AliasMatch in their
     * apache config, but that is not able to go into the .htaccess file and so
     * makes the deployment of the site more difficult. This solves the problem
     * in JavaScript.
    */
    function languageChange(e) {
        const newLang = e.target.value;
        const { pathname, search, hash } = window.location;
        const cleanPathName = pathname.replace(langExp, '/');
        window.location.href = `/${newLang}${cleanPathName}${search}${hash}`;
    }

    for (let i = 0; i < chooser.length; i++) {
        chooser[i].addEventListener('change', languageChange);
        console.log(chooser[i]);
    }
})();
// @license-end
