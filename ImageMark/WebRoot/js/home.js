
var home={
    init:function(){
        var a=$(".banner-right");
        var b=$(".banner-left");
        a.on("click",function(){
            var d=$(".banner.active");var c=d.next();if(c==null||c.html()==null||c.html()==""){c=$(".banner:first")}home.change(c,d,"next")});
        b.on("click",function(){var d=$(".banner.active");var c=d.prev();if(c==null||c.html()==null||c.html()==""){c=$(".banner:last")}home.change(c,d,"prev")});
        home.change($(".banner:first"),null,"");
        $(window).on("scroll.main",function(){var c=$(window).height();var e=$(document).scrollTop();var d=$(".banner.active").outerHeight()-62;if(e>=d){$(".home-header-main").addClass("fixed-header");$("#logo1").hide();$("#logo2").show()}else{$(".home-header-main").removeClass("fixed-header");$("#logo1").show();$("#logo2").hide()}})
    },
    change:function(c,d,b){
        if(d!=null){d.css("opacity","0.7").removeClass("active")}
        c.addClass("active").css("opacity","0.7");
        c.animate({opacity:"1"},500);
        var a=c.attr("alt");
        if(a=="one"){c.find(".banner-image").animate({right:"-20px"},500);
        if(b=="prev"){d.find(".banner-image").css("left","-200px")}
        else{
            if(b=="next"){d.find(".banner-image").css("right","-200px")}}}
            else{
                if(a=="two"){
                    c.find(".banner-image").animate({left:"0px"},500);
                    if(b=="prev"){d.find(".banner-image").css("right","-200px")}
                    else{
                        if(b=="next"){d.find(".banner-image").css("right","-200px")}}}
                else{
                    if(a=="three"){c.find(".banner-image").animate({right:"-29px"},500);if(b=="prev"){d.find(".banner-image").css("right","-200px")}else{if(b=="next"){d.find(".banner-image").css("left","-200px")}}}}}
        $(".banner-slider-op").find("span[tit="+a+"]").addClass("active");$(".banner-slider-op").find("span[tit="+a+"]").siblings().removeClass("active")
    },
    toChange:function(a){
        $(".banner-slider-op").find("span[tit="+a+"]").addClass("active");$(".banner-slider-op").find("span[tit="+a+"]").siblings().removeClass("active");var c=$(".banner[alt="+a+"]");var b=$(".banner.active");home.change(c,b,"")}
};

home.init();