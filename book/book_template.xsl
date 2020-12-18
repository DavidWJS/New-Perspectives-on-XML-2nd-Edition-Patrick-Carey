<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!-- start of root template -->
    <xsl:template match="/">
        <html>
            <head></head>
            <body>
                Total Number of Books: <xsl:value-of select="count(books/book)"/>
                <p></p>
                <table border="1">
                    <xsl:call-template name="headertemplate1"/>
                    <xsl:apply-templates select="books/book"/>
                </table>
                <hr/>
                <table border="1">
                    <xsl:call-template name="headertemplate2"/>
                    <xsl:apply-templates select="books/book[author='John Steinbeck']"/>
                </table>
                <hr/>
                <table border="1">
                    <xsl:call-template name="headertemplate3"/>
                    <xsl:apply-templates select="books/book[pubyear >= 1930]"/>
                </table>
                <hr/>
                <table border="1">
                    <xsl:call-template name="headertemplate4"/>
                    <xsl:apply-templates select="books/book[pubyear &lt; 1930]"/>
                </table>
            </body>
        </html>
    </xsl:template>
    <!-- end of root template -->
    
    <!-- start of header template -->
    <xsl:template name="headertemplate1">
        <tr><th colspan="3">All Books</th></tr>
        <tr><th>Author</th><th>Title</th><th>Publication Year</th></tr>
    </xsl:template>
    <xsl:template name="headertemplate2">
        <tr><th colspan="3">John Steinbeck Books</th></tr>
        <tr><th>Author</th><th>Title</th><th>Publication Year</th></tr>
    </xsl:template>
    <xsl:template name="headertemplate3">
        <tr><th colspan="3">Books Published on/After 1930</th></tr>
        <tr><th>Author</th><th>Title</th><th>Publication Year</th></tr>
    </xsl:template>
    <xsl:template name="headertemplate4">
        <tr><th colspan="3">Books Published on/Before 1930</th></tr>
        <tr><th>Author</th><th>Title</th><th>Publication Year</th></tr>
    </xsl:template>
    <!-- end of header template -->
    
    <!-- start of book template -->
    <xsl:template match="book">
        <tr>
            <td><xsl:value-of select="author"/></td>
            <td><xsl:value-of select="title"/></td>
            <td><xsl:value-of select="pubyear"/></td>
        </tr>
    </xsl:template>
    <!-- end of book template -->
    
</xsl:stylesheet>