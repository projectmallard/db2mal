<?xml version='1.0' encoding='UTF-8'?><!-- -*- indent-tabs-mode: nil -*- -->
<!--
This program is free software; you can redistribute it and/or modify it under
the terms of the GNU Lesser General Public License as published by the Free
Software Foundation; either version 2 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
details.

You should have received a copy of the GNU Lesser General Public License
along with this program; see the file COPYING.LGPL.  If not, see
<http://www.gnu.org/licenses/>.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:mml="http://www.w3.org/1998/Math/MathML"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:mal="http://projectmallard.org/1.0/"
                xmlns="http://projectmallard.org/1.0/"
                exclude-result-prefixes="db mal mml"
                version="1.0">

<!-- = itemizedlist = -->
<xsl:template mode="db2mal.block.mode" match="itemizedlist | db:itemizedlist">
  <!-- FIXME: blockinfo -->
  <list>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style">
	<xsl:value-of select="local-name(.)"/>
	<xsl:if test="@spacing = 'compact'">
	  <xsl:text> compact</xsl:text>
	</xsl:if>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:apply-templates mode="db2mal.block.mode" select="title | db:title"/>
    <!-- FIXME: what to do about leading blocks? -->
    <xsl:for-each select="listitem | db:listitem">
      <item>
	<xsl:apply-templates mode="db2mal.block.mode"/>
      </item>
    </xsl:for-each>
  </list>
</xsl:template>

<!-- = procedure = -->
<xsl:template mode="db2mal.block.mode" match="procedure | db:procedure">
  <!-- FIXME: blockinfo -->
  <steps>
    <xsl:call-template name="db2mal.style.attr"/>
    <xsl:apply-templates mode="db2mal.block.mode" select="title | db:title"/>
    <!-- FIXME: what to do about leading blocks? -->
    <xsl:for-each select="step | db:step">
      <!-- FIXME: @performance -->
      <item>
	<xsl:call-template name="db2mal.style.attr"/>
	<xsl:apply-templates mode="db2mal.block.mode"/>
      </item>
    </xsl:for-each>
  </steps>
</xsl:template>

<!-- = stepalternatives = -->
<xsl:template mode="db2mal.block.mode" match="stepalternatives | db:stepalternatives">
  <!-- FIXME: @performance -->
  <list>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:for-each select="step | db:step">
      <item>
	<xsl:call-template name="db2mal.style.attr"/>
	<xsl:apply-templates mode="db2mal.block.mode"/>
      </item>
    </xsl:for-each>
  </list>
</xsl:template>

<!-- = substeps = -->
<xsl:template mode="db2mal.block.mode" match="substeps | db:substeps">
  <!-- FIXME: @performance -->
  <steps>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:for-each select="step | db:step">
      <item>
	<xsl:call-template name="db2mal.style.attr"/>
	<xsl:apply-templates mode="db2mal.block.mode"/>
      </item>
    </xsl:for-each>
  </steps>
</xsl:template>

<!-- = variablelist = -->
<xsl:template mode="db2mal.block.mode" match="variablelist | db:variablelist">
  <!-- FIXME: blockinfo -->
  <terms>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style">
	<xsl:value-of select="local-name(.)"/>
	<xsl:if test="@spacing = 'compact'">
	  <xsl:text> compact</xsl:text>
	</xsl:if>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:apply-templates mode="db2mal.block.mode" select="title | db:title"/>
    <!-- FIXME: what to do about leading blocks? -->
    <xsl:for-each select="varlistentry | db:varlistentry">
      <item>
	<xsl:call-template name="db2mal.style.attr"/>
	<xsl:for-each select="term | db:term">
	  <title>
	    <xsl:apply-templates mode="db2mal.inline.mode"/>
	  </title>
	</xsl:for-each>
	<xsl:apply-templates mode="db2mal.block.mode"
			     select="listitem/* | db:listitem/*"/>
      </item>
    </xsl:for-each>
  </terms>
</xsl:template>

</xsl:stylesheet>
