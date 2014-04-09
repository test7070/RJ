<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
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
            aPop = new Array(['txtXcarno', 'lblXcarno', 'car2', 'a.noa,driverno,driver', 'txtXcarno', 'car2_b.aspx']);

            function z_tran() {
            }
            z_tran.prototype = {
                data : {
                    carteam : null,
                    calctypes : null,
                    calctype : null,
                    carkind : null,
                    acomp : null
                }
            };
            t_data = new z_tran();

            $(document).ready(function() {
                _q_boxClose();
                q_getId();
                q_gt('carkind', '', 0, 0, 0, "");
                
            });
            function q_gfPost() {
                loadFinish();
            }

            function q_gtPost(t_name) {
                switch (t_name) {
                    case 'carkind':
                        t_data.data['carkind'] = '';
                        var as = _q_appendData("carkind", "", true);
                        for ( i = 0; i < as.length; i++) {
                            t_data.data['carkind'] += (t_data.data['carkind'].length > 0 ? ',' : '') + as[i].noa + '@' + as[i].kind;
                        }
                        q_gt('carteam', '', 0, 0, 0, "");
                        break;
                    case 'carteam':
                        t_data.data['carteam'] = '';
                        var as = _q_appendData("carteam", "", true);
                        for ( i = 0; i < as.length; i++) {
                            t_data.data['carteam'] += (t_data.data['carteam'].length > 0 ? ',' : '') + as[i].noa + '@' + as[i].team;
                        }
                        q_gt('calctype', '', 0, 0, 0);
                        break;
                    case 'calctype':
                        t_data.data['calctype'] = '';
                        var as = _q_appendData("calctype", "", true);
                        for ( i = 0; i < as.length; i++) {
                            t_data.data['calctype'] += (t_data.data['calctype'].length > 0 ? ',' : '') + 'calctype_' + as[i].noa + '@' + as[i].namea;
                        }
                         q_gt('calctype2', '', 0, 0, 0, "calctypes");
                        break;
                    case 'calctypes':
                        t_data.data['calctypes'] = '';
                        var as = _q_appendData("calctypes", "", true);
                        for ( i = 0; i < as.length; i++) {
                            t_data.data['calctypes'] += (t_data.data['calctypes'].length > 0 ? ',' : '') + as[i].noa + as[i].noq + '@' + as[i].typea;
                        }
                        q_gt('acomp', '', 0, 0, 0);
                        break;
                    case 'acomp':
                        t_data.data['acomp'] = '';
                        var as = _q_appendData("acomp", "", true);
                        for ( i = 0; i < as.length; i++) {
                            t_data.data['acomp'] += ',' + as[i].acomp;
                        }
                        q_gf('', 'z_trans_rj');
                        
                        break;
                }

            }

            function q_boxClose(t_name) {
            }

            function loadFinish() {
                $('#q_report').q_report({
                    fileName : 'z_trans_rj',
                    options : [{/*1-[1][2]登錄日期*/
                        type : '1',
                        name : 'xdate'
                    }, {/*2-[3][4]交運日期*/
                        type : '1',
                        name : 'xtrandate'
                    }, {/*3-[5][6]交運月份*/
                        type : '1',
                        name : 'xmon'
                    }, {/*4-[7][8]客戶*/
                        type : '2',
                        name : 'xcust',
                        dbf : 'cust',
                        index : 'noa,comp',
                        src : 'cust_b.aspx'
                    }, {/*5-[9][10]司機*/
                        type : '2',
                        name : 'xdriver',
                        dbf : 'driver',
                        index : 'noa,namea',
                        src : 'driver_b.aspx'
                    }, {/*6-[11]車牌*/
                        type : '6',
                        name : 'xcarno'
                    }, {/*7-[12]車隊*/
                        type : '8',
                        name : 'xcarteam',
                        value : t_data.data['carteam'].split(',')
                    }, {/*8-[13]車種*/
                        type : '8',
                        name : 'xcarkind',
                        value : t_data.data['carkind'].split(',')
                    }, {/*9-[14]計算類別*/
                        type : '8',
                        name : 'xcalctypes',
                        value : t_data.data['calctypes'].split(',')
                    }, {/*10-[15]交運月份*/
                        type : '6',
                        name : 'ymon'
                    }]
                });
                q_popAssign();
                q_langShow();
                
                $('#txtXmon1').mask('999/99');
                $('#txtXmon2').mask('999/99');
                $('#txtXdate1').mask('999/99/99');
                $('#txtXdate1').datepicker();
                $('#txtXdate2').mask('999/99/99');
                $('#txtXdate2').datepicker();
                $('#txtXtrandate1').mask('999/99/99');
                $('#txtXtrandate2').mask('999/99/99');
                $('#txtXtrandate1').datepicker();
                $('#txtXtrandate2').datepicker();
                $('#txtYmon').mask('999/99');
                
                $('#chkXcarteam').children('input').attr('checked', 'checked');
                $('#chkXcarkind').children('input').attr('checked', 'checked');
                $('#chkXcalctypes').children('input').attr('checked', 'checked');
    
                $('#txtBBmon').mask('999/99');
                $('#txtEEmon').mask('999/99');
                $('#textMon').mask('999/99');
                $('#btnTrans_sum').click(function(e) {
                    $('#divExport').toggle();
                });
                $('#btnDivexport').click(function(e) {
                    $('#divExport').hide();
                });
                $('#btnExport').click(function(e) {
                    var t_mon = $('#textMon').val();
                    if (t_mon.length > 0) {
                        Lock(1, {
                            opacity : 0
                        });
                        q_func('qtxt.query.trans', 'trans.txt,tran_sum,' + encodeURI(t_mon));
                    } else
                        alert('請輸入交運月份。');
                });
            }
            function q_funcPost(t_func, result) {
                switch(t_func) {
                    case 'qtxt.query.trans':
                        alert('結轉完成。');
                        Unlock(1);
                        break;
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
            <input type="button" id="btnTrans_sum" value="分析表資料結轉" style="display:none;"/>
            <div id="container">
                <div id="q_report"></div>
            </div>
            <div class="prt" style="margin-left: -40px;">
                <!--#include file="../inc/print_ctrl.inc"-->
            </div>
        </div>
        <div id="divExport" style="display:none;position:absolute;top:100px;left:600px;width:400px;height:120px;background:RGB(237,237,237);">
            <table style="border:4px solid gray; width:100%; height: 100%;">
                <tr style="height:1px;background-color: pink;">
                    <td style="width:25%;"></td>
                    <td style="width:25%;"></td>
                    <td style="width:25%;"></td>
                    <td style="width:25%;"></td>
                </tr>
                <tr>
                    <td style="padding: 2px;text-align: center;border-width: 0px;background-color: pink;color: blue;"><a>交運月份</a></td>
                    <td colspan="3" style="padding: 2px;text-align: center;border-width: 0px;background-color: pink;">
                    <input type="text" id="textMon" style="float:left;width:40%;"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" style="background-color: pink;">
                    <input type="button" id="btnExport" value="結轉"/>
                    </td>
                    <td colspan="2" align="center" style=" background-color: pink;">
                    <input type="button" id="btnDivexport" value="關閉"/>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>