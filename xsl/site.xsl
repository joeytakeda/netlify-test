<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/1999/xhtml"
    version="2.0">
    
    <!--This stylesheet runs on itself to make 1000 pages-->
    
    <xsl:template name="createPages">
        <xsl:for-each select="1 to 500">
            <xsl:message>Creating <xsl:value-of select="."/></xsl:message>
            <xsl:result-document href="products/doc_{.}.html" method="xml">
                <xsl:variable name="lorem" select="unparsed-text('https://baconipsum.com/api/?type=meat-and-filler')"/>
                <html>
                    <head><title>TEST <xsl:value-of select="."/></title></head>
                    <body>
                        <p>
                            <xsl:value-of select="replace($lorem,'^\[|\]$','')"/>
                        </p>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
        
    </xsl:template>
    
</xsl:stylesheet>