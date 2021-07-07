function LOADJS(url) {
    if (!document.querySelector("script[src='"+url+"']")) {
        var $script = document.createElement("script");
        $script.setAttribute("src", url);
        document.body.appendChild($script);
        return new Promise(function(done, err){
            $script.onload = function() {
                done()
            }
        })
    }
    return Promise.resolve();
}
