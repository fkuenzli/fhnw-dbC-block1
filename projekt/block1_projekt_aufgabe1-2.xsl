<?xml version="1.0" encoding="UTF-8" ?>

<!--

 * Written by Fabian Kuenzli
 * University of Applied Sciences of Northwestern Switzerland, FHNW
 * Computer Science, iCompetence
 * fabian.kuenzli@gmail.com
 * (c) 2013

-->

<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:d="urn:dbc.fkuenzli"
				>

	<xsl:output
		method="html"
		version="5.0"
		encoding="UTF-8"
		indent="yes" />

	<!-- get person references per project -->
	<xsl:key name="personReference" match="d:zhaw/d:projects/d:project/d:members/d:personRef" use="@idRef"/>
	
	<xsl:template match="/">

		<html>
			<head>
				<title>ZHAW Personenregister</title>
				<link href="css/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
				<link href="css/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"/>
				<link href="css/style.css" rel="stylesheet"/>
			</head>

			<body>
				<container>
					<row>
						<h1><img src="img/zhaw_logo.png" alt="ZHAW Logo"/>ZHAW Personenregister</h1>
						<table class="table table-striped">
							<tr>
								<th></th>
								<th>Name</th>
								<th>Web &#38; Social Media</th>
								<th>Skype</th>
								<th>Adresse</th>
								<th>Projekte</th>
								<th>Projektumsatz</th>
							</tr>
							<xsl:for-each select="d:zhaw/d:persons/d:person">
								<tr>
									<td>
										<a href="mailto:{d:email}"><xsl:value-of select="d:lastname"/>&#160;<xsl:value-of select="d:firstname"/></a>
									</td>
									<td>
										<img class="img-thumbnail" src="{/d:zhaw/d:configuration/d:images/d:url}{d:kuerzel}.{/d:zhaw/d:configuration/d:images/d:fileextension}" width="{/d:zhaw/d:configuration/d:images/d:width}" height="{/d:zhaw/d:configuration/d:images/d:height}"/>
									</td>
									<td>
										<a href="{d:website}" target="_blank"><span class="glyphicon glyphicon-link"></span> Web</a><br />
										<a href="https://twitter.com/{d:twitter}" target="_blank"><span class="glyphicon glyphicon-link"></span> twitter (@<xsl:value-of select="d:twitter"/>)</a><br />
										<a href="https://www.facebook.com/search/str/{d:firstname}%20{d:lastname}/users-named" target="_blank"><span class="glyphicon glyphicon-link"></span> Facebook</a>
									</td>
									<td>
										<a href="skype:{d:skype}"><span class="glyphicon glyphicon-earphone"></span>&#160;<xsl:value-of select="d:skype"/></a>
									</td>
									<td><a href="http://maps.google.com/maps?q={d:googlemaps/@longitude},{d:googlemaps/@latitude}&#038;ll={d:googlemaps/@longitude},{d:googlemaps/@latitude}&#038;z=17" target="_blank"><span class="glyphicon glyphicon-map-marker"></span>Karte</a>
									</td>

									<td>
										<ul>
											<!-- get projects names per employee -->
											<xsl:for-each select="key('personReference', @id)">
												<li><xsl:value-of select="../../d:name"/></li>
											</xsl:for-each>
										</ul>

									</td>

									<td>
										<!-- get revenues per person -->
										<xsl:variable name="projectRevenuePerMember" select="key('personReference', @id)/../../d:revenue"/>
										
										<xsl:choose>
											<!-- check how big the revenue of person's projects is -->
											<xsl:when test="sum($projectRevenuePerMember) &gt; 499">
												<span class="glyphicon glyphicon-arrow-up good"></span>
											</xsl:when>
											<xsl:when test="sum($projectRevenuePerMember) &gt; 299">
												<span class="glyphicon glyphicon-arrow-right average"></span>
											</xsl:when>
											<xsl:otherwise>
												<span class="glyphicon glyphicon-arrow-down bad"></span>
											</xsl:otherwise>
										</xsl:choose>

										<!-- print sum of project revenues -->
										<xsl:value-of select="sum($projectRevenuePerMember)"/>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</row>
				</container>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>