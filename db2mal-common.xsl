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

<xsl:template name="db2mal.style.attr">
  <xsl:param name="node" select="."/>
  <xsl:param name="role" select="$node/@role"/>
  <xsl:param name="style" select="''"/>
  <xsl:if test="$role != '' or $style != ''">
    <xsl:attribute name="style">
      <xsl:value-of select="$style"/>
      <xsl:if test="$role != '' and $style != ''">
        <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:value-of select="$role"/>
    </xsl:attribute>
  </xsl:if>
</xsl:template>

<xsl:template mode="db2mal.copy.mode" match="*">
  <!-- FIXME: put no-namespace in db5 ns -->
  <xsl:copy-of select="."/>
</xsl:template>

</xsl:stylesheet>
