<?xml version="1.0" encoding="UTF-8" ?>

<!--

 * Written by Fabian Kuenzli
 * University of Applied Sciences of Northwestern Switzerland, FHNW
 * Computer Science, iCompetence
 * (c) 2013

-->

<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:d="urn:dbc.fkuenzli"
				>

	<xsl:output
		method="html"
		version="4.0"
		encoding="UTF-8"
		indent="yes" />

	<xsl:template match="/">

		<html>

			<body>
				<table>
					<tr>
						<th>Name</th>
						<th></th>
						<th>Social Media</th>
						<th>Skype</th>
						<th>Adresse</th>
					</tr>
					<xsl:for-each select="d:zhaw/d:persons/d:person">
						<tr>
							<td>
								<a href="mailto:{d:email}"><xsl:value-of select="d:lastname"/></a>
							</td>
							<td>
								<img src="{d:kuerzel}" width="" height=""></img>
							</td>
							<td>
								<a href="https://twitter.com/{twitter}">twitter ({d:twitter})</a><br />
								<a href="{d:facebook}">Facebook</a>
							</td>
							<td>
								<a href="skype:{d:skype}">Skype</a>
							</td>
							<td>
								Longitude: <xsl:value-of select="d:googlemaps/@longitude"/> <br />
								Latitude: <xsl:value-of select="d:googlemaps/@latitude"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>