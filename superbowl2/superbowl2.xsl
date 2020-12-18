<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h2>Super Bowl</h2>
                <table border="1">
                    <tr><th colspan="5">Super Bowl</th></tr>
                    <tr>
                        <th>No.</th>
                        <th>Date</th>
                        <th>Location</th>
                        <th>Winner</th>
                        <th>Result</th>
                    </tr>
                    <xsl:apply-templates select="root/row"/>
                </table>
                <p></p>
                1. Teams who won the SB after 1960:<br/>
                <xsl:for-each select="root/row">
                    <xsl:if test="substring-after(Date, ',') > 1960">
                        <xsl:value-of select="Winner"/><br/>
                    </xsl:if>
                </xsl:for-each>
                <!-- diffrent way to display it with using template
                but this is really case sensitive
                it has to be match with the length
                <table border="1">
                    <tr><th colspan="5">Super Bowls after 1960</th></tr>
                    <tr>
                        <th>No.</th>
                        <th>Date</th>
                        <th>Location</th>
                        <th>Winner</th>
                        <th>Result</th>
                    </tr>
                    <xsl:apply-templates select="root/row[substring(Date,10,13) > 1960]"/>
                </table> -->
                <p></p>
                2. The number New York Giants won SB:
                <!-- different way to display it with using template
                <table border="1">
                    <tr><th colspan="5">Super Bowls won by NY Giants</th></tr>
                    <tr>
                        <th>No.</th>
                        <th>Date</th>
                        <th>Location</th>
                        <th>Winner</th>
                        <th>Result</th>
                    </tr>
                    <xsl:apply-templates select="root/row[Winner = 'New York Giants']"/>
                    <tr>
                        <td colspan="4" align="right"><b>Count:</b></td>
                        <td><xsl:value-of select="count(root/row[Winner = 'New York Giants'])"/></td>
                    </tr>
                </table> -->
                <xsl:value-of select="count(root/row[Winner = 'New York Giants'])"/>
                <p></p>
                3. The Team who won the SP most time:
                
                <p></p>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="row">
        <tr>
            <td><xsl:value-of select="No."/></td>
            <td><xsl:value-of select="Date"/></td>
            <td><xsl:value-of select="Location"/></td>
            <td><xsl:value-of select="Winner"/></td>
            <td><xsl:value-of select="Result"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>