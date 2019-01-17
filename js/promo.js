(function(){
    var promo = null;

    if(/reddit\.com\/r\/emacs/.test(document.referrer)){
        promo = "emacs";
    }else if(/reddit\.com\/r\/orgmode/.test(document.referrer)) {
        promo = "emacs";
    }else if(location.search === "?promo=emacs"){
        promo = "emacs";
    }

    if(!promo) return;
    window.localStorage.setItem("promo", promo);
})();
