<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ce="http://www.clicedit.org/schema_1.0" xmlns:i_d="http://internal/data" exclude-result-prefixes="ce i_d" version="1.0">
    <!-- info see parent 'ph_main.xsl' -->


    <!-- #H6# VARIABLES 'i_doc_*' -->
    <!--
            Information global du document : 
* dt_* definir le type de document en fonction de son contenu :
** 'dt_ack.', 
** 'dt_OrderRequest.', @orderType, '.', @type
** 'dt_InvoiceDetailRequest.', @purpose, '.', @response
** 'dt_DeliveryRequest.', @partialDelivery , '.', 
** 'dt_StatusRequest.', fistChildName, '.', fistChild/@documentType 
** 'dt_StatusResponse.',fistChildName, '.', fistChild/@documentType 
** 'dt_Mouvement',mvt, '.', mvt // TODO
* l'id :
**
* la date :
** dateAttributName, '.', formatedDate
-->
    <xsl:variable name="i_doc_type">
        <xsl:choose>
            <xsl:when test="/ce:ClicEdit/ce:Response/ce:Status">dt_ack..</xsl:when>
            <xsl:when test="/ce:ClicEdit/ce:Request/ce:OrderRequest">
                <xsl:for-each select="/ce:ClicEdit/ce:Request/ce:OrderRequest/ce:OrderRequestHeader">
                    <xsl:value-of select="concat('dt_OrderRequest.', @orderType, '.', @type)"/>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="/ce:ClicEdit/ce:Request/ce:OrderRequestResponse">
                <xsl:for-each select="/ce:ClicEdit/ce:Request/ce:OrderRequestResponse">
                    <xsl:value-of select="concat('dt_', local-name(), '.', @orderType, '.', @type)"/>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="/ce:ClicEdit/ce:Request/ce:StatusRequest">
                <xsl:for-each select="/ce:ClicEdit/ce:Request/ce:StatusRequest">
                    <xsl:value-of select="concat('dt_', local-name(), '.', local-name(*[1]), '.', *[1]/@documentType)"/>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="/ce:ClicEdit/ce:Request/ce:StatusResponse">
                <xsl:for-each select="/ce:ClicEdit/ce:Request/ce:StatusResponse">
                    <xsl:value-of select="concat('dt_', local-name(), '.', local-name(*[1]), '.', *[1]/@documentType)"/>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="/ce:ClicEdit/ce:Request/ce:InvoiceDetailRequest">
                <xsl:for-each select="/ce:ClicEdit/ce:Request/ce:InvoiceDetailRequest/ce:InvoiceDetailRequestHeader">
                    <xsl:value-of select="concat('dt_InvoiceDetailRequest.', @purpose, '.')"/>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="/ce:ClicEdit/ce:Request/ce:InvoiceDetailRequestResponse">
                <xsl:for-each select="/ce:ClicEdit/ce:Request/ce:InvoiceDetailRequestResponse">
                    <xsl:value-of select="concat('dt_', local-name(), '.', @purpose, '.', @response)"/>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="/ce:ClicEdit/ce:Request/ce:DeliveryRequest">
                <xsl:for-each select="/ce:ClicEdit/ce:Request/ce:DeliveryRequest/ce:DeliveryRequestHeader">
                    <xsl:value-of select="concat('dt_DeliveryRequest.', @partialDelivery, '.')"/>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="/ce:ClicEdit/ce:Request[1]/ce:MovementRequest[1]">
                <xsl:value-of select="'dt_Movement.mvt.mvt'"/>
            </xsl:when>
            <xsl:otherwise>TODO_i_doc_type..</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:variable name="i_doc_dt" select="substring-before($i_doc_type, '.')"/>

    <xsl:variable name="i_doc_t2" select="substring-before(substring-after($i_doc_type, '.'), '.')"/>

    <xsl:variable name="i_doc_t3" select="substring-after(substring-after($i_doc_type, '.'), '.')"/>

    <xsl:variable name="i_doc_id">
        <xsl:choose>
            <xsl:when test="/ce:ClicEdit/ce:Response/ce:Status">
                <xsl:value-of select="/ce:ClicEdit/@payloadId"/>
            </xsl:when>
            <xsl:when test="/ce:ClicEdit/ce:Request/ce:OrderRequest">
                <xsl:value-of select="/ce:ClicEdit/ce:Request/ce:OrderRequest/ce:OrderRequestHeader/@orderId"/>
            </xsl:when>
            <xsl:when test="/ce:ClicEdit/ce:Request/ce:OrderRequestResponse">
                <xsl:value-of select="/ce:ClicEdit/ce:Request/ce:OrderRequestResponse/@orderId"/>
            </xsl:when>
            <xsl:when test="/ce:ClicEdit/ce:Request/ce:StatusRequest">
                <xsl:value-of select="/ce:ClicEdit/ce:Request/ce:StatusRequest/ce:*[1]/@documentId"/>
            </xsl:when>
            <xsl:when test="/ce:ClicEdit/ce:Request/ce:StatusResponse">
                <xsl:value-of select="/ce:ClicEdit/ce:Request/ce:StatusResponse/ce:*[1]/@documentId"/>
            </xsl:when>
            <xsl:when test="/ce:ClicEdit/ce:Request/ce:InvoiceDetailRequest">
                <xsl:value-of select="/ce:ClicEdit/ce:Request/ce:InvoiceDetailRequest/ce:InvoiceDetailRequestHeader/@invoiceId"/>
            </xsl:when>
            <xsl:when test="/ce:ClicEdit/ce:Request/ce:InvoiceDetailRequestResponse">
                <xsl:value-of select="/ce:ClicEdit/ce:Request/ce:InvoiceDetailRequestResponse/@invoiceId"/>
            </xsl:when>
            <xsl:when test="/ce:ClicEdit/ce:Request/ce:DeliveryRequest">
                <xsl:value-of select="/ce:ClicEdit/ce:Request/ce:DeliveryRequest/ce:DeliveryRequestHeader/@deliveryId"/>
            </xsl:when>
            <xsl:when test="/ce:ClicEdit/ce:Request[1]/ce:MovementRequest[1]/@id">
                <xsl:value-of select="/ce:ClicEdit/ce:Request[1]/ce:MovementRequest[1]/@id"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat('TODO_i_doc_id-', $i_doc_type)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>



    <xsl:variable name="i_doc_date">
        <xsl:variable name="vDateOri">
            <xsl:choose>
                <xsl:when test="false() and /ce:ClicEdit/ce:Response/ce:Status"> </xsl:when>
                <xsl:when test="string-length(/ce:ClicEdit/ce:Request/ce:OrderRequest/ce:OrderRequestHeader/@orderDate) &gt; 9">
                    <xsl:value-of select="concat('orderDate.',substring(/ce:ClicEdit/ce:Request/ce:OrderRequest/ce:OrderRequestHeader/@orderDate, 1, 10))"/>
                </xsl:when>
                <xsl:when test="string-length(/ce:ClicEdit/ce:Request/ce:OrderRequestResponse/@orderDate) &gt; 9">
                    <xsl:value-of select="concat('orderDate.', substring(/ce:ClicEdit/ce:Request/ce:OrderRequestResponse/@orderDate, 1, 10))"/>
                </xsl:when>
                <xsl:when test="string-length(/ce:ClicEdit/ce:Request/ce:StatusRequest/@statusRequestDate) &gt; 9">
                    <xsl:value-of select="concat('statusRequestDate.', substring(/ce:ClicEdit/ce:Request/ce:StatusRequest/@statusRequestDate, 1, 10))"/>
                </xsl:when>
                <xsl:when test="string-length(/ce:ClicEdit/ce:Request/ce:StatusResponse/@statusResponseDate) &gt; 9">
                    <xsl:value-of select="concat('statusResponseDate.', substring(/ce:ClicEdit/ce:Request/ce:StatusResponse/@statusResponseDate, 1, 10))"/>
                </xsl:when> 
                <xsl:when test="string-length(/ce:ClicEdit/ce:Request/ce:InvoiceDetailRequest/ce:InvoiceDetailRequestHeader/@invoiceDate) &gt; 9">
                    <xsl:value-of select="concat('invoiceDate.', substring(/ce:ClicEdit/ce:Request/ce:InvoiceDetailRequest/ce:InvoiceDetailRequestHeader[1]/@invoiceDate, 1, 10))"/>
                </xsl:when>
                <xsl:when test="string-length(/ce:ClicEdit/ce:Request/ce:InvoiceDetailRequestResponse/@invoiceDate) &gt; 9">
                    <xsl:value-of select="concat('invoiceDate.', substring(/ce:ClicEdit/ce:Request/ce:InvoiceDetailRequestResponse/@invoiceDate, 1, 10))"/>
                </xsl:when>
                <xsl:when test="false() and /ce:ClicEdit/ce:Request/ce:DeliveryRequest">
                    <!-- cmt: date : 'ce:DeliveryRequestHeader/@realShippingDate' or default rule --> </xsl:when>
                <!-- default -->
                <xsl:when test="string-length(/ce:ClicEdit/@timestamp) &gt; 9">
                    <xsl:value-of select="concat('timestamp.', substring(ce:ClicEdit/@timestamp, 1, 10))"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- in: payloadId="2019-07-23T07:58:20+01:00.MYPROCESS ID.222@wm-ce-qualif" -->
                    <xsl:value-of select="concat('payloadDate.', substring-before(/ce:ClicEdit/@payloadId, 'T'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="vDateFormted">
            <xsl:call-template name="getDateFormated">
                <xsl:with-param name="aVal" select="substring-after($vDateOri,'.')"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="vDOcDate">
            <xsl:value-of select="concat(substring-before($vDateOri,'.'),'.', $vDateFormted)"/>
        </xsl:variable>        
        <xsl:value-of select="$vDOcDate"/>
    </xsl:variable>

    <xsl:variable name="i_doc_code">
        <xsl:choose>
            <xsl:when test="/ce:ClicEdit/ce:Response/ce:Status">
                <xsl:value-of select="ce:ClicEdit/ce:Response/ce:Status/@code"/>
            </xsl:when>
            <xsl:otherwise>new</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>


    <xsl:variable name="i_doc_mode">
        <xsl:choose>
            <xsl:when test="/ce:ClicEdit/ce:Request/*[1]/@deploymentMode">
                <xsl:value-of select="/ce:ClicEdit/ce:Request/*[1]/@deploymentMode"/>
            </xsl:when>
            <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
    </xsl:variable>    
    
</xsl:stylesheet>
