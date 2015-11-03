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

<!-- = mediaobject % db2mal.block.mode = -->
<xsl:template mode="db2mal.block.mode" match="mediaobject | db:mediaobject">
  <!-- FIXME: info -->
  <!-- FIXME caption -->
  <xsl:variable name="medias" select="audioobject | imageobject | imageobjectco | textobject |
                                      videoobject | db:audioobject | db:imageobject |
                                      db:imageobjectco | db:textobject | db:videoobject"/>
  <xsl:apply-templates mode="db2mal.media.mode" select="$medias[1]">
    <xsl:with-param name="fallback" select="$medias[position() != 1]"/>
    <xsl:with-param name="display" select="'block'"/>
  </xsl:apply-templates>
</xsl:template>

<!-- = imageobject = -->
<xsl:template mode="db2mal.media.mode" match="imageobject | db:imageobject">
  <xsl:param name="fallback" select="/false"/>
  <xsl:param name="display" select="'block'"/>
  <!-- FIXME: svg and mathml imagedatas -->
  <media type="image">
    <!-- FIXME: @align @contentdepth @contentwidth @scale @scalefit @valign @width -->
    <!-- FIXME: convert format to mallard mime attr -->
    <xsl:attribute name="src">
      <!-- FIXME: may be entityref instead of fileref -->
      <xsl:value-of select="(imagedata | db:imagedata)[1]/@fileref"/>
    </xsl:attribute>
    <xsl:for-each select="$fallback[1]">
      <xsl:apply-templates mode="db2mal.media.mode" select=".">
        <xsl:with-param name="fallback" select="$fallback[position() != 1]"/>
        <xsl:with-param name="display" select="$display"/>
      </xsl:apply-templates>
    </xsl:for-each>
  </media>
</xsl:template>

<!-- = * = -->
<xsl:template mode="db2mal.media.mode" match="*">
  <xsl:message>
    <xsl:text>Unmatched media element: </xsl:text>
    <xsl:value-of select="local-name(.)"/>
  </xsl:message>
</xsl:template>

</xsl:stylesheet>
