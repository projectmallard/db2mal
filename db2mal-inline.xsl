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

<xsl:template mode="db.info.inline.mode" match="*">
  <xsl:apply-templates mode="db2mal.inline.mode" select="."/>
</xsl:template>

<!-- FIXME: convert ubiquitous linking on inlines -->
<xsl:template name="db2mal.xref.attr">
</xsl:template>

<!-- = abbrev = -->
<xsl:template mode="db2mal.inline.mode" match="abbrev | db:abbrev">
  <span>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </span>
</xsl:template>

<!-- = accel = -->
<xsl:template mode="db2mal.inline.mode" match="accel | db:accel">
  <span>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </span>
</xsl:template>

<!-- = acronym = -->
<xsl:template mode="db2mal.inline.mode" match="acronym | db:acronym">
  <span>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </span>
</xsl:template>

<!-- = action = -->
<xsl:template mode="db2mal.inline.mode" match="action">
  <span>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </span>
</xsl:template>

<!-- = application = -->
<xsl:template mode="db2mal.inline.mode" match="application | db:application">
  <app>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style">
        <xsl:value-of select="@class"/>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </app>
</xsl:template>

<!-- = author = -->
<xsl:template mode="db2mal.inline.mode" match="author | db:author">
  <span>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:call-template name="db.personname"/>
  </span>
</xsl:template>

<!-- = beginpage = -->
<xsl:template mode="db2mal.inline.mode" match="beginpage | db:beginpage">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = citetitle = -->
<xsl:template mode="db2mal.inline.mode" match="citetitle | db:citetitle">
  <em>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </em>
</xsl:template>

<!-- = classname = -->
<xsl:template mode="db2mal.inline.mode" match="classname | db:classname">
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = code = -->
<xsl:template mode="db2mal.inline.mode" match="code | db:code">
  <code>
    <!-- FIXME convert @language to @mime -->
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = command = -->
<xsl:template mode="db2mal.inline.mode" match="command | db:command">
  <cmd>
    <xsl:call-template name="db2mal.style.attr"/>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </cmd>
</xsl:template>

<!-- = computeroutput = -->
<xsl:template mode="db2mal.inline.mode" match="computeroutput | db:computeroutput">
  <output>
    <xsl:call-template name="db2mal.style.attr"/>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </output>
</xsl:template>

<!-- = constant = -->
<xsl:template mode="db2mal.inline.mode" match="constant | db:constant">
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = database = -->
<xsl:template mode="db2mal.inline.mode" match="database | db:database">
  <app>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style">
        <xsl:value-of select="local-name(.)"/>
        <xsl:if test="@class">
          <xsl:text> </xsl:text>
          <xsl:value-of select="@class"/>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </app>
</xsl:template>

<!-- = editor = -->
<xsl:template mode="db2mal.inline.mode" match="editor | db:editor">
  <span>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:call-template name="db.personname"/>
  </span>
</xsl:template>

<!-- = email = -->
<xsl:template mode="db2mal.inline.mode" match="email | db:email">
  <sys>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </sys>
</xsl:template>

<!-- = emphasis = -->
<xsl:template mode="db2mal.inline.mode" match="emphasis | db:emphasis">
  <em>
    <xsl:call-template name="db2mal.style.attr"/>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </em>
</xsl:template>

<!-- = envar = -->
<xsl:template mode="db2mal.inline.mode" match="envar | db:envar">
  <sys>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </sys>
</xsl:template>

<!-- = errorcode = -->
<xsl:template mode="db2mal.inline.mode" match="errorcode | db:errorcode">
  <sys>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </sys>
</xsl:template>

<!-- = errorname = -->
<xsl:template mode="db2mal.inline.mode" match="errorname | db:errorname">
  <sys>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </sys>
</xsl:template>

<!-- = errortext = -->
<xsl:template mode="db2mal.inline.mode" match="errortext | db:errortext">
  <output>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style">
        <xsl:text>error </xsl:text>
        <xsl:value-of select="local-name(.)"/>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </output>
</xsl:template>

<!-- = errortype = -->
<xsl:template mode="db2mal.inline.mode" match="errortype | db:errortype">
  <sys>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </sys>
</xsl:template>

<!-- = exceptionname = -->
<xsl:template mode="db2mal.inline.mode" match="exceptionname | db:exceptionname">
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = filename = -->
<xsl:template mode="db2mal.inline.mode" match="filename | db:filename">
  <file>
    <xsl:call-template name="db2mal.style.attr"/>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </file>
</xsl:template>

<!-- = firstterm = -->
<xsl:template mode="db2mal.inline.mode" match="firstterm | db:firstterm">
  <em>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </em>
</xsl:template>

<!-- = foreignphrase = -->
<xsl:template mode="db2mal.inline.mode" match="foreignphrase | db:foreignphrase">
  <em>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </em>
</xsl:template>

<!-- = function = -->
<xsl:template mode="db2mal.inline.mode" match="function | db:function">
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = gui* = -->
<xsl:template mode="db2mal.inline.mode"
              match="guibutton | db:guibutton | guiicon | db:guiicon |
                     guilabel | db:guilabel | guimenu | db:guimenu |
                     guimenuitem | db:guimenuitem | guisubmenu | db:guisubmenu">
  <gui>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </gui>
</xsl:template>

<!-- = hardware = -->
<xsl:template mode="db2mal.inline.mode" match="hardware | db:hardware">
  <sys>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </sys>
</xsl:template>

<!-- = initializer = -->
<xsl:template mode="db2mal.inline.mode" match="initializer | db:initializer">
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = interface = -->
<xsl:template mode="db2mal.inline.mode" match="interface">
  <gui>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </gui>
</xsl:template>

<!-- = interfacename = -->
<xsl:template mode="db2mal.inline.mode" match="interfacename | db:interfacename">
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = jobtitle = -->
<xsl:template mode="db2mal.inline.mode" match="jobtitle | db:jobtitle">
  <span>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </span>
</xsl:template>

<!-- = keycap = -->
<xsl:template mode="db2mal.inline.mode" match="keycap | db:keycap">
  <!-- FIXME: @function, @moreinfo -->
  <key>
    <xsl:call-template name="db2mal.style.attr"/>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </key>
</xsl:template>

<!-- = keycode = -->
<xsl:template mode="db2mal.inline.mode" match="keycode | db:keycode">
  <sys>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </sys>
</xsl:template>

<!-- = keycombo = -->
<xsl:template mode="db2mal.inline.mode" match="keycombo | db:keycombo">
  <keyseq>
    <xsl:if test="@action = 'seq'">
      <!-- FIXME: click, double-click, press, @otheraction -->
      <xsl:attribute name="type">
        <xsl:text>seqeunce</xsl:text>
      </xsl:attribute>
    </xsl:if>
    <xsl:call-template name="db2mal.style.attr"/>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:for-each select="*">
      <xsl:choose>
        <xsl:when test="self::keycap or self::db:keycap">
          <xsl:apply-templates mode="db2mal.inline.mode" select="."/>
        </xsl:when>
        <xsl:otherwise>
          <keyseq>
            <xsl:call-template name="db2mal.style.attr">
              <xsl:with-param name="style" select="local-name(.)"/>
            </xsl:call-template>
            <xsl:call-template name="db2mal.xref.attr"/>
            <xsl:apply-templates mode="db2mal.inline.mode" select="."/>
          </keyseq>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </keyseq>
</xsl:template>

<!-- = keysym = -->
<xsl:template mode="db2mal.inline.mode" match="keysym | db:keysym">
  <sys>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </sys>
</xsl:template>

<!-- = literal = -->
<xsl:template mode="db2mal.inline.mode" match="literal | db:literal">
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = markup = -->
<xsl:template mode="db2mal.inline.mode" match="markup | db:markup">
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = medialable = -->
<xsl:template mode="db2mal.inline.mode" match="medialable">
  <span>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style">
        <xsl:value-of select="local-name(.)"/>
        <xsl:if test="@class">
          <xsl:text> </xsl:text>
          <xsl:value-of select="@class"/>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </span>
</xsl:template>

<!-- = menuchoice = -->
<xsl:template mode="db2mal.inline.mode" match="menuchoice | db:menuchoice">
  <guiseq>
    <xsl:call-template name="db2mal.style.attr"/>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"
                         select="*[not(self::shortcut or self::db:shortcut)]"/>
  </guiseq>
  <xsl:if test="shortcut | db:shortcut">
    <xsl:text> </xsl:text>
    <xsl:apply-templates mode="db2mal.inline.mode" select="shortcut | db:shortcut"/>
  </xsl:if>
</xsl:template>

<!-- = methodname = -->
<xsl:template mode="db2mal.inline.mode" match="methodname | db:methodname">
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = modifier = -->
<xsl:template mode="db2mal.inline.mode" match="modifier | db:modifier">
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = mousebutton = -->
<xsl:template mode="db2mal.inline.mode" match="mousebutton | db:mousebutton">
  <span>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </span>
</xsl:template>

<!-- = option = -->
<xsl:template mode="db2mal.inline.mode" match="option | db:option">
  <cmd>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </cmd>
</xsl:template>

<!-- = org = -->
<xsl:template mode="db2mal.inline.mode" match="org | db:org">
  <span>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode" select="orgname | db:orgname"/>
  </span>
</xsl:template>

<!-- = orgname = -->
<xsl:template mode="db2mal.inline.mode" match="orgname | db:orgname">
  <span>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </span>
</xsl:template>

<!-- = package = -->
<xsl:template mode="db2mal.inline.mode" match="package | db:package">
  <sys>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </sys>
</xsl:template>

<!-- = phrase = -->
<xsl:template mode="db2mal.inline.mode" match="phrase | db:phrase">
  <span>
    <xsl:call-template name="db2mal.style.attr"/>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </span>
</xsl:template>

<!-- = productname = -->
<xsl:template mode="db2mal.inline.mode" match="productname | db:productname">
  <sys>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </sys>
</xsl:template>

<!-- = productnumber = -->
<xsl:template mode="db2mal.inline.mode" match="productnumber | db:productnumber">
  <sys>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </sys>
</xsl:template>

<!-- = prompt = -->
<xsl:template mode="db2mal.inline.mode" match="prompt | db:prompt">
  <output>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </output>
</xsl:template>

<!-- = property = -->
<xsl:template mode="db2mal.inline.mode" match="property | db:property">
  <sys>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </sys>
</xsl:template>

<!-- = replaceable = -->
<xsl:template mode="db2mal.inline.mode" match="replaceable | db:replaceable">
  <var>
    <xsl:call-template name="db2mal.style.attr"/>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </var>
</xsl:template>

<!-- = returnvalue = -->
<xsl:template mode="db2mal.inline.mode" match="returnvalue | db:returnvalue">
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = sgmltag = -->
<xsl:template mode="db2mal.inline.mode" match="sgmltag">
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = shortcut = -->
<xsl:template mode="db2mal.inline.mode" match="shortcut | db:shortcut">
  <span>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:text>(</xsl:text>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
    <xsl:text>)</xsl:text>
  </span>
</xsl:template>

<!-- = structfield = -->
<xsl:template mode="db2mal.inline.mode" match="structfield">
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = structname = -->
<xsl:template mode="db2mal.inline.mode" match="structname">
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = symbol = -->
<xsl:template mode="db2mal.inline.mode" match="symbol | db:symbol">
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style">
        <xsl:value-of select="local-name(.)"/>
        <xsl:if test="@class">
          <xsl:text> </xsl:text>
          <xsl:value-of select="@class"/>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = systemitem = -->
<xsl:template mode="db2mal.inline.mode" match="systemitem | db:systemitem">
  <sys>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </sys>
</xsl:template>

<!-- = tag = -->
<xsl:template mode="db2mal.inline.mode" match="db:tag">
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style">
        <xsl:value-of select="local-name(.)"/>
        <xsl:if test="@class">
          <xsl:text> </xsl:text>
          <xsl:value-of select="@class"/>
        </xsl:if>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = trademark = -->
<xsl:template mode="db2mal.inline.mode" match="trademark | db:trademark">
  <span>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
    <xsl:choose>
      <xsl:when test="@class = 'copyright'">
        <xsl:text>©</xsl:text>
      </xsl:when>
      <xsl:when test="@class = 'registered'">
        <xsl:text>®</xsl:text>
      </xsl:when>
      <xsl:when test="@class = 'service'">
        <xsl:text>℠</xsl:text>
      </xsl:when>
      <xsl:when test="@class = 'trademark'">
        <xsl:text>™</xsl:text>
      </xsl:when>
    </xsl:choose>
  </span>
</xsl:template>

<!-- = token = -->
<xsl:template mode="db2mal.inline.mode" match="token | db:token">
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = type = -->
<xsl:template mode="db2mal.inline.mode" match="type | db:type">
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = ulink = -->
<xsl:template mode="db2mal.inline.mode" match="ulink | db:ulink">
  <link>
    <xsl:call-template name="db2mal.style.attr"/>
    <xsl:attribute name="href">
      <xsl:value-of select="@url"/>
    </xsl:attribute>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </link>
</xsl:template>

<!-- = uri = -->
<xsl:template mode="db2mal.inline.mode" match="uri | db:uri">
  <sys>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </sys>
</xsl:template>

<!-- = userinput = -->
<xsl:template mode="db2mal.inline.mode" match="userinput | db:userinput">
  <input>
    <xsl:call-template name="db2mal.style.attr"/>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </input>
</xsl:template>

<!-- = varname = -->
<xsl:template mode="db2mal.inline.mode" match="varname | db:varname">
  <code>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </code>
</xsl:template>

<!-- = wordasword = -->
<xsl:template mode="db2mal.inline.mode" match="wordasword | db:wordasword">
  <em>
    <xsl:call-template name="db2mal.style.attr">
      <xsl:with-param name="style" select="local-name(.)"/>
    </xsl:call-template>
    <xsl:call-template name="db2mal.xref.attr"/>
    <xsl:apply-templates mode="db2mal.inline.mode"/>
  </em>
</xsl:template>

<!-- = * = -->
<xsl:template mode="db2mal.inline.mode" match="*">
  <xsl:message>
    <xsl:text>Unmatched inline element: </xsl:text>
    <xsl:value-of select="local-name(.)"/>
  </xsl:message>
  <xsl:apply-templates mode="db2mal.inline.mode"/>
</xsl:template>

</xsl:stylesheet>
