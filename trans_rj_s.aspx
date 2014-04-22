﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title> </title>
        <script src="../script/jquery.min.js" type="text/javascript"></script>
        <script src='../script/qj2.js' type="text/javascript"></script>
        <script src='qset.js' type="text/javascript"></script>
        <script src='../script/qj_mess.js' type="text/javascript"></script>
        <script src='../script/mask.js' type="text/javascript"></script>
        <link href="../qbox.css" rel="stylesheet" type="text/css" />
        <script src="../script/qbox.js" type="text/javascript"> </script>
        <link href="css/jquery/themes/redmond/jquery.ui.all.css" rel="stylesheet" type="text/css" />
        <script src="css/jquery/ui/jquery.ui.core.js"> </script>
        <script src="css/jquery/ui/jquery.ui.widget.js"> </script>
        <script src="css/jquery/ui/jquery.ui.datepicker_tw.js"> </script>
        <script type="text/javascript">
            var q_name = "trans_s";
            aPop = new Array(['txtCustno', 'lblCust', 'cust', 'noa,nick', 'txtCustno', 'cust_b.aspx'],
            ['txtTggno', 'lblTggno_rj', 'tgg', 'noa,nick', 'txTggno', 'tgg_b.aspx'],
            ['txtProductno', 'lblProductno_rj', 'ucc', 'noa,product', 'txProductno', 'ucc_b.aspx'],
            ['txtDriverno', 'lblDriver', 'driver', 'noa,namea', 'txtDriverno', 'driver_b.aspx'], 
            ['txtCarno', 'lblCarno', 'car2', 'a.noa,driverno,driver', 'txtCarno', 'car2_b.aspx'],
            ['txtStraddrno', 'lblStraddrno_rj', 'straddr_rj', 'noa,addr', 'txtStraddrno', 'straddr_rj_b.aspx'],
            ['txtEndaddrno', 'lblEndaddrno_rj', 'endaddr_rj', 'noa,addr', 'txtEndaddrno', 'endaddr_rj_b.aspx']);
            $(document).ready(function() {
                main();
            });
            /// end ready

            function main() {
                mainSeek();
                q_gf('', q_name);
            }

            function q_gfPost() {
                q_getFormat();
                q_langShow();
                bbmMask = [['txtBdate', r_picd], ['txtEdate', r_picd],['txtBtrandate', r_picd], ['txtEtrandate', r_picd]];
                q_mask(bbmMask);
                $('#txtBdate').datepicker();
                $('#txtEdate').datepicker(); 
                $('#txtBtrandate').datepicker();
                $('#txtEtrandate').datepicker(); 
                $('#txtNoa').focus();
            }

            function q_gtPost(t_name) {
                switch (t_name) {
                    case 'carteam':
                        var t_carteam = '@全部';
                        var as = _q_appendData("carteam", "", true);
                        for ( i = 0; i < as.length; i++) {
                            t_carteam += (t_carteam.length > 0 ? ',' : '') + as[i].noa + '@' + as[i].team;
                        }
                        q_cmbParse("cmbCarteam", t_carteam);
                        break;
                    case 'calctypes':
                        var as = _q_appendData("calctypes", "", true);
                        var t_item = '@全部';
                        var item = new Array();
                        for ( i = 0; i < as.length; i++) {
                            t_item = t_item + (t_item.length > 0 ? ',' : '') + as[i].noa + as[i].noq + '@' + as[i].typea;
                        }
                        q_cmbParse("cmbCalctype", t_item);
                        break;
                }
            }

            function q_seekStr() {
                t_noa = $.trim($('#txtNoa').val());
                t_bdate = $('#txtBdate').val();
                t_edate = $('#txtEdate').val();
                t_btrandate = $('#txtBtrandate').val();
                t_etrandate = $('#txtEtrandate').val();
                t_carno = $.trim($('#txtCarno').val());
                t_driverno = $.trim($('#txtDriverno').val());
                t_driver = $.trim($('#txtDriver').val());
                t_custno = $.trim($('#txtCustno').val());
                t_comp = $.trim($('#txtComp').val());
                t_productno = $.trim($('#txtProductno').val());
                t_product = $.trim($('#txtProduct').val());
                t_straddrno = $.trim($('#txtStraddrno').val());
                t_endaddrno = $.trim($('#txtEndaddrno').val());
                t_tggno = $.trim($('#txtTggno').val());
                t_tgg = $.trim($('#txtTgg').val());
                t_inmount = q_float('txtInmount');
                t_mount3 = q_float('txtMount3');
                t_mount4 = q_float('txtMount4');
                t_tolls = q_float('txtTolls');
                t_reserve = q_float('txtReserve');
                t_miles = q_float('txtMiles');                
                t_memo = $.trim($('#txtMemo').val());
                    
                var t_where = " 1=1 " 
                + q_sqlPara2("noa", t_noa) 
                + q_sqlPara2("datea", t_bdate, t_edate) 
                + q_sqlPara2("Trandate", t_btrandate, t_etrandate) 
                + q_sqlPara2("driverno", t_driverno) 
                + q_sqlPara2("custno", t_custno) 
                + q_sqlPara2("tggno", t_tggno) 
                + q_sqlPara2("straddrno", t_straddrno) 
                + q_sqlPara2("carno", t_carno)
                + q_sqlPara2("uccno", t_productno) ;
                
                
                if (t_comp.length>0)
                    t_where += " and charindex('" + t_comp + "',comp)>0";
                if (t_tgg.length>0)
                    t_where += " and charindex('" + t_tgg + "',tgg)>0";
                if (t_product.length>0)
                    t_where += " and charindex('" + t_product + "',product)>0"; 
                if (t_memo.length>0)
                    t_where += " and charindex('" + t_memo + "',memo)>0";       
                if (t_driver.length>0)
                    t_where += " and charindex('" + t_driver + "',driver)>0";
                    
                if(t_inmount!=0)
                     t_where += " and inmount="+t_inmount;
                 if(t_mount3!=0)
                     t_where += " and mount="+t_mount3;
                if(t_mount4!=0)
                     t_where += " and mount4="+t_mount4;
                if(t_tolls!=0)
                     t_where += " and tolls="+t_tolls;
                if(t_reserve!=0)
                     t_where += " and reserve="+t_reserve;    
                if(t_miles!=0)
                     t_where += " and miles="+t_miles;              
                t_where = ' where=^^' + t_where + '^^ ';
                return t_where;
            }
        </script>
        <style type="text/css">
            .seek_tr {
                color: white;
                text-align: center;
                font-weight: bold;
                background-color: #76a2fe;
            }
        </style>
    </head>
    <body ondragstart="return false" draggable="false"
    ondragenter="event.dataTransfer.dropEffect='none'; event.stopPropagation(); event.preventDefault();"
    ondragover="event.dataTransfer.dropEffect='none';event.stopPropagation(); event.preventDefault();"
    ondrop="event.dataTransfer.dropEffect='none';event.stopPropagation(); event.preventDefault();"
    >
        <div style='width:400px; text-align:center;padding:15px;' >
            <table id="seek"  border="1"   cellpadding='3' cellspacing='2' style='width:100%;' >
                <tr class='seek_tr'>
                    <td class='seek'  style="width:20%;"><a id='lblNoa'></a></td>
                    <td>
                    <input class="txt" id="txtNoa" type="text" style="width:215px; font-size:medium;" />
                    </td>
                </tr>
                <tr class='seek_tr'>
                    <td   style="width:35%;" ><a id='lblDatea'></a></td>
                    <td style="width:65%;  ">
                    <input class="txt" id="txtBdate" type="text" style="width:90px; font-size:medium;" />
                    <span style="display:inline-block; vertical-align:middle">&sim;</span>
                    <input class="txt" id="txtEdate" type="text" style="width:93px; font-size:medium;" />
                    </td>
                </tr>
                <tr class='seek_tr'>
                    <td   style="width:35%;" ><a id='lblTrandate'></a></td>
                    <td style="width:65%;  ">
                    <input class="txt" id="txtBtrandate" type="text" style="width:90px; font-size:medium;" />
                    <span style="display:inline-block; vertical-align:middle">&sim;</span>
                    <input class="txt" id="txtEtrandate" type="text" style="width:93px; font-size:medium;" />
                    </td>
                </tr>
                <tr class='seek_tr'>
                    <td class='seek'  style="width:20%;"><a id='lblCarno'></a></td>
                    <td>
                    <input class="txt" id="txtCarno" type="text" style="width:215px; font-size:medium;" />
                    </td>
                </tr>
                <tr class='seek_tr'>
                    <td class='seek'  style="width:20%;"><a id='lblDriverno'></a></td>
                    <td>
                    <input class="txt" id="txtDriverno" type="text" style="width:215px; font-size:medium;" />
                    </td>
                </tr>
                <tr class='seek_tr'>
                    <td class='seek'  style="width:20%;"><a id='lblDriver'></a></td>
                    <td>
                    <input class="txt" id="txtDriver" type="text" style="width:215px; font-size:medium;" />
                    </td>
                </tr>
                <tr class='seek_tr' style="display:none;">
                    <td class='seek'  style="width:20%;"><a id='lblStraddrno'></a></td>
                    <td>
                    <input class="txt" id="txtStraddrno" type="text" style="width:215px; font-size:medium;" />
                    </td>
                </tr>
                <tr class='seek_tr' style="display:none;">
                    <td class='seek'  style="width:20%;"><a id='lblEndaddrno'></a></td>
                    <td>
                    <input class="txt" id="txtEndaddrno" type="text" style="width:215px; font-size:medium;" />
                    </td>
                </tr>
                <tr class='seek_tr'>
                    <td class='seek'  style="width:20%;"><a id='lblCustno'></a></td>
                    <td>
                    <input class="txt" id="txtCustno" type="text" style="width:215px; font-size:medium;" />
                    </td>
                </tr>
                <tr class='seek_tr'>
                    <td class='seek'  style="width:20%;"><a id='lblComp'></a></td>
                    <td>
                    <input class="txt" id="txtComp" type="text" style="width:215px; font-size:medium;" />
                    </td>
                </tr>
                <tr class='seek_tr'>
                    <td class='seek'  style="width:20%;"><a id='lblProductno_rj'>物品編號</a></td>
                    <td>
                    <input class="txt" id="txtProductno" type="text" style="width:215px; font-size:medium;" />
                    </td>
                </tr>
                <tr class='seek_tr'>
                    <td class='seek'  style="width:20%;"><a id='lblProduct_rj'>物品名稱</a></td>
                    <td>
                    <input class="txt" id="txtProduct" type="text" style="width:215px; font-size:medium;" />
                    </td>
                </tr>
                <tr class='seek_tr'>
                    <td class='seek'  style="width:20%;"><a id='lblTggno_rj'>廠商編號</a></td>
                    <td>
                    <input class="txt" id="txtTggno" type="text" style="width:215px; font-size:medium;" />
                    </td>
                </tr>
                <tr class='seek_tr'>
                    <td class='seek'  style="width:20%;"><a id='lblTgg_rj'>廠商名稱</a></td>
                    <td>
                    <input class="txt" id="txtTgg" type="text" style="width:215px; font-size:medium;" />
                    </td>
                </tr>
                <tr class='seek_tr'>
                    <td class='seek'  style="width:20%;"><a id='lblInmount_rj'>台數</a></td>
                    <td>
                    <input class="txt" id="txtInmount" type="text" style="width:215px; font-size:medium;text-align: right;" />
                    </td>
                </tr>
                <tr class='seek_tr'>
                    <td class='seek'  style="width:20%;"><a id='lblMount3_rj'>米數</a></td>
                    <td>
                    <input class="txt" id="txtMount3" type="text" style="width:215px; font-size:medium;text-align: right;" />
                    </td>
                </tr>
                <tr class='seek_tr'>
                    <td class='seek'  style="width:20%;"><a id='lblMount4_rj'>噸數</a></td>
                    <td>
                    <input class="txt" id="txtMount4" type="text" style="width:215px; font-size:medium;text-align: right;" />
                    </td>
                </tr>
                <tr class='seek_tr'>
                    <td class='seek'  style="width:20%;"><a id='lblTolls_rj'>公升</a></td>
                    <td>
                    <input class="txt" id="txtTolls" type="text" style="width:215px; font-size:medium;text-align: right;" />
                    </td>
                </tr>
                <tr class='seek_tr'>
                    <td class='seek'  style="width:20%;"><a id='lblReserve_rj'>油費</a></td>
                    <td>
                    <input class="txt" id="txtReserve" type="text" style="width:215px; font-size:medium;text-align: right;" />
                    </td>
                </tr>
                <tr class='seek_tr'>
                    <td class='seek'  style="width:20%;"><a id='lblMiles_rj'>里程數</a></td>
                    <td>
                    <input class="txt" id="txtMiles" type="text" style="width:215px; font-size:medium;text-align: right;" />
                    </td>
                </tr>
                <tr class='seek_tr'>
                    <td class='seek'  style="width:20%;"><a id='lblMemo_rj'>備註</a></td>
                    <td>
                    <input class="txt" id="txtMemo" type="text" style="width:215px; font-size:medium;" />
                    </td>
                </tr>
            </table>
            <!--#include file="../inc/seek_ctrl.inc"-->
        </div>
    </body>
</html>