window.addEventListener("hashchange", function () { scrollBy(0, -60); });

$(document).ready(function(){
    $('.your-class').slick({
        setting-name: setting-value
    });
});

$('.autoplay').slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 2000,
});

