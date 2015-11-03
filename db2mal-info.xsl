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

<!-- = artpagenums = -->
<xsl:template mode="db2mal.info.mode" match="artpagenums | db:artpagenums">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = author = -->
<xsl:template mode="db2mal.info.mode" match="author | db:author">
  <credit type="author">
    <name>
      <xsl:call-template name="db.personname"/>
    </name>
    <xsl:for-each select="email | db:email">
      <email>
        <xsl:apply-templates mode="db2mal.inline.mode"/>
      </email>
    </xsl:for-each>
    <xsl:apply-templates mode="db2mal.copy.mode"
                         select="personblurb | address |
                                 db:address | db:affiliation | db:contrib |
                                 db:personblurb | db:uri"/>
  </credit>
</xsl:template>

<!-- = authorgroup = -->
<xsl:template mode="db2mal.info.mode" match="authorgroup | db:authorgroup">
  <xsl:apply-templates mode="db2mal.info.mode"/>
</xsl:template>

<!-- = collab = -->
<xsl:template mode="db2mal.info.mode" match="collab | db:collab">
  <credit type="collab">
    <name>
      <xsl:call-template name="db.personname"/>
    </name>
    <xsl:apply-templates mode="db2mal.copy.mode" select="db:affiliation"/>
  </credit>
</xsl:template>

<!-- = contractnum = -->
<xsl:template mode="db2mal.info.mode" match="contractnum | db:contractnum">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = contrib = -->
<xsl:template mode="db2mal.info.mode" match="contrib | db:contrib">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = confgroup = -->
<xsl:template mode="db2mal.info.mode" match="confgroup | db:confgroup">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = contractsponsor = -->
<xsl:template mode="db2mal.info.mode" match="contractsponsor | db:contractsponsor">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = copyright = -->
<xsl:template mode="db2mal.info.mode" match="copyright | db:copyright">
  <xsl:variable name="node" select="."/>
  <!-- FIXME: DocBook can express a copyright without a holder. Mallard can't. -->
  <xsl:for-each select="holder | db:holder">
    <credit type="copyright">
      <name>
        <xsl:apply-templates mode="db2mal.inline.mode"/>
      </name>
      <years>
        <xsl:for-each select="year | db:year">
          <xsl:apply-templates mode="db2mal.inline.mode"/>
          <xsl:if test="position() != last()">
            <xsl:text>, </xsl:text>
          </xsl:if>
        </xsl:for-each>
      </years>
    </credit>
  </xsl:for-each>
</xsl:template>

<!-- = edition = -->
<xsl:template mode="db2mal.info.mode" match="edition | db:edition">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = editor = -->
<xsl:template mode="db2mal.info.mode" match="editor | db:editor">
  <credit type="editor">
    <name>
      <xsl:call-template name="db.personname"/>
    </name>
    <xsl:for-each select="email | db:email">
      <email>
        <xsl:apply-templates mode="db2mal.inline.mode"/>
      </email>
    </xsl:for-each>
    <xsl:apply-templates mode="db2mal.copy.mode"
                         select="personblurb | address |
                                 db:address | db:affiliation | db:contrib |
                                 db:personblurb | db:uri"/>
  </credit>
</xsl:template>

<!-- = invpartnumber = -->
<xsl:template mode="db2mal.info.mode" match="invpartnumber">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = isbn = -->
<xsl:template mode="db2mal.info.mode" match="isbn">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = issn = -->
<xsl:template mode="db2mal.info.mode" match="issn">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = issuenum = -->
<xsl:template mode="db2mal.info.mode" match="issuenum | db:issuenum">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = org = -->
<xsl:template mode="db2mal.info.mode" match="org | db:org">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = orgname = -->
<xsl:template mode="db2mal.info.mode" match="orgname | db:orgname">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = othercredit = -->
<xsl:template mode="db2mal.info.mode" match="othercredit | db:othercredit">
  <credit>
    <name>
      <xsl:call-template name="db.personname"/>
    </name>
    <xsl:for-each select="email | db:email">
      <email>
        <xsl:apply-templates mode="db2mal.inline.mode"/>
      </email>
    </xsl:for-each>
    <xsl:apply-templates mode="db2mal.copy.mode"
                         select="personblurb | address |
                                 db:address | db:affiliation | db:contrib |
                                 db:personblurb | db:uri"/>
  </credit>
</xsl:template>

<!-- = pagenums = -->
<xsl:template mode="db2mal.info.mode" match="pagenums | db:pagenums">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = printhistory = -->
<xsl:template mode="db2mal.info.mode" match="printhistory | db:printhistory">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = productname = -->
<xsl:template mode="db2mal.info.mode" match="productname | db:productname">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = productnumber = -->
<xsl:template mode="db2mal.info.mode" match="productnumber | db:productnumber">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = pubdate = -->
<xsl:template mode="db2mal.info.mode" match="pubdate | db:pubdate">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = publisher = -->
<xsl:template mode="db2mal.info.mode" match="publisher | db:publisher">
  <credit type="publisher">
    <name>
      <xsl:apply-templates mode="db2mal.inline.mode"
                           select="publishername/node() | db:publishername/node()"/>
    </name>
    <xsl:apply-templates mode="db2mal.copy.mode" select="db:address"/>
  </credit>
</xsl:template>

<!-- = publishername = -->
<xsl:template mode="db2mal.info.mode" match="publishername | db:publishername">
  <credit type="publisher">
    <name>
      <xsl:apply-templates mode="db2mal.inline.mode"/>
    </name>
  </credit>
</xsl:template>

<!-- = releaseinfo = -->
<xsl:template mode="db2mal.info.mode" match="releaseinfo | db:releaseinfo">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = seriesvolnums = -->
<xsl:template mode="db2mal.info.mode" match="seriesvolnums | db:seriesvolnums">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = subjectset = -->
<xsl:template mode="db2mal.info.mode" match="subjectset | db:subjectset">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = volumenum = -->
<xsl:template mode="db2mal.info.mode" match="volumenum | db:volumenum">
  <xsl:apply-templates mode="db2mal.copy.mode" select="."/>
</xsl:template>

<!-- = * = -->
<xsl:template mode="db2mal.info.mode" match="*">
  <xsl:message>
    <xsl:text>Unmatched info element: </xsl:text>
    <xsl:value-of select="local-name(.)"/>
  </xsl:message>
</xsl:template>

</xsl:stylesheet>
