<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h2>Dealership</h2>
                <xsl:for-each select="cars/car">
                    <ul>
                        <li>
                            Brand: <xsl:value-of select="@brand"/><br/>
                            Model: <xsl:value-of select="@model"/><br/>
                        </li>
                        <ul>
                            Year:<xsl:value-of select="year"/><br/>
                            Qty:<xsl:value-of select="qty"/><br/>
                            Price:<xsl:value-of select="price"/><br/>
                            <img src="{pic}"/><br/>
                            Total Sales:<xsl:value-of select="qty * price"/>
                        </ul>
                    </ul>
                </xsl:for-each>
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
                3. The car has highest price:
                <br/>
                <xsl:for-each select="cars/car">
                    <xsl:sort select="price" order="descending"/>
                    <xsl:if test = "position() = 1">
                        Brand: <xsl:value-of select="@brand"/><br/>
                        Model: <xsl:value-of select="@model"/><br/>
                        Year: <xsl:value-of select="year"/><br/>
                        Price: <xsl:value-of select = "price"/><br/>
                     </xsl:if>
                </xsl:for-each>
                <p></p>
                The car has lowest price:
                <br/>
                <xsl:for-each select="cars/car">
                    <xsl:sort select="price" order="ascending"/>
                    <xsl:if test = "position() = 1">
                        Brand: <xsl:value-of select="@brand"/><br/>
                        Model: <xsl:value-of select="@model"/><br/>
                        Year: <xsl:value-of select="year"/><br/>
                        Price: <xsl:value-of select = "price"/><br/>
                     </xsl:if>
                </xsl:for-each>
                <p></p>
                4. Number of cars before 2017:
                <xsl:value-of select="count(cars/car[year &lt; 2017])"/>
                <p></p>
                5. The model of car with the lowest quantity in stock:
                <br/>
                <xsl:for-each select="cars/car">
                    <xsl:sort select="qty" order="ascending"/>
                    <xsl:if test = "position() = 1">
                        Brand: <xsl:value-of select="@brand"/><br/>
                        Model: <xsl:value-of select="@model"/><br/>
                        Year: <xsl:value-of select="year"/><br/>
                        Quentity: <xsl:value-of select = "qty"/><br/>
                     </xsl:if>
                </xsl:for-each>
                <p></p>
            </body>
        </html>
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