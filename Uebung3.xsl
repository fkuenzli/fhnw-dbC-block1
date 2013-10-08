<xsl:template match="/">
	<xsl:for-each select="company/projects/project[name='P3']">
		<xsl:value-of select="duration">
	</xsl:for-each>
	
	<xsl:key name="members" match="employee" use="@id"/>
	
	<xsl:for-each select="key('employee',)">
	
	</xsl:for-each>
	
</xsl:template>