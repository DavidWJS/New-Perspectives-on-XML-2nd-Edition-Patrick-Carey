<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <table border = "1">
                    <tr><th colspan = "7">Car Inventory</th></tr>
                    <tr>
                        <th>Picture</th>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Year</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total Sales</th>
                    </tr>
                    <xsl:apply-templates select="cars/car"/>
                </table>
                <p></p>
                2. Total Sales:
                <xsl:call-template name="totalsales">
                    <xsl:with-param name="list" select="cars/car"/>
                </xsl:call-template>
                <br/>
                Total Toyota Sales:
                <xsl:call-template name="totalsales">
                    <xsl:with-param name="list" select="cars/car[@brand='Toyota']"/>
                </xsl:call-template>
                <p></p>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="car">
        <tr>
            <td><img src="{pic}"/></td>
            <td><xsl:value-of select="@brand"/></td>
            <td><xsl:value-of select="@model"/></td>
            <td><xsl:value-of select="year"/></td>
            <td><xsl:value-of select="qty"/></td>
            <td><xsl:value-of select="price"/></td>
            <td><xsl:value-of select="qty * price"/></td>
        </tr>
    </xsl:template>
    <xsl:template name="totalsales">
        <xsl:param name="list"/>
        <xsl:param name="total" select="0"/>
        <xsl:choose>
            <xsl:when test="$list">
                <xsl:variable name="sales" select="$list[1]/qty * $list[1]/price"/>
                <xsl:call-template name="totalsales">
                    <xsl:with-param name="list" select="$list[position() > 1]"/>
                    <xsl:with-param name="total" select="$sales + $total"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="format-number($total, '$#,###,###')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>