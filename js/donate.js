//@license magnet:?xt=urn:btih:0b31508aeb0634b347b8270c7bee4d411b5d4109&dn=agpl-3.0.txt AGPL-v3
document.addEventListener('DOMContentLoaded', function () {
    var el = document.getElementById('fdroid-download');
    el.onclick = function() {
        setTimeout( function(){ window.location.href = el.dataset.donateLink }, 5000);
    };
});
// @license-end
