App.extend({
    api: {
        urls: {},
        init_list: ["urls"],
        url: function (action) {
            return typeof this.urls[action] != "undefined" ? this.urls[action] : null;
        },

        callApi: function (method, url, data, headers) {
            if(!headers) headers = {};
           var apiUrl = this.url(url) || url;
            return App.axios(apiUrl, {
                method: method,
                data: data,
                dataType: "JSON",
                cookie: true,
                headers: headers
            })
        },
        upload: function(url, data, options){
            return App.axiosUpload(url, data, options);
        }
    }
});



var httpMethods = ["get", "post", "put", "patch", "delete", "head", "options"];


httpMethods.map(function (method) {
    var mt = method.toUpperCase();
    /**
     * gửi request dạng {mt} 
     * @param {string|option} url url hoặc option
     * @param {object|null|undefined} data tham số tùy chọn
     * @param {object|null|undefined} headers tham số tùy chọn
     */

    App.api[method] = function (url, data, headers) {
        return this.callApi(mt, url, data, headers);
    }
});


if (typeof window.apiInit == "function" || typeof window.custoAapiInit == "function") {
    if (typeof window.apiInit == "function") {
        window.apiInit();
    }
}

