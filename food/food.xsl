<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:variable name="weekday" select="1"/>    
    <!--start root template -->
    <xsl:template match="/">
        <html>
            <body>
                <h2>Weekly Food Purchase</h2>
                Total Number of Purchased Items: <xsl:value-of select="sum(week/weekday/items/item/@qty)"/>
                <p></p>
                1. Eggs:
                <ul>
                    <li>Total Number of Eggs:
                        
                        <xsl:value-of select="sum(week/weekday/items/item[@name='egg']/@qty)"/>
                    </li>
                    <li>Total Amount Spent:
                        <xsl:value-of select="sum(week/weekday/items/item[@name='egg']/@qty) * week/weekday/items/item[@name='egg']/@price"/>
                        
                    </li>
                </ul>
                Purchase Days: <xsl:value-of select="count(week/weekday)"/><br/>
                
                2. Weekday with no purchase:
                
                <p></p>
                3. Cheese Purchase Days: 
                <xsl:for-each select="week/weekday">
                    <xsl:for-each select="items/item">
                        <xsl:if test="@name='cheese'">
                            <xsl:value-of select="../../@name"/>&#160;   
                        </xsl:if>
                    </xsl:for-each>
                </xsl:for-each>
                <p></p>
                4. The day with highest spent:
                <p></p>
                Entire Week:
                <xsl:for-each select="week/weekday">
                    <ul>
                        <li>
                            Weekday: <xsl:value-of select="@name"/><br/>
                            items:<br/>
                            <xsl:for-each select="items/item">
                                name: <xsl:value-of select="@name"/>,
                                qty: <xsl:value-of select="@qty"/>,
                                price: <xsl:value-of select="@price"/>,
                                total:<xsl:value-of select="format-number(@qty * @price,'$#,###.00')"/>
                                <br/>
                            </xsl:for-each>
                        
                        </li>
                    </ul>
                    
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    <!-- end of root template -->
</xsl:stylesheet>