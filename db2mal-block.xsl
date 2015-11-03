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

<xsl:template name="db2mal.block.contents">
  <xsl:param name="node" select="."/>
  <!-- FIXME: DocBook allows mixed inline/block content.
       This is where we'll handle it. -->
<!--
  <xsl:apply-templates mode="db2mal.inline.mode" select="($node/self::* | $node/self::db:*)[1]/node()"/>
-->
  <xsl:apply-templates mode="db2mal.inline.mode" select="$node/node()"/>
</xsl:template>

<!-- = beginpage = -->
<xsl:template mode="db2mal.block.mode" match="beginpage | db:beginpage">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = caution = -->
<xsl:template mode="db2mal.block.mode" match="caution | db:caution">
  <note>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="concat('warning ', local-name(.))"/>
    </xsl:call-template>
    <xsl:apply-templates mode="db2mal.block.mode"/>
  </note>
</xsl:template>

<!-- = figure = -->
<xsl:template mode="db2mal.block.mode" match="figure | db:figure">
  <figure>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style">
        <xsl:value-of select="local-name(.)"/>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:for-each select="title | db:title">
      <title>
        <xsl:call-template name="db2mal.style.attr"/>
        <xsl:apply-templates mode="db2mal.inline.mode"/>
      </title>
    </xsl:for-each>
    <!-- FIXME: db:caption. Can't turn it into desc, because db:caption holds blocks -->
    <xsl:apply-templates mode="db2mal.block.mode"
                         select="*[not(self::blockinfo or self::title or self::titleabbrev or
                                       self::db:title or self::db:titleabbrev or self::db:info or
                                       self::db:caption)]"/>
  </figure>
</xsl:template>

<!-- = important = -->
<xsl:template mode="db2mal.block.mode" match="important | db:important">
  <note>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:apply-templates mode="db2mal.block.mode"/>
  </note>
</xsl:template>

<!-- = note = -->
<xsl:template mode="db2mal.block.mode" match="note | db:note">
  <note>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:apply-templates mode="db2mal.block.mode"/>
  </note>
</xsl:template>

<!-- = para = -->
<xsl:template mode="db2mal.block.mode" match="para | db:para">
  <p>
    <xsl:call-template name="db2mal.style.attr"/>
    <xsl:call-template name="db2mal.block.contents"/>
  </p>
</xsl:template>

<!-- = programlisting = -->
<xsl:template mode="db2mal.block.mode"
              match="programlisting | db:programlisting">
  <!-- FIXME: language, continuation, format, startinglinenumber -->
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style">
        <xsl:value-of select="local-name(.)"/>
        <xsl:if test="@linenumbering = 'numbered'">
          <xsl:text> numbered</xsl:text>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="db2mal.block.contents"/>
  </code>
</xsl:template>

<!-- = screen = -->
<xsl:template mode="db2mal.block.mode" match="screen | db:screen">
  <!-- FIXME: language, continuation, format, startinglinenumber -->
  <screen>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style">
        <xsl:value-of select="local-name(.)"/>
        <xsl:if test="@linenumbering = 'numbered'">
          <xsl:text> numbered</xsl:text>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="db2mal.block.contents"/>
  </screen>
</xsl:template>

<!-- = screenshot = -->
<xsl:template mode="db2mal.block.mode" match="screenshot | db:screenshot">
  <figure>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style">
        <xsl:value-of select="local-name(.)"/>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:for-each select="db:title">
      <title>
        <xsl:call-template name="db2mal.style.attr"/>
        <xsl:apply-templates mode="db2mal.inline.mode"/>
      </title>
    </xsl:for-each>
    <xsl:for-each select="db:subtitle">
      <desc>
        <xsl:call-template name="db2mal.style.attr"/>
        <xsl:apply-templates mode="db2mal.inline.mode"/>
      </desc>
    </xsl:for-each>
    <xsl:apply-templates mode="db2mal.block.mode"
                         select="graphic | graphicco | mediaobjectco |
                                 mediaobject | db:mediaobject"/>
  </figure>
</xsl:template>

<!-- = sidebar = -->
<xsl:template mode="db2mal.block.mode" match="sidebar | db:sidebar">
  <note>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:for-each select="title | db:title">
      <title>
        <xsl:call-template name="db2mal.style.attr"/>
        <xsl:apply-templates mode="db2mal.inline.mode"/>
      </title>
    </xsl:for-each>
    <!-- FIXME: db:subtitle -->
    <xsl:if test="db:subtitle">
      <xsl:message>
        <xsl:text>Unmatched sidebar subtitle</xsl:text>
      </xsl:message>
    </xsl:if>
    <xsl:apply-templates mode="db2mal.block.mode"
                         select="*[not(self::sidebarinfo or self::title or self::titleabbrev or
                                       self::db:title or self::db:titleabbrev or self::db:subtitle or
                                       self::db:info)]"/>
  </note>
</xsl:template>

<!-- = simpara = -->
<xsl:template mode="db2mal.block.mode" match="simpara | db:simpara">
  <p>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style">
        <xsl:value-of select="local-name(.)"/>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </p>
</xsl:template>

<!-- = tip = -->
<xsl:template mode="db2mal.block.mode" match="tip | db:tip">
  <note>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:apply-templates mode="db2mal.block.mode"/>
  </note>
</xsl:template>

<!-- = title = -->
<xsl:template mode="db2mal.block.mode" match="title | db:title">
  <title>
    <xsl:call-template name="db2mal.style.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </title>
</xsl:template>

<!-- = titleabbrev = -->
<xsl:template mode="db2mal.block.mode" match="titleabbrev | db:titleabbrev"/>

<!-- = warning = -->
<xsl:template mode="db2mal.block.mode" match="warning | db:warning">
  <note>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:apply-templates mode="db2mal.block.mode"/>
  </note>
</xsl:template>

<!-- = * = -->
<xsl:template mode="db2mal.block.mode" match="*">
  <xsl:message>
    <xsl:text>Unmatched block element: </xsl:text>
    <xsl:value-of select="local-name(.)"/>
  </xsl:message>
  <p>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </p>
</xsl:template>

</xsl:stylesheet>
