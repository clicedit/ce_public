<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ce="http://www.clicedit.org/schema_1.0" exclude-result-prefixes="ce" version="1.0">
    <!-- info see parent 'ph_main.xsl' -->

    <!-- #H2# preinclude see 'ph_main.xsl'/'# common inclusion' -->   
    
    <!-- #H2# TEMPLATE -->

    
    <xsl:template mode="NotUsed" match="ce:OrderRequestHeader">
        <xsl:call-template name="getSpanLabel">
            <xsl:with-param name="aVal" select="'orderType'"/>
        </xsl:call-template>
        <xsl:variable name="kOrderType">
            <xsl:choose>
                <xsl:when test="'' != @orderType">
                    <xsl:value-of select="concat('ot_', @orderType)"/>
                </xsl:when>
                <xsl:otherwise>ot_new</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:call-template name="getLabel">
            <xsl:with-param name="aVal" select="string($kOrderType)"/>
        </xsl:call-template>
        <xsl:text>, </xsl:text>
        <xsl:call-template name="getSpanLabel">
            <xsl:with-param name="aVal" select="'type'"/>
        </xsl:call-template>
        <xsl:variable name="kType">
            <xsl:choose>
                <xsl:when test="'' != @type">
                    <xsl:value-of select="concat('type_', @type)"/>
                </xsl:when>
                <xsl:otherwise>type_new</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:call-template name="getLabel">
            <xsl:with-param name="aVal" select="string($kType)"/>
        </xsl:call-template>
        <xsl:text>, </xsl:text>
        <xsl:call-template name="getSpanLabel">
            <xsl:with-param name="aVal" select="'shipComplete'"/>
        </xsl:call-template>
        <xsl:call-template name="getLabel">
            <xsl:with-param name="aVal" select="string(@shipComplete)"/>
        </xsl:call-template>
    </xsl:template>
    
    
    
    <xsl:template name="tplOrderRequest">
        <xsl:if test="'dt_OrderRequest' = $i_doc_dt and ./ce:Request/ce:OrderRequest">

            <xsl:for-each select="./ce:Request/ce:OrderRequest/ce:OrderRequestHeader">
                
                <!-- Cmt_Pull: [OrderRequestHeader] Buyer + BillTo  -->
                <div id="OrderRequestHeader" class="container">
                    <xsl:call-template name="buyerBillTo_mdRow"/>
                </div>

                <!--Cmt: [//] Contact Liste par catagories :   -->
                <div id="contactList" class="container border-top">
                    <xsl:call-template name="tplContactList_multiCol"/>
                </div>

                <!-- Cmt: [OrderRequestHeader]  QuotationDetailOrder -->
                <xsl:apply-templates select="./ce:QuotationDetailOrder"/>

                <!--Cmt: [OrderRequestHeader] DocumentReference  -->
                <div id="docRef" class="container border-top">
                    <xsl:apply-templates mode="mdRow" select="./ce:DocumentReference"/>
                </div>
                <!--Cmt: [OrderRequestHeader] AttachmentReference -->
                <xsl:for-each select="./ce:AttachmentReference">
                    <div id="attRef" class="container border-top">
                        <div class="row justify-content-between">
                            <div class="col-12">
                                <xsl:apply-templates select="."/>
                            </div>
                        </div>
                    </div>
                </xsl:for-each>

                <!--Cmt: Total + Tax + PaymentTerms-->
                <div id="Payment" class="container border-top">
                    <xsl:apply-templates mode="mdRow" select="ce:Total"/>
                    <xsl:for-each select="./ce:Tax">
                        <xsl:apply-templates mode="mdRow" select="."/>
                        <xsl:call-template name="refIntExt_mdRow"/>
                    </xsl:for-each>

                    <xsl:apply-templates mode="mdRow" select="ce:PaymentTerms"/>
                </div>

                <xsl:if test="ce:PaymentTerms or ce:TermOfSales">
                    <!-- Cmt: [OrderRequestHeader] paymentTerms/InvoiceInstructions + TermOfSales-->
                    <div id="InvoiceInstructions" class="container border-top">
                        <div class="row">
                            <div class="col-2">
                                <xsl:call-template name="getSpanLabel">
                                    <xsl:with-param name="aVal" select="'InvoiceInstructions'"/>
                                </xsl:call-template>
                            </div>
                            <div class="col-10">
                                <xsl:call-template name="tplHtmlLike">
                                    <xsl:with-param name="aVal" select="./ce:PaymentTerms/ce:InvoiceInstructions"/>
                                </xsl:call-template>
                            </div>
                        </div>
                        <xsl:apply-templates mode="mdRow" select="ce:TermOfSales"/>
                    </div>
                </xsl:if>

                <xsl:if test="ce:DeliveryPeriod">
                    <div id="DeliveryPeriod" class="container border-top">
                        <div class="row">
                            <div class="col-3">
                                <xsl:call-template name="getSpanLabel">
                                    <xsl:with-param name="aVal" select="'DeliveryPeriod'"/>
                                </xsl:call-template>
                            </div>
                            <div class="col-3">
                                <xsl:value-of select="./ce:DeliveryPeriod/ce:Period/@startDate"/>
                            </div>
                            <div class="col-3">
                                <xsl:value-of select="./ce:DeliveryPeriod/ce:Period/@endDate"/>
                            </div>
                        </div>
                    </div>
                </xsl:if>

                <!--Cmt: supress TermsOfDelivery ?? -->
                <xsl:if test="./ce:TermsOfDelivery">
                    <div id="TermsOfDelivery" class="container border-top">
                        <div class="row">
                            <div class="col-3">
                                <xsl:call-template name="getSpanLabel">
                                    <xsl:with-param name="aVal" select="'TermsOfDelivery'"/>
                                </xsl:call-template>
                            </div>
                            <div class="col-3">
                                <xsl:value-of select="./ce:TermsOfDelivery/ce:TermsOfDeliveryCode"/>
                            </div>
                            <div class="col-3">
                                <xsl:value-of select="./ce:DeliveryPeriod/ce:ShippingPaymentMethod"/>
                            </div>
                        </div>
                    </div>
                </xsl:if>

                <!--Cmt: [OrderRequestHeader] Comment + IdReference + Extrinsic -->
                <div class="container border-top">
                    <xsl:apply-templates mode="mdRow" select="ce:Comment"/>
                    <xsl:call-template name="refIntExt_mdRow"/>
                </div>

            </xsl:for-each>


            <xsl:for-each select="./ce:Request">
                <!--Cmt_Pull: [OrderRequest] OrderRequest*Item -->
                <div id="aItems"><!-- for nav --></div>
                <xsl:for-each select="./ce:OrderRequest">
                    <xsl:apply-templates select="ce:OrderRequestPrintItem | ce:OrderRequestPaperItem | ce:OrderRequestPrepressItem"/>
                </xsl:for-each>

                <!--Cmt: [// > OrderRequest > ItemOut ][niv] -->                
                <div id="aItemOut" class="container border-top">
                    <xsl:for-each select="./ce:OrderRequest/ce:ItemOut">
                        <div class="row bg-secondary text-white">
                            <!-- cmt_itemout_a: delivery ; date ; date -->
                            <div class="col-4">
                                <xsl:value-of select="concat('[', @itemOutId, ']')"/>
                                <!-- @depracated
                                    <xsl:choose>
                                    <xsl:when test="@isDeliveryCompleted = 'no'">
                                        <xsl:call-template name="getLabel">
                                            <xsl:with-param name="aVal">Partial delivery</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name="getLabel">
                                            <xsl:with-param name="aVal">Complete delivery</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:otherwise>
                                </xsl:choose>
                                -->
                            </div>
                            <div class="col-4">
                                <xsl:call-template name="getSpanLabel">
                                    <xsl:with-param name="aVal">requestedDeliveryDate</xsl:with-param>
                                </xsl:call-template>
                                <xsl:value-of select="@requestedDeliveryDate"/>
                            </div>
                            <div class="col-4">
                                <xsl:call-template name="getSpanLabel">
                                    <xsl:with-param name="aVal">requestedShipmentDate</xsl:with-param>
                                </xsl:call-template>
                                <xsl:value-of select="@requestedShipmentDate"/>
                            </div>
                        </div>

                        <div class="row">
                            <!-- cmt_itemout_b: ShipmentItems ; ShipTO+Contact ; Tolerances; Packing -->
                            <div class="col-4">
                                <xsl:for-each select="./ce:ShipmentItems/ce:ShipmentItem">
                                    <xsl:value-of select="concat('[', ce:ItemId/ce:LineItemId/@identifier, ']')"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:call-template name="getSpanLabel">
                                        <xsl:with-param name="aVal">Quantity</xsl:with-param>
                                    </xsl:call-template>
                                    <xsl:apply-templates select="ce:Quantity" mode="md_n10"/>
                                    <br/>
                                    <xsl:for-each select="ce:ItemId[1]">
                                        <xsl:call-template name="lst_IdReference"/>
                                    </xsl:for-each>
                                    <br/>
                                </xsl:for-each>
                            </div>
                            <div class="col-3">
                                <xsl:apply-templates select="ce:ShipTo | ce:Contact" mode="mdHeader"/>
                            </div>
                            <div class="col-2">
                                <xsl:apply-templates select="ce:Tolerances"/>
                            </div>
                            <div class="col-3">
                                <xsl:apply-templates select="ce:Packing"/>
                            </div>
                        </div>
                        <xsl:call-template name="refIntExt_mdRow"/>
                        <xsl:apply-templates mode="mdRow" select="ce:Comment"/>
                    </xsl:for-each>
                </div>


                <!--Cmt: [// > delete ]-->                               
                <xsl:if test="'delete' = $i_doc_t3">
                    <div class="container bg-secondary text-white">
                        <div class="row">
                            <div class="col-12 text-center pt-4 pb-4 mt-4 mb-4">                                
                                <h1>
                                <xsl:call-template name="getLabel">
                                    <xsl:with-param name="aVal" select="'delete'"/>
                                </xsl:call-template>
                                </h1>
                            </div>
                        </div>
                    </div>
                </xsl:if>

                <!--Cmt [// > OrderRequest] ce:Extrinsic + ce:Comment -->
                <div id="orderRequestEnd" class="container border-top">
                    <xsl:call-template name="refIntExt_mdRow"/>
                    <xsl:apply-templates select="ce:Comment" mode="mdRow"/>
                </div>

            </xsl:for-each>
        </xsl:if>
    </xsl:template>


</xsl:stylesheet>
