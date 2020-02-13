<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ce="http://www.clicedit.org/schema_1.0" xmlns:i_d="http://internal/data" exclude-result-prefixes="ce i_d" version="1.0">
    <!-- info see parent 'ph_main.xsl' -->

    <!-- #H2# preinclude -->
    <!--x.l:include href="../../lib/common_xsl/i18n_xsl.xsl"/-->
    <!--x.l:include href="../../lib/common_xsl/common_xsl.xsl"/-->

    <!-- #H2# TEMPLATE -->


    <!-- #H4#  ref  -->

    <!-- Cmt_block OrderRequest*Item -->
    <xsl:template match="ce:OrderRequestPrintItem | ce:OrderRequestPaperItem | ce:OrderRequestPrepressItem">
        <div class="container border">
            <div class="row bg-secondary text-white">
                <div class="col-12">
                    <xsl:value-of select="concat('[', @lineItemId, '] ', ce:PaperArticleNumber, ' ', ce:ProductDescription)"/>
                </div>
            </div>

            <xsl:choose>
                <xsl:when test="local-name() = 'OrderRequestPaperItem'">
                    <!-- cmt_pull row -->
                    <div class="row border">
                        <div class="col-3">
                            <span class="font-weight-bold">
                                <xsl:call-template name="getLabel">
                                    <xsl:with-param name="aVal">Article</xsl:with-param>
                                </xsl:call-template>
                            </span>
                        </div>
                        <div class="col-3">
                            <span class="font-weight-bold">
                                <xsl:call-template name="getLabel">
                                    <xsl:with-param name="aVal">Quantity</xsl:with-param>
                                </xsl:call-template>
                            </span>
                        </div>
                        <div class="col-3">
                            <span class="font-weight-bold">
                                <xsl:call-template name="getLabel">
                                    <xsl:with-param name="aVal">PricePerUnit</xsl:with-param>
                                </xsl:call-template>
                            </span>
                        </div>
                        <div class="col-3"> </div>
                    </div>
                    <div class="row border">
                        <div class="col-3">
                            <xsl:value-of select="./ce:PaperArticleNumber"/>
                            <xsl:text> (</xsl:text>
                            <xsl:value-of select="./ce:ProductDescription"/>
                            <xsl:text>)</xsl:text>
                        </div>
                        <div class="col-3">
                            <xsl:apply-templates select="./ce:OrderedQuantity"/>
                        </div>
                        <div class="col-3">
                            <xsl:apply-templates select="./ce:PricePerUnit"/>
                        </div>
                        <div class="col-3"> </div>
                    </div>
                    <div class="row">
                        <div class="col-12 border">
                            <xsl:text>&#160;</xsl:text>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <xsl:apply-templates select="ce:PaperShape"/>
                        </div>
                        <div class="col-3">
                            <xsl:call-template name="getSpanLabel">
                                <xsl:with-param name="aVal" select="'PaperQuality'"/>
                            </xsl:call-template>
                            <xsl:value-of select="./ce:PaperQuality"/>
                        </div>
                        <div class="col-3">
                            <xsl:call-template name="getSpanLabel">
                                <xsl:with-param name="aVal" select="'PaperBasisWeight'"/>
                            </xsl:call-template>
                            <xsl:apply-templates select="./ce:PaperBasisWeight"/>
                        </div>
                        <div class="col-3">
                            <xsl:apply-templates select="ce:PaperThickness"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <xsl:call-template name="getSpanLabel">
                                <xsl:with-param name="aVal" select="'PaperBulk'"/>
                            </xsl:call-template>
                            <xsl:value-of select="./ce:PaperBulk"/>
                        </div>
                        <div class="col-3"> </div>
                        <div class="col-3">
                            <xsl:apply-templates select="ce:PaperCertification"/>
                        </div>
                        <div class="col-3">
                            <xsl:call-template name="getSpanLabel">
                                <xsl:with-param name="aVal" select="'PaperLabel'"/>
                            </xsl:call-template>
                            <xsl:apply-templates select="ce:PaperLabel"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3"> </div>
                        <div class="col-9">
                            <xsl:apply-templates select="ce:PaperShade"/>
                        </div>
                    </div>
                    <xsl:apply-templates mode="mdRow" select="ce:Sheet | ce:Reel | ce:GeneralPaperPacking"/>
                    <!--Cmt_pull:  DateInfo + ProductDetail -->
                    <div class="row">
                        <div class="col-6">
                            <xsl:apply-templates select="ce:DateInfo"/>
                        </div>
                        <div class="col-6">
                            <xsl:apply-templates select="ce:ProductDetail"/>

                        </div>
                    </div>
                    <!--Cmt_pull:  ProvidedBy + Origin -->
                    <div class="row">
                        <div class="col-6">
                            <span class="font-weight-bold">
                                <xsl:call-template name="getLabel">
                                    <xsl:with-param name="aVal" select="'ProvidedBy'"/>
                                </xsl:call-template>
                            </span>
                            <br/>
                            <xsl:call-template name="break">
                                <xsl:with-param name="text" select="ce:ProvidedBy"/>
                            </xsl:call-template>
                        </div>
                        <div class="col-6"> </div>
                    </div>
                    <xsl:apply-templates mode="mdRow" select="ce:Comment"/>
                    <xsl:call-template name="refIntExt_mdRow"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- cmt_push row 'OrderRequestPrintItem' | 'OrderRequestPrepressItem' -->
                    <xsl:apply-templates select="*"/>
                </xsl:otherwise>
            </xsl:choose>
        </div>
    </xsl:template>


    <xsl:template mode="mdAttResponse" match="@orderDate|@invoiceDate">
        <xsl:if test="'' != .">
            <xsl:call-template name="getSpanLabel">
                <xsl:with-param name="aVal" select="local-name()"/>
            </xsl:call-template>
            <xsl:call-template name="getDateFormated">
                <xsl:with-param name="aVal" select="."/>
            </xsl:call-template>
            <xsl:text> - </xsl:text>
        </xsl:if>        
    </xsl:template>    

    <xsl:template mode="mdAttResponse" match="@response">
        <xsl:call-template name="getSpanLabel">
            <xsl:with-param name="aVal" select="'response'"/>
        </xsl:call-template>
        <span class="font-weight-bold ">
            <xsl:call-template name="getLabel">
                <xsl:with-param name="aVal" select="."/>
            </xsl:call-template>
        </span>        
    </xsl:template>    
        
    <xsl:template mode="mdAttResponse" match="@*">
        <xsl:if test="'' != .">
            <xsl:call-template name="getSpanLabel">
                <xsl:with-param name="aVal" select="local-name()"/>
            </xsl:call-template>
            <xsl:value-of select="."/>
            <xsl:text> - </xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template name="id_mdAttResponse">
        <xsl:if test="@id">
            <xsl:value-of select="concat(' [',@id,'] ')"/>
            <xsl:text> - </xsl:text>
        </xsl:if>        
    </xsl:template>
        
    
    <xsl:template match="ce:OrderRequestResponse|ce:InvoiceDetailRequestResponse">
        <div class="container bg-secondary text-white">
            <div class="row">
                <div class="col-12 text-center">
                    <xsl:choose>
                        <xsl:when test="local-name() = 'OrderRequestResponse'">
                            <xsl:apply-templates mode="mdAttResponse" select="@orderId"/>
                            <xsl:call-template name="id_mdAttResponse"/>
                            <xsl:apply-templates mode="mdAttResponse" select="@deploymentMode"/>

                            <xsl:apply-templates mode="mdAttResponse" select="@orderType"/>
                            <xsl:apply-templates mode="mdAttResponse" select="@orderVersion"/>
                            <xsl:apply-templates mode="mdAttResponse" select="@type"/>
                            <xsl:apply-templates mode="mdAttResponse" select="@agreementId"/>                            

                            <xsl:apply-templates mode="mdAttResponse" select="@orderDate"/>
                            <xsl:apply-templates mode="mdAttResponse" select="@response"/>                            
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- cmt tag InvoiceDetailRequestResponse -->
                            <xsl:apply-templates mode="mdAttResponse" select="@invoiceId"/>
                            <xsl:call-template name="id_mdAttResponse"/>
                            <xsl:apply-templates mode="mdAttResponse" select="@deploymentMode"/>
                            <xsl:apply-templates mode="mdAttResponse" select="@isInformationOnly"/>

                            <xsl:apply-templates mode="mdAttResponse" select="@purpose"/>

                            <xsl:apply-templates mode="mdAttResponse" select="@invoiceDate"/>
                            <xsl:apply-templates mode="mdAttResponse" select="@response"/>                                                        
                        </xsl:otherwise>
                    </xsl:choose>
                </div>
            </div>
        </div>
        <xsl:apply-templates select="ce:OrderRequestResponseAdjust"/>
        <div class="container">
            <xsl:apply-templates mode="mdRow" select="*[not(local-name() = 'IdReference' or local-name() = 'Extrinsic')]"/>            
            <xsl:call-template name="refIntExt_mdRow"/>
        </div>
    </xsl:template>
    
    
    <xsl:template match="ce:OrderRequestResponseAdjust">
        <div class="row border bg-secondary text-white">
            <div class="col-12">
                <xsl:call-template name="labelByTagName"/>
            </div>
        </div>
        <div class="row border">
        <xsl:apply-templates mode="mdRow" select="ce:QuotationDetailOrder|ce:Total|ce:PaymentTerms|ce:ShipmentItem"/>
        </div>
       
        <xsl:apply-templates select="ce:OrderRequestPaperItem"/>
        
        <div class="row border">
            <xsl:apply-templates  mode="mdRow" select="ce:ItemOut"/>
        </div>
    </xsl:template>
    

    <xsl:template mode="mdTableOpt" match="ce:DocumentReference">
        <!-- no table or div/@id=docRef generated if none ce:DocumentReference -->
        <div id="docRef" class="container border" ce="request docRef">
            <xsl:apply-templates mode="mdRow" select="."/>
        </div>
    </xsl:template>

</xsl:stylesheet>
