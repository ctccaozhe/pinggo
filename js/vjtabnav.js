var vjtabnav={};

(function($, window, document, undefined) {
    $(window).resize(function(){
        refreshnav();
    });
    var pagetab=[],curtabnum=1,active_id=0,lasttab_id=0,navbeginl;
    var frametemp='<iframe id="$id$" name="$name$" src="$src$" frameborder="0" scrolling="auto" width=100%; class="main_iframe" data-id="$dataid$"  height=100%></iframe>',
        frametemp_nameid=$('iframe.main_iframe').attr('id'),
        frametemp_parent=$('iframe.main_iframe').parent(),
        frametemp_id=$('iframe.main_iframe').attr('data-id'),
        frametemp_homeid=$('iframe.main_iframe').attr('id'),
        frametemp_homesrc=$('iframe.main_iframe').attr('src');

    function refreshnav(){
        var maxrightset=$('.navbar-custom-menu').offset().left-20,nav_tabsset=$('.nav-addtabs').offset();
        var curtabright=0;
        navbeginl=nav_tabsset.left;
        for(var tab in pagetab) {
            var obj = $('#tab_label' + pagetab[tab].id);
            var objwidth = obj.width();
            if (pagetab[tab].showtype == 1) {
                objwidth = pagetab[tab].oldwidth
            }
            if (tab == 0) {
                curtabright = navbeginl + objwidth;
            } else {
                curtabright = obj.offset().left + objwidth;
            }
            navbeginl += objwidth;
            if (navbeginl > (maxrightset-50)) {
                if (navbeginl < maxrightset && tab==(pagetab.length-1)) {pagetab[tab].showtype = 0;}
                else{
                    if (pagetab[tab].showtype == 0) {
                        pagetab[tab].oldwidth = obj.width();
                    }
                    pagetab[tab].showtype = 1;
                }

            } else {
                pagetab[tab].showtype = 0;
            }
        }
        createpagetab();
    }

    function getidbyurl(url){
        if(pagetab.length>0){
            for(var tab in pagetab){
                if (pagetab[tab].url==url){
                    return pagetab[tab].id;
                }
            }
        }
        return -1;
    }
    function tabpage_addon(tab_id,tab_title,tab_url,tab_icon){
        var getid=getidbyurl(tab_url);
        var nframehtml,lastframeid,nframeid;
        if(getid==-1){
            curtabnum++;
            if(tab_id==-1){tab_id=1000+curtabnum}
            pagetab.push({'url':tab_url,'id':tab_id,'title':tab_title,'icon':tab_icon,'showtype':0});
            //生成iframe
            nframeid='tab_iframe_'+tab_id;
            nframehtml=frametemp.replace(/\$id\$/,nframeid);
            nframehtml=nframehtml.replace(/\$name\$/,nframeid);
            nframehtml=nframehtml.replace(/\$src\$/,tab_url);
            nframehtml=nframehtml.replace(/\$dataid\$/,tab_id);
            if(active_id==0){lastframeid=frametemp_nameid}else{lastframeid='tab_iframe_'+active_id}
            active_id=tab_id;
            frametemp_parent.append(nframehtml);
            $('#'+lastframeid).hide();
            //处理iframe内链接事件
            var iframe = document.getElementById(nframeid);

            if (iframe.attachEvent) {
                console.log(1);
                iframe.attachEvent("onload", function() {
                    $("#"+nframeid).contents().find('a').click(function(){
                        console.log('click1');
                    });
                });
            } else {
                iframe.onload = function() {
                    $("#"+nframeid).contents().find('[data-toggle="addtab"]').click(function(){
                        var tab_id=$(this).attr('data-id');
                        var tab_url=$(this).attr('data-url')||'';
                        var tab_icon=$(this).attr('data-icon')||'';
                        var tab_title=$(this).attr('data-title')||$(this).text();
                        if (tab_url!=''){$.vjf_tabpage_addon(tab_id,tab_title,tab_url,tab_icon);}
                    });
                };
            }

        }else{
            if(active_id!=getid){
                $('#'+'tab_iframe_'+active_id).hide();
                active_id=getid;
                $('#'+'tab_iframe_'+active_id).show();
            }
        }
        createpagetab();
        refreshnav();
    }

    function tabpage_close(tab_id){
        // console.log('close'+tab_id+';curpage:'+active_id);
        var tablen=pagetab.length,arrweizhi=0;
        //页签不唯一，是最后一个的时候
        //页签不唯一，是中间任意一个时候
        if (tablen==1){
            active_id='';
        }else{
            //页签不唯一，是第一个的时候
            if (pagetab[0].id==tab_id){
                if (tab_id==active_id) active_id=pagetab[1].id;
            }else{
                //页签不唯一，是中间任意一个时候
                for(var tab in pagetab){
                    if(pagetab[tab].id==tab_id){
                        if( tab_id==active_id)  active_id=pagetab[tab-1].id;
                        arrweizhi=tab;
                    }
                }
            }
        }
        pagetab.splice(arrweizhi,1);
        $('#tab_label'+tab_id).remove();
        $('#'+'tab_iframe_'+tab_id).remove();
        if (active_id!=''){
            tabpage_active(active_id);
        }else{
            $('#'+frametemp_homeid).show();
        }
        // console.log('删除后的对象值：');
        // console.log(pagetab);
        refreshnav();
    }
    function tabpage_active(tab_id){
        if(active_id!=tab_id){
            $('.nav-addtabs li').removeClass('active');
            $('#'+'tab_iframe_'+active_id).hide();
            active_id=tab_id;
        }
        $('#tab_label'+active_id).addClass('active');
        $('#'+'tab_iframe_'+active_id).show();
    }
    function createpagetab(){
        //console.log(pagetab);
        var tab_navhtml='',liclassname='',hidehtml,havehide=false;
        hidehtml=' <li class="dropdown pull-right tabdrop"><a class="dropdown-toggle" data-toggle="dropdown" href="javascript:;" aria-expanded="true"><i class="glyphicon glyphicon-align-justify"></i> <b class="caret"></b></a><ul class="dropdown-menu">';
        for(var tab in pagetab){
            if (pagetab[tab].id==active_id){liclassname='active'}else{liclassname=''}
            var tab_navlabel_temp=' <li role="presentation" id="tab_label'+pagetab[tab].id+'" node-id="'+pagetab[tab].id+'"  role="pagetab" class=" '+liclassname+'"><a href="javascript:void(0);"  ><i class="'+pagetab[tab]['icon']+'"></i>' +
                '<span>'+pagetab[tab].title+'</span> <span class="pull-right-container"> </span></a> <i class="close-tab fa fa-remove"></i></li>';

            if(pagetab[tab].showtype==0){
                tab_navhtml=tab_navhtml +tab_navlabel_temp;
            }else{
                havehide=true;
                hidehtml+=tab_navlabel_temp;
            }
        }
        if(havehide){
            tab_navhtml=hidehtml+'</ul> </li>'+tab_navhtml;
        }
        $('.nav-addtabs').html(tab_navhtml);
        $('.nav-addtabs i.close-tab').click(function(){
            var cur_id=$(this).parent().attr('node-id');
            tabpage_close(cur_id);
        });
        $('.nav-addtabs a[data-toggle!="dropdown"]').click(function(){
            var cur_id=$(this).parent().attr('node-id');
            tabpage_active(cur_id);
        });
    }
    $('[data-toggle="refreshtab"]').click(function(){refreshframe()});
    $('[data-toggle="closealltab"]').click(function(){
        $('#'+frametemp_homeid).show();
        for(var tab=0;tab<pagetab.length;tab++ ){
            $('#tab_label'+pagetab[tab].id).remove();
            $('#'+'tab_iframe_'+pagetab[tab].id).remove();
        }
        $('li.tabdrop').remove();
        active_id='';
        pagetab=[];//console.log(pagetab);
    });
    $('[data-toggle="closeOthertab"]').click(function(){
        var temp_tabdata;
        for(var tab=0;tab<pagetab.length;tab++ ){
            if(active_id==pagetab[tab].id){
                temp_tabdata=pagetab[tab];
            }else{
                $('#tab_label'+pagetab[tab].id).remove();
                $('#'+'tab_iframe_'+pagetab[tab].id).remove();
            }
        }
        $('li.tabdrop').remove();
        pagetab=[];
        pagetab.push(temp_tabdata);
        refreshnav();
    });
    function refreshframe(){
        if(active_id!=''){
            document.getElementById('tab_iframe_'+active_id).contentWindow.location.reload(true);
        }
    }
    var autotab_id=30000;
    $.extend({
        vjf_tabpage_addon:function(tab_id,tab_title,tab_url,tab_icon){

            var newtab_id=tab_id||(autotab_id+'');
            autotab_id++;
            tabpage_addon(newtab_id,tab_title,tab_url,tab_icon);
        }
    });
    var tab_timer;
    vjtabnav.refreshnav=refreshnav;
    $('[data-toggle="push-menu"]').click(function(){
        tab_timer=setTimeout('vjtabnav.refreshnav()',350);
    });
    $('[data-toggle="addtab"]').click(function(){
        var tab_id=$(this).attr('data-id');
        var tab_url=$(this).attr('data-url')||'';
        var tab_icon=$(this).attr('data-icon')||'';
        var tab_title=$(this).attr('data-title')||$(this).text();
        if (tab_url!=''){$.vjf_tabpage_addon(tab_id,tab_title,tab_url,tab_icon);}
        $('.sidebar-menu li').removeClass('active')
        if($(this).parent().parent().parent().hasClass('treeview')){$(this).parent().parent().parent().addClass('active');}
        $(this).parent().addClass('active');
    });

})(jQuery, window, document);
