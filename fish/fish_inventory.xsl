<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head></head>
            <body>
                <table border="1">
                    <tr><th colspan="6">Fish Inventory</th></tr>
                    <tr>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Unit Price</th>
                        <th>Fish Quantity per Box</th>
                        <th>Number of Boxes</th>
                        <th>Cost</th>
                    </tr>
                    <xsl:apply-templates select="fishes/fish"/>
                    <tr>
                        <td colspan="5" align="right">Total Cost</td>
                        <td>
                            <xsl:call-template name="totalcost">
                                <xsl:with-param name="list" select="fishes/fish"/>
                            </xsl:call-template>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="fish">
        <tr>
            <td><img src="{pic}"/></td>
            <td><xsl:value-of select="@name"/></td>
            <td><xsl:value-of select="unitprice"/></td>
            <td><xsl:value-of select="boxqty"/></td>
            <td><xsl:value-of select="box"/></td>
            <td><xsl:value-of select="format-number(unitprice * boxqty * box, '$###,###.##')"/></td>
        </tr>
    </xsl:template>
    <xsl:template name="totalcost">
        <xsl:param name="list"/>
        <xsl:param name="total" select="0"/>
        <xsl:choose>
            <xsl:when test="$list">
                <!-- create variable for the individual costs -->
                <xsl:variable name="eachfishcost" select="$list[1]/unitprice * $list[1]/boxqty * $list[1]/box"/>
                <!-- calling the template (recursively) -->
                <xsl:call-template name="totalcost">
                    <xsl:with-param name="list" select="$list[position() > 1]"/>
                    <xsl:with-param name="total" select="$eachfishcost + $total"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="format-number($total, '$###,###.##')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
