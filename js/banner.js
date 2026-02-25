(function() {
    // Find any banner on the screen (e.g. public interest notice, fundraising, etc
    // Figure out what the banners name is by looking for the ".banner--name__[NAME]" class
    // Use that name to record in localStorage if the user has dismissed the banner before
    // so we only show it if not yet dismissed.

    // In this function with side effects because we intentionally have a very strict CSP.
    const banners = document.querySelectorAll('.banner');
    Array.from(banners).forEach(function(banner) {
        const classWithName = banner.classList.values().find(function(className) {
            return className.startsWith('banner--name__');
        });
        const name = classWithName.replace('banner--name__', '');
        const storageKey = 'banner.' + name + '.hide';
        if (localStorage.getItem(storageKey)) {
            banner.style.display = 'none';
        } else {
            const close = document.querySelector('.banner--name__' + name + ' .banner--close');
            close.style.display = 'flex';
            close.addEventListener('click', function () {
                banner.style.display = 'none';
                localStorage.setItem('banner.' + name + '.hide', '1');
            });
        }
    });
})();
