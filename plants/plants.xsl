<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <table border="1">
                    <tr>
                        <th colspan="6">Catalog - All Plants</th>
                    </tr>
                    <tr>
                        <th>Common</th>
                        <th>Botanical</th>
                        <th>Zone</th>
                        <th>Light</th>
                        <th>Price</th>
                        <th>Availability</th>
                    </tr>
                    <xsl:apply-templates select="CATALOG/PLANT"/>
                </table>
                <p></p>
                <hr/>
                <table border="1">
                    <tr>
                        <th colspan="6">1. The most expensive plant:</th>
                    </tr>
                    <tr>
                        <th>Common</th>
                        <th>Botanical</th>
                        <th>Zone</th>
                        <th>Light</th>
                        <th>Price</th>
                        <th>Availability</th>
                    </tr>
                    <xsl:for-each select="CATALOG/PLANT">
                        <xsl:sort select="PRICE" order="descending"/>
                            <xsl:if test="position() = 1">
                                <tr>
                                    <td><xsl:value-of select="COMMON"/></td>
                                    <td><xsl:value-of select="BOTANICAL"/></td>
                                    <td><xsl:value-of select="ZONE"/></td>
                                    <td><xsl:value-of select="LIGHT"/></td>
                                    <td><xsl:value-of select="PRICE"/></td>
                                    <td><xsl:value-of select="AVAILABILITY"/></td>
                                </tr>
                            </xsl:if>
                    </xsl:for-each>
                </table>
                <p></p>
                <hr/>
                <table border="1">
                    <tr>
                        <th colspan="6">2. The most cheapest plant:</th>
                    </tr>
                    <tr>
                        <th>Common</th>
                        <th>Botanical</th>
                        <th>Zone</th>
                        <th>Light</th>
                        <th>Price</th>
                        <th>Availability</th>
                    </tr>
                    <xsl:for-each select="CATALOG/PLANT">
                        <xsl:sort select="PRICE" order="ascending"/>
                            <xsl:if test="position() = 1">
                                <tr>
                                    <td><xsl:value-of select="COMMON"/></td>
                                    <td><xsl:value-of select="BOTANICAL"/></td>
                                    <td><xsl:value-of select="ZONE"/></td>
                                    <td><xsl:value-of select="LIGHT"/></td>
                                    <td><xsl:value-of select="PRICE"/></td>
                                    <td><xsl:value-of select="AVAILABILITY"/></td>
                                </tr>
                            </xsl:if>
                    </xsl:for-each>
                </table> 
                <p></p>
                <hr/>
                <table border="1">
                    <tr>
                        <th colspan="6">3. Sunny Plants:</th>
                    </tr>
                    <tr>
                        <th>Common</th>
                        <th>Botanical</th>
                        <th>Zone</th>
                        <th>Light</th>
                        <th>Price</th>
                        <th>Availability</th>
                    </tr>
                    <xsl:apply-templates select="CATALOG/PLANT[contains(LIGHT, 'Sun')]"/>
                </table> 
                <p></p>
                <hr/>
                <table border="1">
                    <tr>
                        <th colspan="6">4. Shade Plants:</th>
                    </tr>
                    <tr>
                        <th>Common</th>
                        <th>Botanical</th>
                        <th>Zone</th>
                        <th>Light</th>
                        <th>Price</th>
                        <th>Availability</th>
                    </tr>
                    <xsl:apply-templates select="CATALOG/PLANT[contains(LIGHT, 'Shad')]"/>
                </table> 
                <p></p>
                <hr/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="PLANT">
        <tr>
            <td><xsl:value-of select="COMMON"/></td>
            <td><xsl:value-of select="BOTANICAL"/></td>
            <td><xsl:value-of select="ZONE"/></td>
            <td><xsl:value-of select="LIGHT"/></td>
            <td><xsl:value-of select="PRICE"/></td>
            <td><xsl:value-of select="AVAILABILITY"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>