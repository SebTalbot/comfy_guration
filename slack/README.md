add this at the end of `/usr/lib/slack/resources/app.asar.unpacked/src/static/ssb-interop.js`

```javascript
document.addEventListener('DOMContentLoaded', function () {
    $.ajax({
        url: 'https://raw.githubusercontent.com/SebTalbot/comfy_guration/master/slack/theme.css',
        success: function (css) {
            $("<style></style>").appendTo('head').html(css);
        }
    });
});  
```
