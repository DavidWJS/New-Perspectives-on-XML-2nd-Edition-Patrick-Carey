<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head></head>
            <body>
                <table border="1">
                    <tr>
                        <th colspan="2">All My Books</th>
                    </tr>
                    <tr>
                        <th>Author</th>
                        <th>Title</th>
                    </tr>
                    <xsl:for-each select="books/book">
                        <tr>
                            <td><xsl:value-of select="author"/></td>
                            <td><xsl:value-of select="title"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <hr/>
                <table border="1">
                    <tr>
                        <th colspan="2">John Steinbeck books</th>
                    </tr>
                    <tr>
                        <th>Author</th>
                        <th>Title</th>
                    </tr>
                    <xsl:for-each select="books/book">
                        <xsl:if test="author='John Steinbeck'">
                            <tr>
                                <td><xsl:value-of select="author"/></td>
                                <td><xsl:value-of select="title"/></td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>