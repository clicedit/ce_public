<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ce="http://www.clicedit.org/schema_1.0" xmlns:i_d="http://internal/data" xmlns:exslt="http://exslt.org/common" exclude-result-prefixes="xsi ce i_d exslt" version="1.0">

<!--
    ****************************************************
    *                                                  *
	*                    CLIC.EDIT                     *
	*                                                  *
    *            http://www.clicedit.com/              *
    *                                                  *
    ****************************************************
-->

    <!-- 
#fic# 'ce/Schema/xsl/lib_xsl/ph_main.xsl'
#input/namespace# 'http://www.clicedit.org/schema_1.0'
#aim# 'main Preview Html Xsl' convert "Clic.Edit xml instance" to an HTML document'
#usage# to be include for 'output/@method'
#namespace# 
-->
    <!--
#limitation for browser
* xslt v1.0
* no xinclude
-->
    <!-- 
#history# (see also github comment)
YYYYMMJJ VER  COMMENT
201907   V.O.
-->
    <!-- some stylesheet attibutes :
xpath-default-namespace="http://www.clicedit.org/schema_1.0"
xmlns:i_f="http://internal/functions"
xmlns:i_d="http://internal/data"
-->
    <!-- syntaxe
* Cmt: before element 
* cmt: inside element
* Cmt_value : value
* Cmt_inline : label + value + unit?
* Cmt_inlineBr : Cmt_inline + <br>
* Cmt_inlineDiv : Cmt_inline + <div>
* Cmt_inlineLi : Cmt_inline + "List" 
* Cmt_Row : boobstrap row (12 part)     
    -->

    <xsl:decimal-format name="euro" decimal-separator="," grouping-separator=" "/>

    <!-- the 'xsl:output/@method' is define in the parent xsl -->

    <!-- #H2# PARAMETERS -->
    <!-- $pDebug : all debug values as : _noJs_  _var_ ...-->
    <xsl:param name="pDebug"/>

    <!-- #H4# RESOURCES -->
    <!--Cmt: common resouces in "xsl/lib" -->

    <!-- $pDirPrefXsl : prefix path to 'Schema/xsl' dir  -->
    
    
    <xsl:variable name="optResources">web</xsl:variable>
    <xsl:param name="pDirPrefXsl">
        <xsl:choose>
            <xsl:when test="'web' = $optResources">https://dduphil.github.io/cep</xsl:when>
            <xsl:otherwise>../../xsl/</xsl:otherwise>
        </xsl:choose>
    </xsl:param>
    
    <xsl:variable name="pDirImg" select="concat($pDirPrefXsl, '/lib/img')"/>

    <xsl:variable name="optBootstrap">web-v4</xsl:variable>
    <xsl:variable name="pDirBootStrap" select="concat($pDirPrefXsl, '/lib/bootstrap-4.3.1-dist')"/>

    <!-- #H4# KEY FOR SORT -->
    <xsl:key name="kContactByRole" match="/ce:ClicEdit//ce:Contact" use="@role"/>

    <!-- #H2# INCLUSION -->
    <!--# common inclusion -->
    <xsl:include href="./ph_docVar.xsl"/>
    <xsl:include href="../../lib/common_xsl/i18n_xsl.xsl"/>
    <xsl:include href="../../lib/common_xsl/common_xsl.xsl"/>
    <xsl:include href="./ph_loop.xsl"/>
    <xsl:include href="./ph_text.xsl"/>
    <xsl:include href="./ph_inline.xsl"/>
    <xsl:include href="./ph_row.xsl"/>
    <xsl:include href="./ph_block.xsl"/>
    <xsl:include href="./ph_nivDef.xsl"/>
    <xsl:include href="./ph_niv.xsl"/>
    <!--# inclusion for message -->
    <xsl:include href="./ph_ack.xsl"/>
    <xsl:include href="./ph_order.xsl"/>
    <xsl:include href="./ph_invoice.xsl"/>
    <xsl:include href="./ph_delivery.xsl"/>
    <xsl:include href="./ph_movement.xsl"/>
    <xsl:include href="./ph_status.xsl"/>
    

    <!-- #H4# VARIABLES -->


    <!-- #H2# TEMPLATE -->
    <!-- #H4# TEMPLATE GEN -->

    <xsl:template name="dbg-var">
        <xsl:text>
</xsl:text>
        <xsl:choose>
            <xsl:when test="true() and contains($pDebug, '_var_')">
                <dbg-i_doc_type>
                    <xsl:copy-of select="$i_doc_type"/>
                </dbg-i_doc_type>
                <dbg-date v="{$i_doc_date}"/> 
                <dbg-vLang>
                    <xsl:copy-of select="$vLang"/>
                </dbg-vLang>
                <xsl:if test="false()">
                    <dbg-vLabels>
                        <xsl:copy-of select="$vLabels"/>
                    </dbg-vLabels>
                </xsl:if>
            </xsl:when>
        </xsl:choose>
        <xsl:text>
</xsl:text>
        
    </xsl:template>

    <xsl:template name="break">
        <!-- Fonction pour preserver les CR dans le corps du XML (comments) -->
        <xsl:param name="text"/>
        <xsl:param name="replace" select="'&#10;'"/>
        <xsl:choose>
            <xsl:when test="contains($text, $replace)">
                <xsl:value-of select="substring-before($text, $replace)"/>
                <br/>
                <xsl:call-template name="break">
                    <xsl:with-param name="text" select="substring-after($text, $replace)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="tplHtmlLike">
        <xsl:param name="aVal"/>
        <xsl:choose>
            <xsl:when test="0 &lt; count($aVal/*)">
                <xsl:apply-templates select="$aVal"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="break">
                    <xsl:with-param name="text" select="$aVal/text()"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="ce:a | ce:abbr | ce:b | ce:br | ce:cite | ce:code | ce:dfn | ce:div | ce:em | ce:hr | ce:i | ce:ol | ce:pre | ce:q | ce:small | ce:span | ce:strong | ce:sub | ce:sup | ce:ul | ce:u">
        <!--cmt: htmlLike implies copy  -->
        <xsl:element name="{local-name()}">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template name="tplAddDocTypeHml5">
        <xsl:variable name="optHml5Doctype">noHml5Doctype</xsl:variable>
        <xsl:choose>
            <xsl:when test="contains($pDebug, '_docty_') or 'noHml5Doctype' = $optHml5Doctype">
                <!-- no html5 doctype --> </xsl:when>
            <xsl:when test="'addHml5Doctype' != $optHml5Doctype">
                <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;
</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="tplAddCeJs">
        <xsl:variable name="optJs">noJs</xsl:variable>
        <xsl:choose>
            <xsl:when test="contains($pDebug, '_noJs_') or 'noJs' = $optJs">
                <!-- no Js --> </xsl:when>
            <xsl:when test="'localJs' = $optJs">
                <link rel="stylesheet" href="../js/previewHtml.js" crossorigin="anonymous"/>
            </xsl:when>
            <xsl:otherwise>
                <error msg="{concat('tplAddCeJs $pDebug (', $pDebug, ') $optJs (', $optJs, ')' )}"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="tplAddCeCss">
        <xsl:variable name="optCss">webCss</xsl:variable>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <xsl:choose>
            <xsl:when test="'localCss' = $optCss">
                <link rel="stylesheet" href="{concat($pDirPrefXsl, '/previewHtml/css/previewHtml.css')}"/>
            </xsl:when>
            <xsl:when test="'webCss' = $optCss">
                <link rel="stylesheet" href="{concat($pDirPrefXsl, '/previewHtml/css/previewHtml.css')}" crossorigin="anonymous"/>
            </xsl:when>
            <xsl:otherwise>
                <error msg="{concat('tplAddCeCss $optCss (', $optCss, ')' )}"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xsl:template name="tplAddBootstapCss">
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <xsl:choose>
            <xsl:when test="'web-v4' = $optBootstrap">
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous"/>
            </xsl:when>
            <xsl:when test="'local-v4' = $optBootstrap">
                <link rel="stylesheet" href="{concat($pDirBootStrap, '/css/bootstrap.min.css')}" crossorigin="anonymous"/>
            </xsl:when>
            <xsl:otherwise>
                <error msg="{concat('tplAddBootstapCss $optBootstrap (', $optBootstrap, ')' )}"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="tplAddBootstapJs">
        <xsl:param name="aMyJs"/>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"/>
        <xsl:copy-of select="$aMyJs"/>
        <xsl:choose>
            <xsl:when test="'web-v4' = $optBootstrap">
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"/>
            </xsl:when>
            <xsl:when test="'local-v4' = $optBootstrap">
                <script src="{concat($pDirBootStrap, '/js/bootstrap.min.js')}"/>
            </xsl:when>
            <xsl:otherwise>
                <error msg="{concat('tplAddBootstapJs $optBootstrap (', $optBootstrap, ')' )}"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!-- #H4# TEMPLATES ce_header -->



    <xsl:template name="tplDocHeader">
        <!-- apply mode mHeader on 1 of all document header -->
        <xsl:apply-templates mode="mdHeader" select="/ce:ClicEdit/ce:Request/ce:OrderRequest/ce:OrderRequestHeader | /ce:ClicEdit/ce:Request/ce:OrderRequestResponse | /ce:ClicEdit/ce:Request/ce:StatusRequest | /ce:ClicEdit/ce:Request/ce:StatusResponse|/ce:ClicEdit/ce:Request/ce:InvoiceDetailRequest/ce:InvoiceDetailRequestHeader|/ce:ClicEdit/ce:Request/ce:InvoiceDetailRequestResponse | /ce:ClicEdit/ce:Request/ce:DeliveryRequest/ce:DeliveryRequestHeader"/>
    </xsl:template>


    <xsl:template mode="mdHeader" match="ce:OrderRequestHeader |ce:OrderRequestResponse | ce:StatusRequest | ce:StatusResponse| ce:InvoiceDetailRequestHeader| ce:InvoiceDetailRequestResponse | ce:DeliveryRequestHeader">
        <div class="col-6">
            <div>
                <xsl:call-template name="getSpanLabel">
                    <xsl:with-param name="aVal" select="$i_doc_dt"/>
                </xsl:call-template>
                <xsl:value-of select="$i_doc_id"/>
            </div>
            <div class="ce_stDetail">
                <!-- cmt : all attribut except the one for the date -->
                <xsl:apply-templates mode="mdAttOpt" select="@*[local-name() != substring-before($i_doc_date, '.')]"/>
            </div>
            <div>
                <xsl:call-template name="getSpanLabel">
                    <xsl:with-param name="aVal" select="substring-before($i_doc_date, '.')"/>
                </xsl:call-template>
                <xsl:value-of select="substring-after($i_doc_date, '.')"/>
            </div>
        </div>
    </xsl:template>


    <xsl:template mode="mdHeader" match="ce:From | ce:To">
        <xsl:apply-templates mode="mdHeader" select="./ce:Correspondent/ce:Contact">
            <xsl:with-param name="aTag" select="local-name()"/>
            <xsl:with-param name="aIdentity" select="./ce:Credential[1]/ce:Identity[1]"/>
        </xsl:apply-templates>
    </xsl:template>


    <!-- Cmt_inlineBr: [niv]  'ce:Contact_type+' -->
    <xsl:template mode="mdHeader" match="ce:Contact | ce:Buyer | ce:BillTo | ce:ShipTo | ce:Supplier">
        <xsl:param name="aTag"/>
        <xsl:param name="aIdentity"/>

        <xsl:variable name="iTag">
            <xsl:choose>
                <xsl:when test="'' != $aTag">
                    <xsl:value-of select="$aTag"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="local-name()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <div>
            <xsl:call-template name="getSpanLabel">
                <xsl:with-param name="aVal" select="$iTag"/>
            </xsl:call-template>
            <span class="display-6">
                <xsl:value-of select="$aIdentity"/>
                <xsl:text> </xsl:text>
                <xsl:apply-templates select="ce:Name"/>
            </span>
            <br/>

            <xsl:apply-templates select="ce:Society | ce:Department"/>

            <xsl:apply-templates select="ce:PostalAddress">
                <xsl:with-param name="aName" select="ce:Name"/>
            </xsl:apply-templates>

            <xsl:apply-templates select="ce:Email"/>

            <xsl:call-template name="n33_CarrierIdentifier"/>

            <div class="ce_stDetail">
                <xsl:call-template name="nLoopExceptBr">
                    <xsl:with-param name="aExcept">!Name!Society!Department!PostalAddress!Email!CarrierIdentifier!</xsl:with-param>
                </xsl:call-template>
            </div>
        </div>
    </xsl:template>


    <xsl:template name="tplContactList_multiCol">
        <!-- cmt: liste contact by role -->
        <xsl:for-each select="/ce:ClicEdit//ce:Contact[generate-id() = generate-id(key('kContactByRole', @role)[1])]">
            <!-- for each key or key[1] -->

            <xsl:variable name="vLabelRole">
                <xsl:choose>
                    <xsl:when test="'' != @role">
                        <xsl:call-template name="getLabel">
                            <xsl:with-param name="aList" select="'contact_role_list_type'"/>
                            <xsl:with-param name="aVal" select="@role"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="getLabel">
                            <xsl:with-param name="aVal">unknownRole</xsl:with-param>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <p class="mt-4">
                <u>
                    <xsl:value-of select="$vLabelRole"/>
                </u>
            </p>
            <xsl:for-each select="key('kContactByRole', @role)">
                <!-- for each node-set with the key1  -->
                <xsl:apply-templates select="." mode="mdHeader"/>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>


    <!-- #H2# MAIN TEMPLATE -->

    <xsl:template match="/ce:ClicEdit">
        <xsl:call-template name="tplAddDocTypeHml5"/>
        <html lang="{$vLang}">
            <head>
                <title>
                    <xsl:text>Clic.EDIt - </xsl:text>
                    <xsl:call-template name="getLabel">
                        <xsl:with-param name="aVal" select="$i_doc_dt"/>
                    </xsl:call-template>
                    <xsl:text> - </xsl:text>
                    <xsl:call-template name="getLabel">
                        <xsl:with-param name="aVal" select="$i_doc_id"/>
                    </xsl:call-template>
                </title>
                <meta charset="utf-8"/>
                <xsl:call-template name="tplAddBootstapCss"/>
                <xsl:call-template name="tplAddCeCss"/>
            </head>
            <body class="ce_sbTopBarParent">
                <nav class="fixed-top navbar navbar-expan navbar-light bg-light border border-secondary rounded align-middle">
                    <xsl:choose>
                        <xsl:when test="'test' = $i_doc_mode">
                            <a class="navbar-brand bg-warning px-4" href="http://www.clicedit.com/">Test Clic.EDIt</a>
                        </xsl:when>
                        <xsl:otherwise>
                            <a class="navbar-brand" href="http://www.clicedit.com/">Clic.EDIt</a>
                        </xsl:otherwise>
                    </xsl:choose>
                    <a class="nav-link disabled" href="#">
                        <xsl:call-template name="getLabel">
                            <xsl:with-param name="aVal" select="$i_doc_dt"/>
                        </xsl:call-template>
                        <xsl:call-template name="getLabelSeprator"/>
                        <xsl:value-of select="$i_doc_id"/>
                    </a>
                    <xsl:if test="'dt_ack' != $i_doc_dt">
                        <a class="nav-item nav-link" href="#">
                            <span aria-hidden="true">&#x2191;</span>
                            <span class="sr-only">(current)</span>
                        </a>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="'dt_OrderRequest' = $i_doc_dt">
                            <a class="nav-item nav-link" href="#aItems">
                                <xsl:call-template name="getLabel">
                                    <xsl:with-param name="aList" select="'nav'"/>
                                    <xsl:with-param name="aVal" select="'OrderRequest_Item'"/>
                                </xsl:call-template>
                            </a>
                            <a class="nav-item nav-link" href="#aItemOut">
                                <xsl:call-template name="getLabel">
                                    <xsl:with-param name="aList" select="'nav'"/>
                                    <xsl:with-param name="aVal" select="'ItemOut'"/>
                                </xsl:call-template>
                            </a>
                        </xsl:when>
                        <xsl:when test="'dt_InvoiceDetailRequest' = $i_doc_dt">
                            <xsl:if test="/ce:ClicEdit/ce:Request[1]/ce:InvoiceDetailRequest[1]/ce:InvoiceDetailOrder[1]">
                                <a class="nav-item nav-link" href="#aItems">
                                    <xsl:call-template name="getLabel">
                                        <xsl:with-param name="aList" select="'nav'"/>
                                        <xsl:with-param name="aVal" select="'InvoiceDetailOrder'"/>
                                    </xsl:call-template>
                                </a>
                            </xsl:if>
                            <xsl:if test="/ce:ClicEdit/ce:Request[1]/ce:InvoiceDetailRequest[1]/ce:InvoiceDetailSummary[1]">
                                <a class="nav-item nav-link" href="#aSummary">
                                    <xsl:call-template name="getLabel">
                                        <xsl:with-param name="aList" select="'nav'"/>
                                        <xsl:with-param name="aVal" select="'InvoiceDetailSummary'"/>
                                    </xsl:call-template>
                                </a>
                            </xsl:if>
                        </xsl:when>
                    </xsl:choose>
                    <button class="navbar btn btn-info btn-sm " type="button" data-toggle="collapse" data-target=".ce_stDetail" aria-expanded="false" aria-controls="main">Détails</button>
                </nav>

                <!--Cmt DocHeader: * Logo, Commande, date,  From,  To -->
                <xsl:for-each select="./ce:Header">
                    <div id="docHeader" class="container">
                        <div class="row justify-content-between">
                            <!-- cmt: main docu.type  -->
                            <div id="logo" class="col-3">
                                <h1 class="text-uppercase">
                                    <xsl:call-template name="getLabel">
                                        <xsl:with-param name="aVal" select="$i_doc_dt"/>
                                    </xsl:call-template>
                                </h1>
                            </div>
                            <!-- cmt: docu.type + details  -->
                            <xsl:call-template name="tplDocHeader"/>
                        </div>

                        <!-- Cmt: [//] From + To -->
                        <div class="row">
                            <div class="col-6 border">
                                <xsl:apply-templates select="ce:From" mode="mdHeader"/>
                            </div>
                            <div class="col-6 border">
                                <xsl:apply-templates select="ce:To" mode="mdHeader"/>
                            </div>
                        </div>
                    </div>
                    <div class="container">                    
                        <xsl:for-each select="ce:Sender">
                            <!-- call : UserAgent -->
                            <xsl:call-template name="nLoopExceptBr">
                                <xsl:with-param name="aExcept">!Credential!</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    </div>
                </xsl:for-each>

                <!-- Cmt: docBody one rule only match of the 7 requests type and 1 response/Status -->

                <xsl:apply-templates select="./ce:Response/ce:Status"/>

                <xsl:call-template name="tplOrderRequest"/>

                <xsl:apply-templates select="./ce:Request/ce:OrderRequestResponse"/>

                <xsl:call-template name="tplInvoiceDetailRequest"/>

                <xsl:apply-templates select="./ce:Request/ce:InvoiceDetailRequestResponse"/>

                <xsl:call-template name="tplDeliveryRequest"/>

                <xsl:call-template name="tplStatusRequest"/>

                <xsl:call-template name="tplMovementRequest"/>

                <!-- Cmt: DocEnd-->
                <div id="borderEnd" class="container border-bottom">
                    <div class="row">
                        <div class="col-12"/>
                    </div>
                </div>


                <footer class="text-muted pt-4">
                    <div class="container">
                        <div class="row bg-light">
                            <div class="col-4 align-middle">
                                <img id="responsive-image" alt="" src="{concat($pDirImg, '/logo_clicedit_footer.png')}" crossorigin="anonymous"/>
                            </div>
                            <div class="col-4 align-middle mt-4">
                                <p>Designed by Clic.EDIt</p>
                            </div>
                            <div class="col-4"/>
                        </div>
                    </div>
                </footer>



                <xsl:call-template name="tplAddBootstapJs"/>
                <xsl:call-template name="tplAddCeJs"/>

                <xsl:call-template name="dbg-var"/>

            </body>
        </html>
    </xsl:template>


    <!-- #H2# DEFAULT TEMPLATES -->

    <!-- Cmt : 'apply on content'-->
    <xsl:template match="ce:InvoiceInstructions">
        <xsl:apply-templates/>
    </xsl:template>



    <xsl:template mode="mdHeader" match="*">
        <xsl:apply-templates mode="mdNYI" select="."/>
    </xsl:template>
    <xsl:template mode="mdInlineBr" match="*">
        <xsl:choose>
            <xsl:when test="contains($pDebug, '_mode_')">
                <xsl:apply-templates mode="mdNYI" select="."/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="."/>
                <br/>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>
    <xsl:template mode="mdRow" match="*">
        <xsl:apply-templates mode="mdNYI" select="."/>
    </xsl:template>
    <xsl:template mode="mdTxt" match="*">
        <xsl:apply-templates mode="mdNYI" select="."/>
    </xsl:template>
    <xsl:template match="*">
        <xsl:apply-templates mode="mdNYI" select="."/>
    </xsl:template>

</xsl:stylesheet>