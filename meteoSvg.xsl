<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:template match="/">
		<html>
			<head>
				<title>Meteo</title>
			</head>
			<body>
				<xsl:for-each select="meteo/mesure[@date = xs:date('2006-01-01')]">
					<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="700" xmlns:xlink="http://www.w3.org/1999/xlink">
						<line x1="10" y1="600" x2="900" y2="600" stroke-width="2" stroke="black"/>
						<line x1="10" y1="10" x2="10" y2="600" stroke-width="2" stroke="black"/>
						<!--<text><xsl:value-of select="@date"/></text>-->
						<xsl:for-each select="ville">
							<xsl:variable name="index" select="position()"/>
							<xsl:variable name="temp" select="@temperature"/>
							<xsl:variable name="hauteur" select="$temp*10"/>
							<text font-size="13" y="620" x="{$index*100}">
								<xsl:value-of select="@nom"/>
							</text>
							<rect stroke="black" fill="black" width="20" height="{$hauteur}" x="{$index*100}" y="{600-$hauteur}">
								<animate attributeName="height" dur="2s" from="0" to="{$hauteur}"/>
								<animate attributeName="y" dur="2s" from="600" to="{600-$hauteur}"/>
							</rect>
							<text font-size="13" y="{600-($hauteur+10)}" x="{$index*100}">
								<xsl:value-of select="$temp"/>
								<animate attributeName="y" dur="2s" from="600" to="{600-($hauteur+10)}"/>
							</text>
						</xsl:for-each>
					</svg>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
