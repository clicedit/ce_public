<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ce="http://www.clicedit.org/schema_1.0" xmlns:i_d="http://internal/data" exclude-result-prefixes="ce i_d" version="1.0">
    <!-- info see parent 'ph_main.xsl' -->

    <!-- #H2# preinclude see 'ph_main.xsl'/'# common inclusion' -->

    <!-- #H2# TEMPLATE -->

    <!-- Cmt: Header  -->
    <xsl:template match="ce:DeliveryRequestHeader">
        <div class="container border">
            <div class="row border">
                <div class="col-12">
                    <xsl:call-template name="getSpanLabel">
                        <xsl:with-param name="aVal" select="'deliveryId'"/>
                    </xsl:call-template>
                    <xsl:value-of select="@deliveryId"/>
                    <xsl:text> </xsl:text>

                    <xsl:call-template name="getSpanLabel">
                        <xsl:with-param name="aVal" select="'partialDelivery'"/>
                    </xsl:call-template>
                    <xsl:call-template name="getLabel">
                        <xsl:with-param name="aVal" select="@partialDelivery"/>
                    </xsl:call-template>
                    <xsl:text> </xsl:text>

                    <xsl:call-template name="getSpanLabel">
                        <xsl:with-param name="aVal" select="'realShippingDate'"/>
                    </xsl:call-template>
                    <xsl:value-of select="@realShippingDate"/>
                    <xsl:text> </xsl:text>

                    <xsl:call-template name="getSpanLabel">
                        <xsl:with-param name="aVal" select="'expectedDeliveryDate'"/>
                    </xsl:call-template>
                    <xsl:value-of select="@expectedDeliveryDate"/>
                    <xsl:text> </xsl:text>

                </div>
            </div>
            <xsl:call-template name="buyerBillTo_mdRow"/>

            <xsl:call-template name="SupplierShipTo_mdRow"/>
        </div>

        <!--Cmt: [//] Contact Liste par catagories :   -->
        <div id="contactList" class="container border-top">
            <xsl:call-template name="tplContactList_multiCol"/>
        </div>

        <xsl:apply-templates mode="mdTableOpt" select="./ce:DocumentReference"/>

        <div class="container border">
            <div class="row border">
                <div class="col-12">
                    <xsl:call-template name="nLoopExceptBr">
                        <!-- Packing + AttachmentReference -->
                        <xsl:with-param name="aExcept">!Buyer!ShipTo!Contact!Supplier!ShipTo!IdReference!Extrinsic!</xsl:with-param>
                    </xsl:call-template>
                </div>
            </div>
        </div>

        <xsl:apply-templates select="ce:DeliveryItem"/>

        <div class="container border">
            <xsl:apply-templates mode="mdRow" select="ce:Comment"/>
            <xsl:call-template name="refIntExt_mdRow"/>
        </div>
    </xsl:template>


    <!-- Cmt: mode="mdDelivery" or 'ce:DeliveryItem/ce:OrderRequestPrintItem'  -->
    <xsl:template mode="mdDelivery" match="ce:OrderRequestPaperItem">

        <div class="br">
            <xsl:value-of select="concat('[', @lineItemId, '] ', ce:PaperArticleNumber, ' ', ce:ProductDescription)"/>
        </div>

        <xsl:choose>
            <!-- cmt: check Quantity -->
            <xsl:when test="not(../ce:Quantity)"/>
            <xsl:when test="not(ce:OrderedQuantity)"/>
            <xsl:when test="../ce:Quantity = ce:OrderedQuantity"/>
            <xsl:otherwise>
                <error msg="diff quantities" delItemQuantity="{concat(../ce:Quantity, ' ', ../ce:Quantity/@unit)}" orderedQuantity="{concat(ce:OrderedQuantity, ' ', ce:OrderedQuantity/@unit)}"/>
            </xsl:otherwise>
        </xsl:choose>

        <div class="ce_stDetail">
            <xsl:call-template name="nLoopExceptBr">
                <xsl:with-param name="aExcept">!OrderRequestPaperItem!ProductDescription!PaperArticleNumber!OrderedQuantity!Quantity!Packing!UnitWeight!TotalWeight!</xsl:with-param>
            </xsl:call-template>
        </div>
    </xsl:template>



    <xsl:template name="tplDeliveryItemPaper">
        <!-- todo -->
        <div class="container">
            <xsl:for-each select="ce:DeliveryItem">
                <xsl:if test="1 = position()">
                    <div class="row border bg-secondary text-white align-items-center">
                        <div class="col-6" ce="*[1]">
                            <xsl:call-template name="getLabel">
                                <xsl:with-param name="aVal" select="'OrderRequestPaperItem'"/>
                            </xsl:call-template>
                        </div>
                        <div class="col-3" ce="Packing">
                            <xsl:call-template name="getLabel">
                                <xsl:with-param name="aVal" select="'Packing'"/>
                            </xsl:call-template>
                        </div>
                        <div class="col-1" ce="Quantity">
                            <xsl:call-template name="getLabel">
                                <xsl:with-param name="aVal" select="'Quantity'"/>
                            </xsl:call-template>
                        </div>
                        <div class="col-1" ce="UnitWeight">
                            <xsl:call-template name="getLabel">
                                <xsl:with-param name="aVal" select="'UnitWeight'"/>
                            </xsl:call-template>
                        </div>
                        <div class="col-1" ce="TotalWeight">
                            <xsl:call-template name="getLabel">
                                <xsl:with-param name="aVal" select="'TotalWeight'"/>
                            </xsl:call-template>
                        </div>
                    </div>
                </xsl:if>
                <div class="row border">
                    <div class="col-6" ce="*[1]">
                        <xsl:choose>
                            <xsl:when test="ce:OrderRequestPaperItem">
                                <xsl:apply-templates mode="mdDelivery" select="ce:OrderRequestPaperItem"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="tplEmptyCell"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                    <div class="col-3" ce="Packing">
                        <xsl:choose>
                            <xsl:when test="ce:OrderRequestPaperItem/ce:GeneralPaperPacking">
                                <xsl:apply-templates select="ce:OrderRequestPaperItem/ce:GeneralPaperPacking"/>
                            </xsl:when>
                            <xsl:when test="ce:Packing">
                                <xsl:apply-templates select="ce:Packing"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="tplEmptyCell"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                    <div class="col-1" ce="Quantity">
                        <xsl:choose>
                            <xsl:when test="ce:OrderRequestPaperItem/ce:OrderedQuantity">
                                <xsl:apply-templates select="ce:OrderRequestPaperItem/ce:OrderedQuantity" mode="md_n10"/>
                            </xsl:when>
                            <xsl:when test="ce:Quantity">
                                <xsl:apply-templates select="ce:Quantity" mode="md_n10"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="tplEmptyCell"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                    <div class="col-1" ce="UnitWeight">
                        <xsl:choose>
                            <xsl:when test="ce:UnitWeight">
                                <xsl:apply-templates select="ce:UnitWeight"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="tplEmptyCell"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                    <div class="col-1" ce="TotalWeight">
                        <xsl:choose>
                            <xsl:when test="ce:TotalWeight">
                                <xsl:apply-templates select="ce:TotalWeight"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="tplEmptyCell"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>





    <xsl:template name="tplDeliveryItemNotPaper">
        <div class="container">
            <xsl:for-each select="ce:DeliveryItem">
                <xsl:if test="1 = position()">
                    <div class="row border bg-secondary text-white align-items-center">
                        <div class="col-6" ce="*[1]">
                            <xsl:for-each select="*[1]">
                                <xsl:call-template name="textLabelByTagName"/>
                            </xsl:for-each>
                        </div>
                        <div class="col-3" ce="Packing">
                            <xsl:call-template name="getLabel">
                                <xsl:with-param name="aVal" select="'Packing'"/>
                            </xsl:call-template>
                        </div>
                        <div class="col-1" ce="Quantity">
                            <xsl:call-template name="getLabel">
                                <xsl:with-param name="aVal" select="'Quantity'"/>
                            </xsl:call-template>
                        </div>
                        <div class="col-1" ce="UnitWeight">
                            <xsl:call-template name="getLabel">
                                <xsl:with-param name="aVal" select="'UnitWeight'"/>
                            </xsl:call-template>
                        </div>
                        <div class="col-1" ce="TotalWeight">
                            <xsl:call-template name="getLabel">
                                <xsl:with-param name="aVal" select="'TotalWeight'"/>
                            </xsl:call-template>
                        </div>
                    </div>
                </xsl:if>

                <div class="row border">
                    <div class="col-6" ce="*[1]">
                        <xsl:apply-templates select="*[1]"/>
                        <div class="ce_stDetail">
                            <xsl:call-template name="nLoopExceptBr">
                                <xsl:with-param name="aExcept" select="concat('!', local-name(*[1]), '!Quantity!Packing!UnitWeight!TotalWeight!Comment!Extrinsic!')"/>
                            </xsl:call-template>
                        </div>
                    </div>
                    <div class="col-3" ce="Packing">
                        <xsl:choose>
                            <xsl:when test="ce:Packing">
                                <xsl:apply-templates select="ce:Packing"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="tplEmptyCell"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                    <div class="col-1" ce="Quantity">
                        <xsl:choose>
                            <xsl:when test="ce:Quantity">
                                <xsl:apply-templates select="ce:Quantity" mode="md_n10"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="tplEmptyCell"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                    <div class="col-1" ce="UnitWeight">
                        <xsl:choose>
                            <xsl:when test="ce:UnitWeight">
                                <xsl:apply-templates select="ce:UnitWeight"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="tplEmptyCell"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                    <div class="col-1" ce="TotalWeight">
                        <xsl:choose>
                            <xsl:when test="ce:TotalWeight">
                                <xsl:apply-templates select="ce:TotalWeight"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="tplEmptyCell"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>



    <!-- Cmt_Block 'DeliveryItem' -->
    <xsl:template name="tplDeliveryItem_mdBloc">
        <xsl:choose>
            <xsl:when test="ce:DeliveryItem/ce:OrderRequestPaperItem">
                <xsl:call-template name="tplDeliveryItemPaper"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="tplDeliveryItemNotPaper"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!-- Cmt_Block 'DeliveryRequest' -->
    <xsl:template name="tplDeliveryRequest">
        <xsl:if test="starts-with($i_doc_type, 'dt_DeliveryRequest')">
            <xsl:for-each select="./ce:Request/ce:DeliveryRequest">
                <!-- Cmt_Push: body -->

                <xsl:call-template name="nLoopExceptBr">
                    <!-- call : DeliveryRequestHeader  -->
                    <xsl:with-param name="aExcept">!DeliveryItem!Comment!Extrinsic!</xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="tplDeliveryItem_mdBloc"/>

                <!--Cmt row ce:Extrinsic + ce:Comment -->
                <div class="container border">
                    <xsl:call-template name="refIntExt_mdRow"/>
                    <xsl:apply-templates mode="mdRow" select="ce:Comment"/>
                </div>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>



</xsl:stylesheet>
