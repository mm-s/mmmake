<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text"/>

<xsl:param name="tgt"/> 

<xsl:template match="/">
	<xsl:apply-templates/>
</xsl:template>
<xsl:template match="text()"/>
<xsl:template match="project/target/dependencies/library">
	<xsl:variable name="co">
		<xsl:value-of select="../../@name"/>
   	</xsl:variable>
	<xsl:if test="string-length($tgt) = 0">
   		<xsl:value-of select="@name"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:if>
	<xsl:if test="$tgt = $co">
   		<xsl:value-of select="@name"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>
