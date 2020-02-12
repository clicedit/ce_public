<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ce="http://www.clicedit.org/schema_1.0" xmlns:i_d="http://internal/data" exclude-result-prefixes="ce i_d" version="1.0">
    <!-- info see parent 'ph_main.xsl' -->

    <!-- #H2# preinclude see 'ph_main.xsl'/'# common inclusion' -->   
    
    <!-- #H2# TEMPLATE -->

    <xsl:template match="ce:InvoiceDetailRequestHeader">
        
        <div class="container border">
            <div id="docAtt" class="row border">
                <div class="col-12">
                    <xsl:apply-templates mode="mdAttOpt" select="@invoiceId|@invoiceDate|@isInformationOnly|@purpose|@operation|@dueDate"/>
                </div>
            </div>
            <xsl:call-template name="buyerBillTo_mdRow"/>


            <div class="row border">
                <div class="col-6">
                    <xsl:apply-templates mode="mdHeader" select="ce:Supplier"/>
                </div>
                <div class="col-6">
                    <xsl:apply-templates mode="mdHeader" select="ce:ShipTo"/>
                </div>
            </div>
        </div>

        <!--Cmt: [//] Contact Liste par catagories :   -->
        <div id="contactList" class="container border-top">
            <xsl:call-template name="tplContactList_multiCol"/>
        </div>

        <!--Cmt:   -->
        <div class="container border">
            <div class="row border">
                <div class="col-12">
                    <xsl:call-template name="nLoopExceptBr">
                        <xsl:with-param name="aExcept">!Buyer!BillTo!Contact!Supplier!ShipTo!Comment!Penalties!IdReference!Extrinsic!</xsl:with-param>
                    </xsl:call-template>
                </div>
            </div>
            <xsl:apply-templates mode="mdRow" select="ce:Penalties"/>
            <xsl:apply-templates mode="mdRow" select="ce:Comment"/>
            <xsl:call-template name="refIntExt_mdRow"/>
        </div>
    </xsl:template>



    <!-- Cmt_Block 'InvoiceDetailOrder_type' -->
    <xsl:template match="ce:InvoiceDetailOrder | ce:QuotationDetailOrder">
        <div id="aItems" class="container">
            <div class="row border bg-secondary text-white">
                <div class="col-12">
                    <xsl:call-template name="labelByTagName"/>
                </div>
            </div>
            <xsl:for-each select="ce:InvoiceDetailOrderInfo">
                <xsl:apply-templates mode="mdRow" select="ce:DocumentReference | ce:OrderReference | ce:InvoiceReference | ce:MasterAgreementReference | ce:QuotationReference"/>
                <xsl:apply-templates mode="mdRow" select="ce:OrderDesc"/>
                <xsl:call-template name="refIntExt_mdRow"/>
                <!-- N/A allExcep -->
            </xsl:for-each>
            <xsl:for-each select="ce:InvoiceDetailItem">
                <!-- header -->
                <xsl:if test="position() = 1">
                    <div class="row font-weight-bold">
                        <div class="col-6">
                            <xsl:call-template name="getLabel">
                                <xsl:with-param name="aList" select="'InvoiceDetailItem'"/>
                                <xsl:with-param name="aVal" select="'Description'"/>
                            </xsl:call-template>
                        </div>
                        <div class="col-2 text-center">
                            <xsl:call-template name="getLabel">
                                <xsl:with-param name="aVal" select="'Quantity'"/>
                            </xsl:call-template>
                        </div>
                        <div class="col-2">
                            <xsl:call-template name="getLabel">
                                <xsl:with-param name="aVal" select="'UnitPrice'"/>
                            </xsl:call-template>
                        </div>
                        <div class="col-2">
                            <xsl:call-template name="getLabel">
                                <xsl:with-param name="aList" select="'InvoiceDetailItem'"/>
                                <xsl:with-param name="aVal" select="'SubtotalAmount'"/>
                            </xsl:call-template>
                        </div>
                    </div>
                </xsl:if>
                <div class="row border">
                    <div class="col-1">
                        <xsl:choose>
                            <xsl:when test="'item' = @itemType">
                                <xsl:value-of select="concat('[', @parentInvoiceLineNumber, '.', @invoiceLineNumber, '] ')"/>
                            </xsl:when>
                            <xsl:when test="'composite' = @itemType">
                                <xsl:value-of select="concat('[', @invoiceLineNumber, '] ')"/>
                            </xsl:when>
                        </xsl:choose>
                    </div>
                    <div class="col-5">
                        <xsl:apply-templates select="ce:InvoiceDetailItemReference"/>
                        <div class="ce_stDetail">
                            <xsl:call-template name="nLoopExceptBr">
                                <xsl:with-param name="aExcept">!InvoiceDetailItemReference!Quantity!UnitPrice!SubtotalAmount!</xsl:with-param>
                            </xsl:call-template>
                        </div>
                    </div>
                    <div class="col-1 text-right">
                        <xsl:value-of select="ce:Quantity"/>
                    </div>
                    <div class="col-1 text-left ">
                        <xsl:value-of select="ce:Quantity/@unit"/>
                    </div>
                    <div class="col-1 text-right">
                        <xsl:value-of select="ce:UnitPrice/ce:Money"/>
                    </div>
                    <div class="col-1 text-left ">
                        <xsl:value-of select="ce:UnitPrice/ce:Money/@currency"/>
                    </div>
                    <div class="col-1 text-right">
                        <xsl:value-of select="ce:SubtotalAmount/ce:Money"/>
                    </div>
                    <div class="col-1 text-left ">
                        <xsl:value-of select="ce:SubtotalAmount/ce:Money/@currency"/>
                    </div>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>





    <!-- Cmt_Block 'InvoiceDetailSummary_type' : TotalAmount, Tax, GrossAmount -->
    <xsl:template match="ce:InvoiceDetailSummary">
        <div id="aSummary" class="container">
            <div class="row border bg-secondary text-white">
                <div class="col-12 text-left">
                    <xsl:call-template name="labelByTagName"/>
                </div>
            </div>
            <xsl:for-each select="*">
                <div class="row border-bottom">
                    <xsl:choose>
                        <xsl:when test="'Tax' = local-name()">
                            <div class="col-8 text-right">
                                <xsl:call-template name="labelByTagName"/>
                                <xsl:if test="./ce:TaxDetail/@category">
                                    <span class="font-weight-bold">
                                        <xsl:call-template name="getLabel">
                                            <xsl:with-param name="aVal" select="./ce:TaxDetail/@category"/>
                                        </xsl:call-template>
                                    </span>
                                </xsl:if>
                            </div>
                            <div class="col-4 text-right">
                                <xsl:apply-templates select="."/>
                            </div>
                        </xsl:when>
                        <xsl:when test="'AdditionalMeasureDetail' = local-name()">
                            <xsl:if test="0 = count(preceding-sibling::ce:AdditionalMeasureDetail)">
                                <div class="col-8 text-right">
                                    <xsl:call-template name="labelByTagName"/>
                                </div>
                                <div class="col-4 text-right">
                                    <xsl:for-each select="../ce:AdditionalMeasureDetail">
                                        <div class="br">
                                        <xsl:call-template name="getLabel">
                                            <xsl:with-param name="aVal" select="@type"/>
                                        </xsl:call-template>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="."/>
                                        </div>
                                    </xsl:for-each>                                    
                                </div>
                            </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                            <div class="col-8 text-right">
                                <xsl:call-template name="labelByTagName"/>
                            </div>
                            <div class="col-4 text-right">
                                <xsl:apply-templates select="."/>
                            </div>
                        </xsl:otherwise>
                    </xsl:choose>
                </div>
            </xsl:for-each>
        </div>
        <br/>
    </xsl:template>



    <xsl:template match="ce:Tax">
        <!-- Tax : Money, Decription?, TaxDatail*, Extrinsic*  -->
        <div class="br">
            <xsl:if test="not(parent::ce:InvoiceDetailSummary)">
                <xsl:call-template name="labelByTagName"/>
            </xsl:if>
            <xsl:apply-templates select="ce:Description"/>
            <xsl:text> </xsl:text>
            <xsl:apply-templates select="ce:Money"/>
        </div>
        <div class="ce_stDetail text-right">
            <xsl:for-each select="ce:TaxDetail">
                <div class="br">
                    <xsl:apply-templates select="ce:Description"/>
                </div>
                <div class="br">
                    <xsl:for-each select="ce:TaxableAmount">
                        <xsl:if test="position() = 1">
                            <xsl:call-template name="labelByTagName"/>
                        </xsl:if>
                        <xsl:apply-templates select="."/>
                        <xsl:if test="position() != last">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </div>
            </xsl:for-each>
            <xsl:apply-templates select="ce:Extrinsic"/>
        </div>
    </xsl:template>



    <xsl:template name="tplInvoiceDetailRequest">
        <xsl:if test="starts-with($i_doc_type, 'dt_InvoiceDetailRequest')">
            <xsl:for-each select="./ce:Request/ce:InvoiceDetailRequest">
                <!-- Cmt_Push: body  -->

                <xsl:call-template name="nLoopExceptBr">
                    <!-- call : *Header + InvoiceDetailOrder + InvoiceDetailSummary -->
                    <xsl:with-param name="aExcept">!Comment!Extrinsic!</xsl:with-param>
                </xsl:call-template>

                <!--Cmt row ce:Extrinsic + ce:Comment -->
                <div class="container border">
                    <xsl:call-template name="refIntExt_mdRow"/>
                    <xsl:apply-templates mode="mdRow" select="ce:Comment"/>
                </div>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
