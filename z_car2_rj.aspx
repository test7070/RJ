<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title> </title>
        <script src="../script/jquery.min.js" type="text/javascript"></script>
        <script src='../script/qj2.js' type="text/javascript"></script>
        <script src='qset.js' type="text/javascript"></script>
        <script src='../script/qj_mess.js' type="text/javascript"></script>
        <script src="../script/qbox.js" type="text/javascript"></script>
        <script src='../script/mask.js' type="text/javascript"></script>
        <link href="../qbox.css" rel="stylesheet" type="text/css" />
        <link href="css/jquery/themes/redmond/jquery.ui.all.css" rel="stylesheet" type="text/css" />
        <script src="css/jquery/ui/jquery.ui.core.js"></script>
        <script src="css/jquery/ui/jquery.ui.widget.js"></script>
        <script src="css/jquery/ui/jquery.ui.datepicker_tw.js"></script>
        <script type="text/javascript">
            var t_carkind = null;
            var t_carteam = null;
            var t_calctypes = null;
            $(document).ready(function() {
                _q_boxClose();
                q_getId();
                q_gf('', 'z_car2_rj');
            });
            function q_gfPost() {
                $('#q_report').q_report({
                    fileName : 'z_car2_rj',
                    options : [{//[1] 
                        type : '0',
                        name : 'xcartype',
                        value : q_getPara('car2.cartype')
                    },{//[2]
                        type : '6',
                        name : 'xcarno'
                    },{//[3] 
                        type : '8',
                        name : 'xcartype',
                        value : q_getPara('car2.cartype').split(',')
                    }, {/*[4][5]驗車日期*/
                        type : '1',
                        name : 'xcheckdate'
                    }]
                });
                q_popAssign();
                q_langShow();
                $('#txtXcheckdate1').mask('999/99/99');
                $('#txtXcheckdate1').datepicker();
                $('#txtXcheckdate2').mask('999/99/99');
                $('#txtXcheckdate2').datepicker();
            }

            function q_boxClose(t_name) {
            }
            function q_funcPost(t_func, result) {
                switch(t_func) {
                    default:
                        break;
                }
            }
        </script>
    </head>
    <body ondragstart="return false" draggable="false"
    ondragenter="event.dataTransfer.dropEffect='none'; event.stopPropagation(); event.preventDefault();"
    ondragover="event.dataTransfer.dropEffect='none';event.stopPropagation(); event.preventDefault();"
    ondrop="event.dataTransfer.dropEffect='none';event.stopPropagation(); event.preventDefault();"
    >
        <div id="q_menu"></div>
        <div style="position: absolute;top: 10px;left:50px;z-index: 1;width:2000px;">
            <div id="container">
                <div id="q_report"></div>
            </div>
            <div class="prt" style="margin-left: -40px;">
                <!--#include file="../inc/print_ctrl.inc"-->
            </div>
        </div>
    </body>
</html>