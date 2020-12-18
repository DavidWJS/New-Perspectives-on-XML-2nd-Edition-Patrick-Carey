<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- start of root template -->
    <xsl:template match="/">
        <!-- creating web page -->
        <html>
            <body>
                <h2>Number Operations</h2>
                A = <xsl:value-of select="numbers/A"/> ,
                B = <xsl:value-of select="numbers/B"/> ,
                C = <xsl:value-of select="numbers/C"/>
                <p></p>
                A x B = <xsl:value-of select="numbers/A * numbers/B"/>
                <p></p>
                B / A = <xsl:value-of select="numbers/B div numbers/A"/>
                <br/> result is a decimal number
                <p></p>
                Rounding B / A = <xsl:value-of select="round(numbers/B div numbers/A)"/>
                <p></p>
                Using format-number for B / A = <xsl:value-of select="format-number(numbers/B div numbers/A, '#.##')"/>
                <p></p>
                <!-- B<sup>A</sup> = <xsl:value-of select="math:power($B, A)"/> -->
                C x B = <xsl:value-of select="numbers/C * numbers/B"/>
                Floor C x B = <xsl:value-of select="floor(numbers/C * numbers/B)"/>
                Ceiling C x B = <xsl:valut-of select="ceiling(numbers/C * numbers/B)"/>
            </body>
        </html>
    </xsl:template>
    <!-- end of root template -->
</xsl:stylesheet>